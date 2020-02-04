package com.example.spring.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class HelloWorld {

  @GetMapping("/")
  public String getString() {
    return "{\n message: Hello World! \n}";
  }
}
