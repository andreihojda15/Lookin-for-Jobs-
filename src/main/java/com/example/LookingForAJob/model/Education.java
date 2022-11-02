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
public class Education {
    @Id
    @Column(name = "idEducation")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_user")
    private Long id_user;

    @Column(name = "Faculty")
    private String faculty;

    @Column(name = "Degree")
    private Enum<Degree> degree ;

    @Column(name = "currentYear")
    private int currentYear;

    public Education() {}
}
