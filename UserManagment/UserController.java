package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @GetMapping
    public String viewUsers(Model model) {

        List<String> users =
                FileUtil.readFile("data/users.txt");

        model.addAttribute("users", users);

        return "users";
    }

    @GetMapping("/add")
    public String addUserPage() {

        return "add-user";
    }

    @PostMapping("/save")
    public String saveUser(
            @RequestParam int id,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String phone) {

        String data =
                id + "," +
                        name + "," +
                        email + "," +
                        password + "," +
                        phone;

        FileUtil.writeFile("data/users.txt", data);

        return "redirect:/users";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(
            @PathVariable int id) {

        List<String> users =
                FileUtil.readFile("data/users.txt");

        List<String> updatedUsers =
                new ArrayList<>();

        for(String user : users) {

            String[] data =
                    user.split(",");

            if(Integer.parseInt(data[0]) != id) {

                updatedUsers.add(user);
            }
        }

        FileUtil.overwriteFile(
                "data/users.txt",
                updatedUsers);

        return "redirect:/users";
    }

    @GetMapping("/edit/{id}")
    public String editUser(
            @PathVariable int id,
            Model model) {

        List<String> users =
                FileUtil.readFile("data/users.txt");

        for(String user : users) {

            String[] data =
                    user.split(",");

            if(Integer.parseInt(data[0]) == id) {

                model.addAttribute(
                        "user",
                        user);

                break;
            }
        }

        return "edit-user";
    }

    @PostMapping("/update")
    public String updateUser(
            @RequestParam int id,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String phone) {

        List<String> users =
                FileUtil.readFile("data/users.txt");

        List<String> updatedUsers =
                new ArrayList<>();

        for(String user : users) {

            String[] data =
                    user.split(",");

            if(Integer.parseInt(data[0]) == id) {

                updatedUsers.add(
                        id + "," +
                                name + "," +
                                email + "," +
                                password + "," +
                                phone);

            } else {

                updatedUsers.add(user);
            }
        }

        FileUtil.overwriteFile(
                "data/users.txt",
                updatedUsers);

        return "redirect:/users";
    }
}