package pl.coderslab.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CheckEmailValidator implements ConstraintValidator<CheckEmail, String> {
    @Autowired
    UserRepository userRepository;

    ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    HttpSession session = attr.getRequest().getSession();

    public void initialize(CheckEmail constraint) {
    }

    public boolean isValid(String email, ConstraintValidatorContext context) {
        User user = userRepository.findFirstByEmail(email);
        User currentUser = (User) session.getAttribute("currentUser");
        return checkIfExists(user, currentUser);
    }

    public static boolean checkIfExists(User user, User currentUser) {
        if (user != null && currentUser != null) {
            if (user.getId() == currentUser.getId()) {
                return true;
            } else {
                return false;
            }
        } else if (user != null) {
            return false;
        }
        return true;
    }
}
