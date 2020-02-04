package com.example.spring.controller;

import com.example.spring.model.Olympian;
import com.example.spring.repository.OlympianRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

@RestController
public class OlympianController {

  @Autowired
  private OlympianRepository olympianRepository;

  @GetMapping("/api/v1/olympians")
  public Page<Olympian> getOlympians() {
    return olympianRepository.findAll();
  }
}
