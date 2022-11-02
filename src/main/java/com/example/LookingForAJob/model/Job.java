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
public class Job {
    @Id
    @Column(name = "idJob")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ID_Company")
    private int idCompany;

    @Column(name = "name")
    private String name;

    @Column(name = "experience")
    private int experience;

    @Column(name = "requiredSkill")
    private String requiredSkill;

    @Column(name = "description")
    private String description;

    public Job() {}

}
