package com.folcike.gamepanelf;


import com.folcike.gamepanelf.model.Server;
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





@Controller
@RequestMapping("/adminservers")
public class AdminServers {

    private ServerRepository serverRepo;

    @Autowired
    public AdminServers(ServerRepository serverRepo){
        this.serverRepo = serverRepo;
    }

    @GetMapping("/")
    public String adminservers(Model model, RedirectAttributes redirect){
        model.addAttribute("server",new Server());

        return "adminservers";
    }

    @PostMapping("/")
    public String serverRequest(Model model, @ModelAttribute ("server") Server server){

            serverRepo.save(server);
            return "adminservers";
        }



    }



