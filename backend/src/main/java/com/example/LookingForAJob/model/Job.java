package com.example.LookingForAJob.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Job {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "companyId")
    private Long companyId;

    @Column
    private String name;

    @Column
    private int experience;

    @Column(name = "requiredSkill")
    private String requiredSkill;

    @Column
    private String description;

    @ManyToMany(mappedBy = "jobs")
    @JsonIgnore
    private Set<User> users;

}
