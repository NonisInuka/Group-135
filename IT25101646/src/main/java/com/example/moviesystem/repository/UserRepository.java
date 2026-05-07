package com.example.moviesystem.repository;

import com.example.moviesystem.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    // 🔍 Find by username (used for login if needed)
    Optional<User> findByUsername(String username);

    // 🔍 Find by email (used to check duplicate account)
    Optional<User> findByEmail(String email);
}