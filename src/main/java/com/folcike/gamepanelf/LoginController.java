package com.folcike.gamepanelf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController {

    @GetMapping("/login")
    public String loginForm(ModelMap map){
        map.put("test", "tewst");
        return "index";
    }
}
