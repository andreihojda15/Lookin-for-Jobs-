package com.example.LookingForAJob.service;

import com.example.LookingForAJob.model.SecurityUser;
import com.example.LookingForAJob.model.User;
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

    public List<User> getUsers() {
        return userRepository.findAll();
    }

    public User getUser(Long id) {
        return userRepository.findById(id).get();
    }

    public User addUser(User user) {
        String passwordEncoded = encoder.encode(user.getPassword());
        user.setPassword(passwordEncoded);
        return userRepository.save(user);
    }

    public User editUser(User user, Long id) {
        String passwordEncoded = encoder.encode(user.getPassword());
        user.setPassword(passwordEncoded);

        return userRepository.findById(id)
                .map(user1 -> {
                    user1.setCv(user.getCv() != null ? user.getCv() : null);
                    user1.setEmail(user.getEmail());
                    user1.setImage(user.getImage() != null ? user.getImage() : null);
                    user1.setFirstName(user.getFirstName());
                    user1.setLastName(user.getLastName());
                    user1.setPassword(user.getPassword());
                    user1.setContactNumber(user.getContactNumber());
                    user1.setDateOfBirth(user.getDateOfBirth());
                    user1.setRole(user.getRole());

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
}
