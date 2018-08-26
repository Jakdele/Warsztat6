package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Message;

import java.util.List;


public interface MessageRepository extends JpaRepository<Message, Integer> {
    List<Message> findAllBySenderIdOrderByCreatedDesc(int id);
    List<Message> findAllByReceiverIdOrderByCreatedDesc(int id);

//    @Query("SELECT m from Message m join m.receiver u where u.id = :id")
//    List<Message> getAllBySender(@Param("id") int userId);
}
