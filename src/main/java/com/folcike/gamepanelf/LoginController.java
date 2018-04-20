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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final UserRepository userRepository;

    @Autowired
    public LoginController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/login/")
    public String loginForm(Model model) {
        model.addAttribute("user", new User());

        return "login";
    }

    @PostMapping("/login/")
    public String loginRequest(Model model,
                               @ModelAttribute("user") User req,
                               HttpSession session) {
        try{
            User user = userRepository.findByUsername(req.getUsername());
            if (!PBKDFHasher.validatePassword(req.getPassword(), user.getPassword())){
                model.addAttribute("error", "Invalid password");
                return "login";
            }
            session.setAttribute("user", user);
            return "redirect:/";
        } catch (Exception e){
            model.addAttribute("error", "User not found");
            return "login";
        }
    }

    @GetMapping("/logout/")
    public String logoutRequest(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/login/";
    }
}
