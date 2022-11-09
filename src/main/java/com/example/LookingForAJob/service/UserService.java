package com.example.LookingForAJob.service;

import com.example.LookingForAJob.model.User;
import com.example.LookingForAJob.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

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

    public User removeUser(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isEmpty()) {
            throw new EntityNotFoundException("Couldn't find the user you want to delete");
        } else {
            userRepository.deleteById(id);
            return user.get();
        }
    }
}
