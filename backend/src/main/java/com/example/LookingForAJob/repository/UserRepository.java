package com.example.LookingForAJob.repository;

import com.example.LookingForAJob.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByJobs_Id(Long id);
    Optional<User> findByEmail(String email);

//    List<User> findUsersByJobId(Long jobId);
}
