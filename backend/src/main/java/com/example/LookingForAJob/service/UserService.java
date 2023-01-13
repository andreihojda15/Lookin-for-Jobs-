package com.example.LookingForAJob.service;

import com.example.LookingForAJob.model.Job;
import com.example.LookingForAJob.model.SecurityUser;
import com.example.LookingForAJob.model.User;
import com.example.LookingForAJob.repository.JobRepository;
import com.example.LookingForAJob.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    @Lazy
    PasswordEncoder encoder;
    @Autowired
    private JobRepository jobRepository;

    public List<User> getUsers() {
        return userRepository.findAll();
    }

    public User getUser(Long id) {
        Optional<User> user = userRepository.findById(id);
        if(user.isPresent()){
        return user.get();
        }else {
            throw new EntityNotFoundException("Couldn't find user with id " + id);
        }
    }

    public User login(User user) {
        Optional<User> userFound = userRepository.findByEmail(user.getEmail());
        if (userFound.isPresent() && encoder.matches(user.getPassword(), userFound.get().getPassword())) {
            return userFound.get();
        }
        throw new EntityNotFoundException("User not found");
    }

    public User addUser(User user) {
        String passwordEncoded = encoder.encode(user.getPassword());
        user.setPassword(passwordEncoded);
        return userRepository.save(user);
    }

    public User editUser(User user, Long id) {


        return userRepository.findById(id)
                .map(user1 -> {
                    if (user.getCv() != null) {
                        user1.setCv(user.getCv());
                    }
                    if (user.getEmail() != null) {
                        user1.setEmail(user.getEmail());
                    }
                    if (user.getImage() != null) {
                        user1.setImage(user.getImage());
                    }
                    if (user.getFirstName() != null) {
                        user1.setFirstName(user.getFirstName());
                    }
                    if (user.getLastName() != null) {
                        user1.setLastName(user.getLastName());
                    }
                    if (user.getContactNumber() != null) {
                        user1.setContactNumber(user.getContactNumber());
                    }
                    if (user.getDateOfBirth() != null) {
                        user1.setDateOfBirth(user.getDateOfBirth());
                    }
                    if (user.getRole() != null) {
                        user1.setRole(user.getRole());
                    }
                    if (user.getPassword() != null) {
                        String passwordEncoded = encoder.encode(user.getPassword());
                        user1.setPassword(passwordEncoded);
                    }

                    return userRepository.save(user1);
                })
                .orElseThrow(() -> new EntityNotFoundException("User not found"));
    }

    public User removeUser(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isEmpty()) {
            throw new EntityNotFoundException("Couldn't find the user you want to delete");
        } else {
            userRepository.deleteById(id);
            return user.get();
        }
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<User> user = userRepository.findByEmail(email);

        return user
                .map(SecurityUser::new)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    }

    public void applyToJob(Long userId, Long jobId) {
        Optional<Job> job = jobRepository.findById(jobId);
        if(job.isEmpty()) {
            throw new EntityNotFoundException("Couldn't find job");
        }
        Optional<User> user = userRepository.findById(userId);
        if(user.isEmpty()) {
            throw new EntityNotFoundException("Couldn't find user");
        }

//        user.get().getJobs().add(job.get());
        user.get().addJob(job.get());
        userRepository.save(user.get());
        jobRepository.save(job.get());
    }

}
