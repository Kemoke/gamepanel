package com.folcike.gamepanelf.services;

import com.folcike.gamepanelf.model.Server;
import com.folcike.gamepanelf.repository.ServerConfigValueRepository;
import com.ibasco.agql.protocols.valve.source.query.SourceRconAuthStatus;
import com.ibasco.agql.protocols.valve.source.query.client.SourceQueryClient;
import com.ibasco.agql.protocols.valve.source.query.client.SourceRconClient;
import com.ibasco.agql.protocols.valve.source.query.exceptions.RconNotYetAuthException;
import com.ibasco.agql.protocols.valve.source.query.pojos.SourceServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Service
public final class SourceQueryService {

    private ServerConfigValueRepository serverConfigValueRepository;

    @Autowired
    public SourceQueryService(ServerConfigValueRepository serverConfigValueRepository){
        this.serverConfigValueRepository = serverConfigValueRepository;
    }

    private SourceRconClient getRconClient(Server server){
        SourceRconClient client = new SourceRconClient();
        String rcon_password = serverConfigValueRepository.findByServer_IdAndConfigField_Field(server.getId(), "rcon_password").getValue();
        SourceRconAuthStatus status = client.authenticate(getServerAddress(server), rcon_password).join();
        if (!status.isAuthenticated()){
            throw new RuntimeException(status.getReason());
        }
        return client;
    }

    private InetSocketAddress getServerAddress(Server server){
        String hostname = server.getMachine().getHostname();
        int port = server.getPort();
        return new InetSocketAddress(hostname, port);
    }

    public SourceServer getServerInfo(Server server) throws InterruptedException, ExecutionException, TimeoutException {
        SourceQueryClient client = new SourceQueryClient();
        return client.getServerInfo(getServerAddress(server)).get(5, TimeUnit.SECONDS);
    }

    public String sendRconCommand(Server server, String command){
        try (SourceRconClient rconClient = getRconClient(server)) {
            return rconClient.execute(getServerAddress(server), command).join();
        } catch (RconNotYetAuthException | IOException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

}
