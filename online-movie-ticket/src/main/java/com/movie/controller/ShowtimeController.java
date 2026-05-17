package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/showtimes")
public class ShowtimeController {

    // VIEW ALL SHOWTIMES

    @GetMapping
    public String viewShowtimes(
            Model model) {

        List<String> showtimes =
                FileUtil.readFile(
                        "data/showtimes.txt");

        model.addAttribute(
                "showtimes",
                showtimes);

        return "showtimes";
    }

    // OPEN ADD PAGE

    @GetMapping("/add")
    public String addShowtimePage() {

        return "add-showtime";
    }

    // SAVE SHOWTIME

    @PostMapping("/save")
    public String saveShowtime(

            @RequestParam int id,

            @RequestParam String movieName,

            @RequestParam String date,

            @RequestParam String showTime,

            @RequestParam String theater) {

        String data =

                id + "," +

                        movieName + "," +

                        date + "," +

                        showTime + "," +

                        theater;

        FileUtil.writeFile(
                "data/showtimes.txt",
                data);

        return "redirect:/showtimes";
    }

    // DELETE SHOWTIME

    @GetMapping("/delete/{id}")
    public String deleteShowtime(
            @PathVariable int id) {

        List<String> showtimes =
                FileUtil.readFile(
                        "data/showtimes.txt");

        List<String> updatedShowtimes =
                new ArrayList<>();

        for(String showtime :
                showtimes) {

            if(showtime.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    showtime.split(",");

            if(Integer.parseInt(
                    data[0]) != id) {

                updatedShowtimes.add(
                        showtime);
            }
        }

        FileUtil.overwriteFile(
                "data/showtimes.txt",
                updatedShowtimes);

        return "redirect:/showtimes";
    }

    // OPEN EDIT PAGE

    @GetMapping("/edit/{id}")
    public String editShowtime(

            @PathVariable int id,

            Model model) {

        List<String> showtimes =
                FileUtil.readFile(
                        "data/showtimes.txt");

        for(String showtime :
                showtimes) {

            if(showtime.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    showtime.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                model.addAttribute(
                        "showtime",
                        showtime);

                break;
            }
        }

        return "edit-showtime";
    }

    // UPDATE SHOWTIME

    @PostMapping("/update")
    public String updateShowtime(

            @RequestParam int id,

            @RequestParam String movieName,

            @RequestParam String date,

            @RequestParam String showTime,

            @RequestParam String theater) {

        List<String> showtimes =
                FileUtil.readFile(
                        "data/showtimes.txt");

        List<String> updatedShowtimes =
                new ArrayList<>();

        for(String showtime :
                showtimes) {

            if(showtime.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    showtime.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                updatedShowtimes.add(

                        id + "," +

                                movieName + "," +

                                date + "," +

                                showTime + "," +

                                theater);

            } else {

                updatedShowtimes.add(
                        showtime);
            }
        }

        FileUtil.overwriteFile(
                "data/showtimes.txt",
                updatedShowtimes);

        return "redirect:/showtimes";
    }
}