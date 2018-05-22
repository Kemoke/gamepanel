package com.folcike.gamepanelf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.folcike.gamepanelf.model.Game;
import com.folcike.gamepanelf.repository.GameRepo;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@Controller
@RequestMapping("/game")
public class GameController {

    private GameRepo gameRepo;

    @Autowired
    public GameController(GameRepo gameRepo){
        this.gameRepo=gameRepo;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String gameController(Model model, RedirectAttributes redirect) {
        Game gameModel = new Game();

        model.addAttribute("game", new Game());
        model.addAttribute("games", gameRepo.findAll());
        return "gameform";
    }

    @PostMapping(value = "/addGame", consumes = {"multipart/form-data"})
    public String addGame(@ModelAttribute("game") Game game, Model model, @RequestParam("installScript")
            MultipartFile installScript, @RequestParam("startScript")
            MultipartFile startScript, @RequestParam("stopScript")
            MultipartFile stopScript) throws IOException {
        installScript.transferTo(new File("./storage/" + installScript.getOriginalFilename()));
        startScript.transferTo(new File("./storage/" + installScript.getOriginalFilename()));
        stopScript.transferTo(new File("./storage/" + installScript.getOriginalFilename()));
        game.setInstallScriptPath("./storage/" + installScript.getOriginalFilename());
        game.setStartScriptPath("./storage/" + installScript.getOriginalFilename());
        game.setStopScriptPath("./storage/" + installScript.getOriginalFilename());
        gameRepo.save(game);
        return "redirect:/game";
    }

}
