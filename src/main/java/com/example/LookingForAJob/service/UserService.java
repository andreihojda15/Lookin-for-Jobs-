package com.example.LookingForAJob.service;

import com.example.LookingForAJob.model.User;
import com.example.LookingForAJob.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> getUsers() {
        List<User> all = userRepository.findAll();
        return all;
    }

    public User getUser(Long id) {
        return userRepository.findById(id).get();
    }

    public User addUser(User user) {
        return userRepository.save(user);
    }

    public User editUser(User user, Long id) {
        return userRepository.findById(id)
                .map(user1 -> {
                    user1.setCv(user.getCv() != null ? user.getCv() : null);
                    user1.setEmail(user.getEmail());
                    user1.setImage(user.getImage() != null ? user.getImage() : null);
                    user1.setFirstName(user.getFirstName());
                    user1.setLastName(user.getLastName());
                    user1.setContactNumber(user.getContactNumber());
                    user1.setDateOfBirth(user.getDateOfBirth());

                    return userRepository.save(user1);
                })
                .orElseThrow(() -> new EntityNotFoundException("User not found"));
    }
}
