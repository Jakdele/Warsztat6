package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.entity.Comment;
import pl.coderslab.repository.CommentRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentRepository commentRepository;

    @PostMapping("/add")
    public String newComment(@Valid Comment comment, BindingResult result) {
        if (result.hasErrors()) {
            return "tweet/tweet_details";
        }
        commentRepository.save(comment);
        return "redirect:/tweet/details/"+comment.getTweet().getId();

    }
}
