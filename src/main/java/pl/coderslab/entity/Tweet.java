package pl.coderslab.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
public class Tweet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;


    @Length(min = 5, max = 50)
    @NotNull
    private String title;

    @ManyToOne
    private User user;


    @Size(max = 140)
    @NotBlank
    private String text;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(columnDefinition = "Datetime default CURRENT_TIMESTAMP")
    private Date created = new Date();

    @OneToMany(mappedBy = "tweet", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> comments;

    public Tweet() {
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}
