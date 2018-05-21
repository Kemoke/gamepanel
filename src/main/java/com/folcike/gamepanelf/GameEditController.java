package com.folcike.gamepanelf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/gameedit")
public class GameEditController {
    @RequestMapping("/")
    public String gameedit(Model model, RedirectAttributes redirect)
    {
        return "gameedit";
    }
}
