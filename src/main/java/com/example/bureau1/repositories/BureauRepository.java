package com.example.bureau1.repositories;

import com.example.bureau1.models.Things;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BureauRepository extends JpaRepository<Things, Long> {
    List<Things> findByTitle(String title);


}
