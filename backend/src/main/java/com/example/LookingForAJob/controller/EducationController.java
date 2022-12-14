package com.example.LookingForAJob.controller;

import com.example.LookingForAJob.model.Education;
import com.example.LookingForAJob.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api/education")
public class EducationController {

    @Autowired
    private EducationService educationService;

    @GetMapping
    public ResponseEntity<List<Education>> getEducations() {
        return ResponseEntity.status(HttpStatus.OK).body(educationService.getEducations());
    }
}
