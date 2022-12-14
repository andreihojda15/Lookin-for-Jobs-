package com.example.LookingForAJob.service;

import com.example.LookingForAJob.model.Education;
import com.example.LookingForAJob.repository.EducationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EducationService {

    @Autowired
    private EducationRepository educationRepository;

    public List<Education> getEducations() {
        return educationRepository.findAll();
    }
}
