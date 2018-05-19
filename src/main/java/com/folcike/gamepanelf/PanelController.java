package com.folcike.gamepanelf;

import com.folcike.gamepanelf.model.Machine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import javax.validation.Valid;
import java.sql.SQLException;

@Controller
@RequestMapping("/panel")
public class PanelController {

    @RequestMapping("")
    public String panel(Model model, RedirectAttributes redirect) {

        model.addAttribute("machine", new Machine());
        return "panel";
    }

    @RequestMapping(value="/insertMachine.htm", method=RequestMethod.POST)
    public String addMachine(@ModelAttribute("machine") @Valid Machine machine, BindingResult result, ModelMap model) throws ClassNotFoundException, SQLException {
        System.out.println(machine.getUser() + " " + machine.getPassword());
        machine.insertMachine();
        return "panel";
    }
}
