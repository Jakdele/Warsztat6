package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.repository.CommentRepository;
import pl.coderslab.repository.TweetRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/tweet")
public class TweetController {
    @Autowired
    TweetRepository tweetRepository;
    @Autowired
    CommentRepository commentRepository;

    @PostMapping("/add")
    public String newTweet(@Valid Tweet tweet, BindingResult result){
        if(result.hasErrors()){
            return "home";
        }
        tweetRepository.save(tweet);
        return "redirect:/";
    }


    @GetMapping("/details/{id}")
    public String showArticles(@PathVariable int id, Model model) {
        Tweet tweet = tweetRepository.findOne(id);
        List<Comment>comments = commentRepository.findAllByTweetOrderByCreatedDesc(tweet);
        model.addAttribute("comments", comments);
        model.addAttribute("tweet", tweet);
        model.addAttribute("comment", new Comment());
        return "tweet/tweet_details";
    }
}
