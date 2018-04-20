package com.folcike.gamepanelf;

import com.folcike.gamepanelf.model.User;
import com.folcike.gamepanelf.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

    private UserRepository userRepository;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public RegistrationController(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder){
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String registration(Model model){
        model.addAttribute("user", new User());

        return "registration";
    }

    @PostMapping("/")
    public String register(Model model, @ModelAttribute("user") User user){
        try{
            userRepository.findByEmail(user.getEmail());
            return "registration";
        } catch(Exception e){
            userRepository.save(user);
            return "redirect:/";
        }
    }

}
