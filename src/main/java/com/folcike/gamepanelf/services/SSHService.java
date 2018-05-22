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
import net.schmizz.sshj.transport.verification.PromiscuousVerifier;
import net.schmizz.sshj.xfer.FileSystemFile;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import sun.nio.ch.IOUtil;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.*;

@Service
public final class SSHService {

    public void runInstallScript(Server server) throws IOException {
        Machine machine = server.getMachine();
        Game game = server.getGame();
        SSHClient sshClient = getClient(machine);
        try {
            File installScript = new File(game.getInstallScriptPath());
            sshClient.newSCPFileTransfer().upload(game.getInstallScriptPath(), getHomePath(machine));
            Session session = sshClient.startSession();
            session.exec(String.format("chmod +x %s", getHomePath(machine) + installScript.getName())).join();
            Session.Command command = session.exec(runInBash(getHomePath(machine) + installScript.getName() + getInstallParams(server)));
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
            session.exec(runInBash(getStartScriptPath(machine, game))).join();
        } finally {
            sshClient.disconnect();
        }
    }

    private String runInBash(String cmd){
        return "bash " + cmd;
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

    public String readConfigFile(Server server) throws IOException {
        return getFileContent(server, getConfigFilePath(server));
    }

    public void writeConfigFile(Server server, String data) throws IOException {
        writeToFile(server, getConfigFilePath(server), data);
    }

    private SSHClient getClient(Machine machine) throws IOException {
        SSHClient sshClient = new SSHClient();
        sshClient.addHostKeyVerifier(new PromiscuousVerifier());
        sshClient.connect(machine.getHostname());
        sshClient.authPassword(machine.getUsername(), machine.getPassword());
        sshClient.useCompression();
        return sshClient;
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

    private String getConfigFilePath(Server server){
        Game game = server.getGame();
        Machine machine = server.getMachine();
        return getHomePath(machine) + game.getConfigRootPath() + game.getConfigFileName();
    }

    private String getInstallParams(Server server){
        try {
            return server.getId() + " " + InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            throw new RuntimeException(e);
        }
    }
}
