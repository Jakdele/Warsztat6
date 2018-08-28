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
public class CommentController {
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    TweetRepository tweetRepository;

    @PostMapping("tweet/details/{id}")
    public String newComment(@Valid Comment comment, BindingResult result, Model model, @PathVariable int id) {
        if (result.hasErrors()) {
            Tweet tweet = tweetRepository.findOne(id);
            List<Comment>comments = commentRepository.findAllByTweetOrderByCreatedDesc(tweet);
            model.addAttribute("comments", comments);
            model.addAttribute("tweet", tweet);
            return "tweet/tweet_details";
        }
        commentRepository.save(comment);
        return "redirect:/tweet/details/"+comment.getTweet().getId();

    }
}
