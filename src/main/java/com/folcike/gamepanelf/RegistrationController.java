package com.folcike.gamepanelf;

import com.folcike.gamepanelf.model.User;
import com.folcike.gamepanelf.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

    private UserRepository userRepository;

    @Autowired
    public RegistrationController(UserRepository userRepository){
        this.userRepository = userRepository;
    }

    @GetMapping("/")
    public String registrationForm(Model model){
        model.addAttribute("user", new User());

        return "registration";
    }

    @PostMapping("/")
    public String registrationRequest(Model model, @ModelAttribute("user") User user) {
        try{
            User existing = userRepository.findByUsername(user.getUsername());
            if (existing == null){
                throw new Exception("");
            }
            return "registration";
        } catch(Exception e){
            try{
                user.setPassword(PBKDFHasher.createHash(user.getPassword()));
            } catch (Exception ex){
                ex.printStackTrace();
            }
            userRepository.save(user);
            return "redirect:/";
        }
    }

}
