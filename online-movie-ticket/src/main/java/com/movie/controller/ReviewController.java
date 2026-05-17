package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

    @PostMapping("/save")
    public String saveReview(

            @RequestParam String movie,

            @RequestParam String user,

            @RequestParam String review,

            @RequestParam int rating) {

        String data =

                movie + "," +

                        user + "," +

                        rating + "," +

                        review;

        FileUtil.writeFile(
                "data/reviews.txt",
                data);

        return "redirect:/";
    }
}
