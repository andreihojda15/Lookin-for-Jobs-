package com.example.LookingForAJob.controller;

import com.example.LookingForAJob.model.Job;
import com.example.LookingForAJob.model.User;
import com.example.LookingForAJob.repository.JobRepository;
import com.example.LookingForAJob.repository.UserRepository;
import com.example.LookingForAJob.service.JobService;
import com.example.LookingForAJob.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Controller
@RequestMapping("/api/jobs")
public class JobController {
    @Autowired
    private JobService jobService;

    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private JobRepository jobRepository;

    @GetMapping
    public ResponseEntity<List<Job>> getCompanies() {
        List<Job> companies = jobService.getJobs();
        return ResponseEntity.status(HttpStatus.OK).body(companies);
    }

    @PostMapping
    public ResponseEntity<Job> addJob(@RequestBody Job job) {
        return ResponseEntity.status(HttpStatus.OK).body(jobService.addJob(job));
    }

    @GetMapping("/{userId}/jobs")
    public ResponseEntity<List<Job>> getAllTagsByTutorialId(@PathVariable(value = "userId") Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new EntityNotFoundException("User not found with id " + userId);
        }

        List<Job> jobs = jobRepository.findJobsByUsersId(userId);
        return new ResponseEntity<>(jobs, HttpStatus.OK);
    }

    @PostMapping("/{userId}/{jobId}")
    public ResponseEntity<?> applyToJob(@PathVariable(value = "userId") Long userId, @PathVariable(value = "jobId") Long jobId){
        try{
            userService.applyToJob(userId, jobId);
            return ResponseEntity.status(HttpStatus.OK).body("Applied to job, good luck!");
        }catch(EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
}
