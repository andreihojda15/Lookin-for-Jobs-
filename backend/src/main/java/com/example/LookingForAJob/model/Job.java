package com.example.LookingForAJob.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;

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

}
