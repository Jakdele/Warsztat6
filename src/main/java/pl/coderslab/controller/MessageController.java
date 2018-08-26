package pl.coderslab.controller;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    MessageRepository messageRepository;
    @Autowired
    UserRepository userRepository;

    @GetMapping("/send/{id}")
    public String messageForm(@PathVariable int id, Model model) {
        model.addAttribute("receiver", userRepository.findOne(id));
        model.addAttribute("message", new Message());
        return "forms/message";
    }

    @PostMapping("/send/{id}")
    public String newMessage(@Valid Message message, BindingResult result, @PathVariable int id, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("receiver", userRepository.findOne(id));
            return "forms/message";
        }
        messageRepository.save(message);
        return "redirect:/user/details/" + message.getReceiver().getId();
    }

    @GetMapping("/list/{id}")
    public String messagesByUser(@PathVariable int id, Model model) {
        List<Message> sent = messageRepository.findAllBySenderIdOrderByCreatedDesc(id);
        model.addAttribute("sent", sent);
        List<Message> received = messageRepository.findAllByReceiverIdOrderByCreatedDesc(id);
        model.addAttribute("received", received);
        return "message/message_list";
    }

    @GetMapping("/details/{id}")
    public String messageDetails(@PathVariable int id, Model model, HttpSession sess) {
        Message message = messageRepository.findOne(id);
        User user = (User) sess.getAttribute("currentUser");
        if( user == null || (user.getId()!=message.getReceiver().getId() &&  user.getId()!=message.getSender().getId())){
            return "redirect:/";
        }
        if (user.getId() == message.getReceiver().getId()) {
            message.setChecked(true);
            messageRepository.save(message);
        }

        model.addAttribute("message", message);
        return "message/message_details";
    }
}
