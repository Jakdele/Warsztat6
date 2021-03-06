package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet, Integer> {

    List<Tweet> findAllByUserOrderByCreatedDesc(User user);

    List<Tweet> findAllByUserId(int userId);

    @Query("SELECT t FROM Tweet t order by t.created desc ")
    List<Tweet> findAllSorted();

    void removeAllByUserId(int userId);

}
