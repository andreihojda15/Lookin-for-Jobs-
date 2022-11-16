package com.example.LookingForAJob.controller;

import com.example.LookingForAJob.model.Company;
import com.example.LookingForAJob.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/api/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @GetMapping
    public ResponseEntity<List<Company>> getCompanies() {
        List<Company> companies = companyService.getCompanies();
        return ResponseEntity.status(HttpStatus.OK).body(companies);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Company> getCompanyById(@PathVariable("companyID") Long companyID) {
        return ResponseEntity.status(HttpStatus.OK).body(companyService.getCompany(companyID));
    }
}
