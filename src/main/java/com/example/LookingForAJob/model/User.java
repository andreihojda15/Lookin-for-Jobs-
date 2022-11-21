package com.example.LookingForAJob.model;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import java.sql.Blob;
import java.time.LocalDate;

@Entity
@Table
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "password")
    private String password;

    @Column(nullable = true)
    private String contactNumber;

    @Column(name = "Image", nullable = true)
    private Blob image;

    @Column(name = "CV", nullable = true)
    private Blob cv;

    @Column(nullable = true)
    private LocalDate dateOfBirth;

    @Column(name = "role")
    private String role;

    public User(String firstName, String lastName, String email, String password, String contactNumber, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.contactNumber = contactNumber;
        this.role = role;
    }

}
