package com.example.bureau1.repositories;

import com.example.bureau1.models.Things;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.criteria.Order;
import java.util.List;
import java.util.Optional;

public interface BureauRepository extends JpaRepository<Things, Long> {
    List<Things> findByTitle(String title);
    @Query("SELECT t FROM Things t LEFT JOIN FETCH t.user WHERE t.id = :id")
    Things findByIdWithUser(@Param("id") Long id);


}
