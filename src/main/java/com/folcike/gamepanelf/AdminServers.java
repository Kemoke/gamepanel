package com.folcike.gamepanelf;


import com.folcike.gamepanelf.model.Server;
import com.folcike.gamepanelf.repository.GameRepo;
import com.folcike.gamepanelf.repository.MachineRepository;
import com.folcike.gamepanelf.repository.ServerRepository;
import com.folcike.gamepanelf.services.SSHService;
import com.folcike.gamepanelf.services.SourceQueryService;
import com.ibasco.agql.protocols.valve.source.query.pojos.SourceServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import java.util.concurrent.TimeoutException;


@Controller
@RequestMapping("/adminservers")
public class AdminServers {

    private final ServerRepository serverRepo;
    private final MachineRepository machineRepo;
    private final GameRepo gameRepo;
    private final SSHService sshService;
    private final SourceQueryService sourceQueryService;

    @Autowired
    public AdminServers(ServerRepository serverRepo, MachineRepository machineRepo, GameRepo gameRepo, SSHService sshService, SourceQueryService sourceQueryService) {
        this.serverRepo = serverRepo;
        this.machineRepo = machineRepo;
        this.gameRepo = gameRepo;
        this.sshService = sshService;
        this.sourceQueryService = sourceQueryService;
    }

    @GetMapping("")
    public String adminservers(Model model, RedirectAttributes redirect) {
        model.addAttribute("server", new Server());
        model.addAttribute("servers", serverRepo.findAll());
        model.addAttribute("machines", machineRepo.findAll());
        model.addAttribute("games", gameRepo.findAll());
        return "adminservers";
    }
    @GetMapping("/{id}/")
    public String serverInfo(Model model, @PathVariable("id") Long id){
        Optional<Server> serverReq = serverRepo.findById(id);
        if (!serverReq.isPresent()){
            throw new RuntimeException("Server id not found");
        }
        Server server = serverReq.get();
        model.addAttribute("server", new Server());
        model.addAttribute("servers", serverRepo.findAll());
        model.addAttribute("machines", machineRepo.findAll());
        model.addAttribute("games", gameRepo.findAll());
        try{
            SourceServer serverInfo = sourceQueryService.getServerInfo(server);
            model.addAttribute("serverInfo", serverInfo);
            model.addAttribute("error", "");
        } catch (TimeoutException e){
            model.addAttribute("error", "Connection to server timed out ");
        } catch (Exception e){
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
        }
        return "serverInfo";
    }

    @PostMapping("/addServer")
    public String addServer(@ModelAttribute("server") Server server, Model model) throws IOException {
        serverRepo.save(server);
        sshService.runInstallScript(server);
        return "redirect:/admin";
    }

    @GetMapping("/{id}/action")
    public String runAction(@RequestParam("type") String type, @PathVariable("id") Long id) throws IOException {
        Optional<Server> serverReq = serverRepo.findById(id);
        if (!serverReq.isPresent()){
            throw new RuntimeException("Server id not found");
        }
        Server server = serverReq.get();
        switch (type){
            case "start":
                sshService.runStartScript(server);
                break;
            case "stop":
                sshService.runStopScript(server);
                break;
            case "restart":
                sshService.runStopScript(server);
                sshService.runStartScript(server);
                break;
        }
        return "redirect:/adminservers";
    }

    @PutMapping("/setupDone")
    @ResponseBody
    public String handleSetupDone(@RequestParam("id") Long id){
        Optional<Server> serverReq = serverRepo.findById(id);
        if (!serverReq.isPresent()){
            throw new RuntimeException("Server id not found");
        }
        Server server = serverReq.get();
        server.setSetup(true);
        serverRepo.save(server);
        return "done";
    }
}



