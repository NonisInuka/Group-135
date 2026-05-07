package com.example.moviesystem.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // ✅ Username (can be duplicated)
    @NotBlank(message = "Username is required")
    private String username;

    // ✅ Email must be UNIQUE
    @Column(unique = true)
    @Email(message = "Invalid email")
    @NotBlank(message = "Email is required")
    private String email;

    // ✅ Mobile number (OPTIONAL for old users)
    @Column(nullable = true)
    @Pattern(
            regexp = "^(\\d{10})?$",
            message = "Mobile must be 10 digits"
    )
    private String mobile;

    // ✅ Password
    @Size(min = 6, message = "Password must be at least 6 characters")
    @NotBlank(message = "Password is required")
    private String password;

    // 🔐 RESET PASSWORD FIELDS
    @Column(name = "reset_code")
    private String resetCode;

    @Column(name = "reset_code_expiry")
    private Long resetCodeExpiry;

    // ---------- CONSTRUCTORS ----------
    public User() {}

    public User(String username, String email, String mobile, String password) {
        this.username = username;
        this.email = email;
        this.mobile = mobile;
        this.password = password;
    }

    // ---------- GETTERS & SETTERS ----------

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getResetCode() {
        return resetCode;
    }

    public void setResetCode(String resetCode) {
        this.resetCode = resetCode;
    }

    public Long getResetCodeExpiry() {
        return resetCodeExpiry;
    }

    public void setResetCodeExpiry(Long resetCodeExpiry) {
        this.resetCodeExpiry = resetCodeExpiry;
    }
}