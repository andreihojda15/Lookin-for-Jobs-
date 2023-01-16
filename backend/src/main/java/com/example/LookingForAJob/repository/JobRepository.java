package com.example.LookingForAJob.repository;

import com.example.LookingForAJob.model.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {
    List<Job> findJobsByUsersId(Long userId);
}
