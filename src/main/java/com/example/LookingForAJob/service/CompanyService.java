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
        return companyRepository.findAll();
    }

    public Company getCompany(Long companyID) {
        return  companyRepository.findById(companyID).get();

    }

    public Company addCompany(Company company) {
        return companyRepository.save(company);
    }
}
