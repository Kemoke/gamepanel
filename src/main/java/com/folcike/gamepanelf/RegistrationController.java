package com.folcike.gamepanelf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/registration")

public class RegistrationController {

    @RequestMapping("/")
    public String registration(Model model, RedirectAttributes redirect){ return "registration";}

}
