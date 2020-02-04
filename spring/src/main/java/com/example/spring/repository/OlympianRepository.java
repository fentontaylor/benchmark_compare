package com.example.spring.repository;

import com.example.spring.model.Olympian;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OlympianRepository extends JpaRepository<Olympian, Long> {
}
