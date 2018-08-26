package pl.coderslab.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import pl.coderslab.validator.CheckEmail;
import pl.coderslab.validator.CheckUsername;

import javax.persistence.*;
import javax.transaction.Transactional;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @NotBlank
    @CheckUsername
    @Column(unique = true)
    private String username;

    @NotBlank
    private String password;

    @NotNull
    private Boolean enabled;

    @NotBlank
    @Email
    @CheckEmail
    @Column(unique = true)
    private String email;

    @OneToMany (mappedBy = "user", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Tweet> tweets = new ArrayList<>();

    @OneToMany (mappedBy = "sender", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Message> outgoing = new ArrayList<>();

    @OneToMany (mappedBy = "receiver", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Message> incoming = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Comment> comments;

    public User() {
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Tweet> getTweets() {
        return tweets;
    }

    public void setTweets(List<Tweet> tweets) {
        this.tweets = tweets;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password=password;
//        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
