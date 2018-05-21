package com.folcike.gamepanelf;

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
import com.folcike.gamepanelf.model.Game;
import com.folcike.gamepanelf.repository.GameRepo;
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

    @PostMapping("/addGame")
    public String addGame(@ModelAttribute("game") Game game, Model model) throws ClassNotFoundException, SQLException {
        System.out.println(game.getName());
        gameRepo.save(game);
        return "redirect:/game";
    }

}
