package com.example.spring.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Id;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "olympians")
public class Olympian {
  @Id
  @Column(name = "id")
  Long id;

  @Column(name="name")
  String name;

  @Column(name="sex")
  String sex;

  @Column(name="age")
  Integer age;

  @Column(name="height")
  Integer height;

  @Column(name="weight")
  Integer weight;
}
