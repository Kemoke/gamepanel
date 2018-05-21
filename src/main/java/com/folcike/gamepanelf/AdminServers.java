package com.folcike.gamepanelf;


import com.folcike.gamepanelf.model.Server;
import com.folcike.gamepanelf.repository.GameRepo;
import com.folcike.gamepanelf.repository.MachineRepository;
import com.folcike.gamepanelf.repository.ServerRepository;
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
import java.sql.SQLException;


@Controller
@RequestMapping("/adminservers")
public class AdminServers {

    private ServerRepository serverRepo;
    private MachineRepository machineRepo;
    private GameRepo gameRepo;

    @Autowired
    public AdminServers(ServerRepository serverRepo, MachineRepository machineRepo, GameRepo gameRepo){
        this.serverRepo = serverRepo;
        this.machineRepo = machineRepo;
        this.gameRepo = gameRepo;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String adminservers(Model model, RedirectAttributes redirect) {
        model.addAttribute("server", new Server());
        model.addAttribute("servers", serverRepo.findAll());
        model.addAttribute("machines", machineRepo.findAll());
        model.addAttribute("games", gameRepo.findAll());
        return "adminservers";
    }

    @PostMapping("/addServer")
    public String addServer(@ModelAttribute("server") Server server, Model model) throws ClassNotFoundException, SQLException {
        System.out.println(server.getName() + " " + server.getPort());
        serverRepo.save(server);
        return "redirect:/admin";
    }


    }



