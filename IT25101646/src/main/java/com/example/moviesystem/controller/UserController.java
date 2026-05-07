package com.example.moviesystem.controller;

import com.example.moviesystem.model.User;
import com.example.moviesystem.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Optional;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    // ---------- REGISTER PAGE ----------
    @GetMapping("/register")
    public String showRegister() {
        return "register";
    }

    // ---------- REGISTER PROCESS ----------
    @PostMapping("/register")
    public String register(
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam String mobile,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            Model model) {

        // ❌ Password mismatch
        if (!password.equals(confirmPassword)) {
            model.addAttribute("msg", "Passwords do not match!");
            return "register";
        }

        // ❌ Email exists
        Optional<User> existingUser = userRepository.findByEmail(email);
        if (existingUser.isPresent()) {
            model.addAttribute("msg", "Account already exists!");
            return "register";
        }

        try {
            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setMobile(mobile);
            user.setPassword(encoder.encode(password));

            userRepository.save(user);

            model.addAttribute("msg", "User registered successfully!");

        } catch (Exception e) {
            model.addAttribute("msg", "Error: " + e.getMessage());
        }

        return "register";
    }

    // ---------- LOGIN ----------
    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            Model model,
            HttpSession session) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            if (encoder.matches(password, user.getPassword())) {
                session.setAttribute("user", user.getUsername());
                return "redirect:/dashboard";
            }
        }

        model.addAttribute("msg", "Invalid email or password!");
        return "login";
    }

    // ---------- FORGOT PASSWORD ----------
    @GetMapping("/forgot-password")
    public String showForgotPassword() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String forgotPassword(
            @RequestParam String email,
            Model model) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            String code = String.valueOf((int)(Math.random() * 900000) + 100000);

            user.setResetCode(code);
            user.setResetCodeExpiry(System.currentTimeMillis() + 5 * 60 * 1000);

            userRepository.save(user);

            // 🔐 Show OTP in console
            System.out.println("🔐 OTP CODE: " + code);

            model.addAttribute("email", email);
            model.addAttribute("msg", "OTP generated! Check IntelliJ console.");

            return "verify-code";
        }

        model.addAttribute("msg", "Email not found!");
        return "forgot-password";
    }

    // ---------- VERIFY CODE ----------
    @PostMapping("/verify-code")
    public String verifyCode(
            @RequestParam String email,
            @RequestParam String code,
            Model model) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            if (user.getResetCode() != null &&
                    user.getResetCodeExpiry() != null &&
                    user.getResetCode().equals(code) &&
                    user.getResetCodeExpiry() > System.currentTimeMillis()) {

                model.addAttribute("email", email);
                return "reset-password";
            }
        }

        model.addAttribute("msg", "Invalid or expired code!");
        model.addAttribute("email", email);
        return "verify-code";
    }

    // ---------- RESET PASSWORD (UPDATED WITH CONFIRM PASSWORD) ----------
    @PostMapping("/reset-password")
    public String resetPassword(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            Model model) {

        // ❌ check password match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("msg", "Passwords do not match!");
            model.addAttribute("email", email);
            return "reset-password";
        }

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            user.setPassword(encoder.encode(password));

            // clear OTP
            user.setResetCode(null);
            user.setResetCodeExpiry(null);

            userRepository.save(user);

            model.addAttribute("msg", "Password reset successful!");
            return "login";
        }

        model.addAttribute("msg", "Error resetting password!");
        return "reset-password";
    }

    // ---------- DASHBOARD ----------
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        String user = (String) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("username", user);
        return "dashboard";
    }

    // ---------- LOGOUT ----------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // ---------- VIEW USERS ----------
    @GetMapping("/users")
    public String users(Model model) {

        List<User> users = userRepository.findAll();

        model.addAttribute("userList", users);
        return "users";
    }
}