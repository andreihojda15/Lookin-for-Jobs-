package com.example.LookingForAJob.service;

import com.example.LookingForAJob.model.Company;
import com.example.LookingForAJob.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    public List<Company> getCompanies() {
        List<Company> all = companyRepository.findAll();
        return all;
    }

    public Company getCompany(Long companyID) {
        return  companyRepository.findById(companyID).get();

    }
}
