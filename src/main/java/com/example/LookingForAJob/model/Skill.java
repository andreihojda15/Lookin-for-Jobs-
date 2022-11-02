package com.example.LookingForAJob.model;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table
@Getter
@Setter
@Builder
@AllArgsConstructor
public class Skill {
    @Id
    @Column(name = "ID_skill")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "Skill")
    private String skillName;

    @Column(name = "rating")
    private Enum<Rating> rating;

    public Skill() {}

}
