package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
        List<Tweet> tweets = tweetRepository.findAllSorted();
        model.addAttribute("tweets", tweets);
        model.addAttribute("tweet", new Tweet());
        return "home";
    }


}
