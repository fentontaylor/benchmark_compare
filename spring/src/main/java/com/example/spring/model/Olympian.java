package com.example.spring.model;

import javax.persistence.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "olympians")
public class Olympian {
  @Id
  @Column(columnDefinition = "id")
  public Long id;

  @Column(columnDefinition="name")
  public String name;

  @Column(columnDefinition="sex")
  public String sex;

  @Column(columnDefinition="age")
  public Integer age;

  @Column(columnDefinition="height")
  public Integer height;

  @Column(columnDefinition="weight")
  public Integer weight;
}
