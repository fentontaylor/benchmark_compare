package com.example.spring.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "olympians")
public class Olympian {
  @Id
  String name;
  String sex;
  Int age;
  Int height;
  Int weight;
}
