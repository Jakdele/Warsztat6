package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.HashingService;
import pl.coderslab.validator.CheckUsernameValidator;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    TweetRepository tweetRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    HashingService hashingService;

    @GetMapping("/tweets")
    public String userTweets(HttpSession sess, Model model){
        User currentUser = (User) sess.getAttribute("user");
        List<Tweet> userTweets = tweetRepository.findAllByUser(currentUser);
        model.addAttribute("userTweets", userTweets);
        return "user/user_tweets";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model){
        User user = userRepository.findOne(id);
        model.addAttribute("user", user);
        return "forms/register";

    }
    @PostMapping("/edit/{id}")
    public String editUser(@Valid User user, BindingResult result, HttpSession sess){
        if(result.hasErrors()){
            return "forms/register";
        }
        String testPassword  = userRepository.findOne(user.getId()).getPassword();
        if(user.getPassword()!=testPassword) {
            user.setPassword(hashingService.hashPassword(user.getPassword()));
        }
        sess.setAttribute("currentUser", user);
        userRepository.save(user);
        return "redirect:/";
    }

    @RequestMapping("/details/{id}")
    public String userDetails(@PathVariable int id, Model model){
        User showcasedUser = userRepository.findOne(id);
        List<Tweet> tweets = tweetRepository.findAllByUserId(id);
        model.addAttribute("showcasedUser", showcasedUser);
        model.addAttribute("tweets", tweets);
        return "user/user_details";
    }
}
