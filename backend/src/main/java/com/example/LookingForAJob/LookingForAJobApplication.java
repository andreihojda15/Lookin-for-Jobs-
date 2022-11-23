package com.example.LookingForAJob;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan
@EnableJpaRepositories
public class LookingForAJobApplication {
    public static void main(String[] args) {
        SpringApplication.run(LookingForAJobApplication.class, args);
    }
}
