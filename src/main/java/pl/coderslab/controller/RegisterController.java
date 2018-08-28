package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.HashingService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class RegisterController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    HashingService hashingService;

    @GetMapping("/register")
    public String registerForm(@ModelAttribute User user, Model model) {
        model.addAttribute("user", user);
        return "forms/register";
    }


    @PostMapping("/register")
    public String registerUser(@Valid User user, BindingResult result, HttpSession sess) {
        if (result.hasErrors()) {
            return "forms/register";
        }
        user.setPassword(hashingService.hashPassword(user.getPassword()));
        sess.setAttribute("currentUser", user);
        userRepository.save(user);
        return "redirect:/";
    }
}
