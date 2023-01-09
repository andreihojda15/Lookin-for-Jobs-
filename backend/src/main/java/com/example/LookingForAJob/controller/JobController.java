package com.example.LookingForAJob.controller;

import com.example.LookingForAJob.model.Company;
import com.example.LookingForAJob.model.Job;
import com.example.LookingForAJob.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api/jobs")
public class JobController {
    @Autowired
    private JobService jobService;

    @GetMapping
    public ResponseEntity<List<Job>> getCompanies() {
        List<Job> companies = jobService.getJobs();
        return ResponseEntity.status(HttpStatus.OK).body(companies);
    }

    @PostMapping
    public ResponseEntity<Job> addJob(@RequestBody Job job) {
        return ResponseEntity.status(HttpStatus.OK).body(jobService.addJob(job));
    }
}
