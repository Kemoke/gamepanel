package com.folcike.gamepanelf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequestMapping("/gamepanel")
public class GamepanelController {
    @GetMapping("/")
    public String home(Model model, Principal principal, RedirectAttributes redirect)
    {
        model.addAttribute("username",principal.getName());

        return "gamepanel";
    }
}
