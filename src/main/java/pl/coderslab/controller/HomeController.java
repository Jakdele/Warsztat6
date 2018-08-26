package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Tweet;
import pl.coderslab.repository.TweetRepository;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    TweetRepository tweetRepository;

    @GetMapping("/")
    public String appStart(Model model) {
        model.addAttribute("tweet", new Tweet());
        return "home";
    }

    @ModelAttribute("tweets")
    public List<Tweet> tweets() {
        return tweetRepository.findAll();
    }

}
