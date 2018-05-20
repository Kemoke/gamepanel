package com.folcike.gamepanelf;

import com.folcike.gamepanelf.model.Machine;
import com.folcike.gamepanelf.repository.MachineRepository;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/panel")
public class PanelController {

    private MachineRepository machineRepository;

    @Autowired
    public PanelController(MachineRepository machineRepository){this.machineRepository = machineRepository;}

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String panel(Model model, RedirectAttributes redirect) {
        String test = "testiram";
        Machine machineModel = new Machine();

        machineModel.setUsername("Denis");
        model.addAttribute("machine", new Machine());
        model.addAttribute("machines", machineRepository.findAll());
        model.addAttribute("test", test);
        return "panel";
    }

    @PostMapping("/insertMachine")
    public String addMachine(@ModelAttribute("machine") Machine machine, Model model) throws ClassNotFoundException, SQLException {
        System.out.println(machine.getUsername() + " " + machine.getPassword());
        machineRepository.save(machine);
        return "redirect:/panel";
    }


}
