package pl.coderslab.validator;

import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CheckUsernameValidator implements ConstraintValidator<CheckUsername, String> {
    @Autowired
    UserRepository userRepository;
    ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    HttpSession session = attr.getRequest().getSession();

    public void initialize(CheckUsername constraint) {
    }

    public boolean isValid(String username, ConstraintValidatorContext context) {
        User user = userRepository.findFirstByUsername(username);
        User currentUser = (User) session.getAttribute("currentUser");
        return CheckEmailValidator.checkIfExists(user, currentUser);
    }
}
