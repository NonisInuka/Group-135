package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {

        List<String> movies =
                FileUtil.readFile(
                        "data/movies.txt");

        model.addAttribute(
                "movies",
                movies);

        return "index";
    }
}