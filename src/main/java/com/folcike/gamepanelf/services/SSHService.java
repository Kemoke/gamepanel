package com.folcike.gamepanelf.services;

import com.folcike.gamepanelf.model.Game;
import com.folcike.gamepanelf.model.Machine;
import com.folcike.gamepanelf.model.Server;
import net.schmizz.sshj.SSHClient;
import net.schmizz.sshj.common.IOUtils;
import net.schmizz.sshj.connection.channel.direct.Session;
import net.schmizz.sshj.sftp.OpenMode;
import net.schmizz.sshj.sftp.RemoteFile;
import net.schmizz.sshj.sftp.RemoteResourceInfo;
import net.schmizz.sshj.sftp.SFTPClient;
import net.schmizz.sshj.xfer.FileSystemFile;
import org.springframework.context.annotation.Bean;

import java.io.File;
import java.io.IOException;
import java.util.*;

public class SSHService {

    @Bean
    public static SSHService provideSSHService() {
        return new SSHService();
    }

    public void runInstallScript(Server server) throws IOException {
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try {
            File installScript = new File(game.getInstallScriptPath());
            sshClient.newSCPFileTransfer().upload(game.getInstallScriptPath(), getHomePath(machine));
            Session session = sshClient.startSession();
            session.exec(String.format("chmod +x %s", getHomePath(machine) + installScript.getName())).join();
            Session.Command command = session.exec(runInBash(getHomePath(machine) + installScript.getName()));
            command.join();
            String response = IOUtils.readFully(command.getInputStream()).toString();
            if (!response.equals("ok")) {
                throw new IOException(String.format("Script execution failed: %s", response));
            }
            sshClient.newSCPFileTransfer().upload(game.getStartScriptPath(), getScriptRootPath(machine, game));
            sshClient.newSCPFileTransfer().upload(game.getStopScriptPath(), getScriptRootPath(machine, game));
        } finally {
            sshClient.disconnect();
        }
    }

    public void runStartScript(Server server) throws IOException {
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try {
            Session session = sshClient.startSession();
            session.exec(runInBash(getStartScriptPath(machine, game)));
        } finally {
            sshClient.disconnect();
        }
    }

    public void runStopScript(Server server) throws IOException {
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try {
            Session session = sshClient.startSession();
            session.exec(runInBash(getStopScriptPath(machine, game)));
        } finally {
            sshClient.disconnect();
        }
    }

    public List<RemoteResourceInfo> getFileList(Server server, String path) throws IOException{
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try {
            return sshClient.newSFTPClient().ls(getScriptRootPath(machine, game) + path);
        } finally {
            sshClient.disconnect();
        }
    }

    public String getFileContent(Server server, String path) throws IOException{
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try{
            RemoteFile file = sshClient.newSFTPClient().open(getFilePath(machine, game, path));
            int fileLength = Math.toIntExact(file.length());
            byte[] buffer = new byte[fileLength];
            file.read(0, buffer, 0, fileLength);
            return new String(buffer);
        } finally {
            sshClient.disconnect();
        }
    }

    public void deleteFile(Server server, String path) throws IOException{
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try{
            sshClient.newSFTPClient().rm(getFilePath(machine, game, path));
        } finally {
            sshClient.disconnect();
        }
    }

    public void writeToFile(Server server, String path, String data) throws IOException{
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try{
            Set<OpenMode> modes = new HashSet<>(2);
            modes.add(OpenMode.CREAT);
            modes.add(OpenMode.TRUNC);
            RemoteFile file = sshClient.newSFTPClient().open(getFilePath(machine, game, path), modes);
            byte[] dataBytes = data.getBytes();
            file.write(0, dataBytes, 0, dataBytes.length);
        } finally {
            sshClient.disconnect();
        }
    }

    private SSHClient getClient(Machine machine) throws IOException {
        SSHClient sshClient = new SSHClient();
        sshClient.connect(machine.getHostname());
        sshClient.authPassword(machine.getUsername(), machine.getPassword());
        sshClient.useCompression();
        return sshClient;
    }

    private String runInBash(String scriptPath){
        return "bash " + scriptPath;
    }

    private String getHomePath(Machine machine) {
        return String.format("/home/%s/", machine.getUsername());
    }

    private String getScriptRootPath(Machine machine, Game game) {
        return getHomePath(machine) + game.getScriptRootPath();
    }

    private String getStartScriptPath(Machine machine, Game game) {
        File startScript = new File(game.getStartScriptPath());
        return getScriptPath(machine, game, startScript);
    }

    private String getStopScriptPath(Machine machine, Game game) {
        File stopScript = new File(game.getStopScriptPath());
        return getScriptPath(machine, game, stopScript);
    }

    private String getScriptPath(Machine machine, Game game, File file) {
        return getScriptRootPath(machine, game) + file.getName();
    }

    private String getFilePath(Machine machine, Game game, String path){
        return getScriptRootPath(machine, game) + path;
    }
}
