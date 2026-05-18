package com.movie.controller;

import com.movie.util.FileUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AuthController {

    // REGISTER PAGE

    @GetMapping("/register")
    public String registerPage() {

        return "register";
    }

    // REGISTER USER

    @PostMapping("/registerUser")
    public String registerUser(

            @RequestParam String username,

            @RequestParam String email,

            @RequestParam String password,

            @RequestParam String phone) {

        // READ EXISTING USERS

        List<String> users =
                FileUtil.readFile(
                        "data/users.txt");

        // AUTO GENERATE ID

        int id =
                users.size() + 1;

        // SAVE USER FORMAT

        String data =

                id + "," +

                        username + "," +

                        email + "," +

                        password + "," +

                        phone;

        // SAVE USER

        FileUtil.writeFile(
                "data/users.txt",
                data);

        return "redirect:/login";
    }

    // USER LOGIN PAGE

    @GetMapping("/login")
    public String loginPage() {

        return "login";
    }

    // USER LOGIN

    @PostMapping("/loginUser")
    public String loginUser(

            @RequestParam String email,

            @RequestParam String password,

            HttpSession session,

            Model model) {

        List<String> users =
                FileUtil.readFile(
                        "data/users.txt");

        for(String user : users) {

            if(user.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    user.split(",");

            // CHECK FULL DATA

            if(data.length < 5) {
                continue;
            }

            // CHECK USER LOGIN

            if(data[2].equals(email)
                    &&
                    data[3].equals(password)) {

                // SAVE USER SESSION

                session.setAttribute(
                        "loggedUser",
                        data[1]);

                // REDIRECT USER HOME

                return "redirect:/";
            }
        }

        // LOGIN FAILED

        model.addAttribute(
                "error",
                "Invalid Email or Password");

        return "login";
    }

    // ADMIN LOGIN PAGE

    @GetMapping("/admin-login")
    public String adminLoginPage() {

        return "admin-login";
    }

    // ADMIN LOGIN

    @PostMapping("/adminLogin")
    public String adminLogin(

            @RequestParam String email,

            @RequestParam String password,

            HttpSession session,

            Model model) {

        List<String> admins =
                FileUtil.readFile(
                        "data/admin.txt");

        for(String admin : admins) {

            if(admin.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    admin.split(",");

            if(data.length < 3) {
                continue;
            }

            // CHECK ADMIN LOGIN

            if(data[1].equals(email)
                    &&
                    data[2].equals(password)) {

                // SAVE ADMIN SESSION

                session.setAttribute(
                        "admin",
                        data[0]);

                // REDIRECT ADMIN DASHBOARD

                return "redirect:/admin";
            }
        }

        // LOGIN FAILED

        model.addAttribute(
                "error",
                "Invalid Admin Login");

        return "admin-login";
    }

    // PAYMENT PAGE

    @GetMapping("/payment")
    public String paymentPage() {

        return "payment";
    }

    // LOGOUT

    @GetMapping("/logout")
    public String logout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/login";
    }
}