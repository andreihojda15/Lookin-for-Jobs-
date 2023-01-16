package com.example.LookingForAJob.model;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import java.sql.Blob;
import java.time.LocalDate;
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

    @ManyToMany
    @JoinTable(name = "users_jobs",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "job_id"))
    private Set<Job> jobs;

    public User(String firstName, String lastName, String email, String password, String contactNumber, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.contactNumber = contactNumber;
        this.role = role;
    }

    public void addJob(Job job) {
        this.jobs.add(job);
        job.getUsers().add(this);
    }
//
//    public void removeJob(Long jobId) {
//        Job job = this.jobs.stream().filter(j -> j.getId() == jobId).findFirst().orElse(null);
//        if(job != null) {
//            this.jobs.remove(job);
//            job.getUsers().remove(this);
//        }
//    }
}
