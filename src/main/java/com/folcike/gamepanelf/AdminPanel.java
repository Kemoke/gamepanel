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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.sql.SQLException;

@Controller
@RequestMapping("/admin")
public class AdminPanel {

    private ServerRepository serverRepo;

    @Autowired
    public AdminPanel(ServerRepository serverRepo){
        this.serverRepo = serverRepo;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String adminservers(Model model, RedirectAttributes redirect) {
        Server serverModel = new Server();

        serverModel.setName("Melika");
        model.addAttribute("server", new Server());
        model.addAttribute("servers", serverRepo.findAll());
        return "adminservers";
    }

    @PostMapping("/addServer")
    public String addServer(@ModelAttribute("server") Server server, Model model) throws ClassNotFoundException, SQLException {
        System.out.println(server.getName() + " " + server.getPort());
        serverRepo.save(server);
        return "redirect:/admin";
    }
}
