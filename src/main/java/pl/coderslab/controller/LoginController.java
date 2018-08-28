package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.HashingService;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    HashingService hashingService;

    @GetMapping("/login")
    public String loginForm() {
        return "forms/login";
    }

    @PostMapping("/login")
    public String logIn(@RequestParam String username, @RequestParam String password, Model model, HttpSession sess) {
        String errorMsg = "";
        User currentUser = userRepository.findFirstByUsername(username);
        if (currentUser != null) {
            if (hashingService.checkPass(password, currentUser.getPassword())) {
                model.addAttribute("tweet", new Tweet());
                sess.setAttribute("currentUser", currentUser);
                return "redirect:/";
            } else {
                errorMsg = "Incorrect password";
                model.addAttribute("errorMsg", errorMsg);
                return "forms/login";
            }
        } else {
            errorMsg = "Incorrect username";
            model.addAttribute("errorMsg", errorMsg);
            return "forms/login";
        }
    }

}
