package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/movies")
public class MovieController {

    // VIEW MOVIES

    @GetMapping
    public String viewMovies(
            Model model) {

        List<String> movies =
                FileUtil.readFile(
                        "data/movies.txt");

        model.addAttribute(
                "movies",
                movies);

        return "movies";
    }

    // OPEN ADD PAGE

    @GetMapping("/add")
    public String addMoviePage() {

        return "add-movie";
    }

    // SAVE MOVIE

    @PostMapping("/save")
    public String saveMovie(

            @RequestParam int id,

            @RequestParam String title,

            @RequestParam String genre,

            @RequestParam String duration,

            @RequestParam String director,

            @RequestParam String rating,

            @RequestParam String image) {

        String data =

                id + "," +

                        title + "," +

                        genre + "," +

                        duration + "," +

                        director + "," +

                        rating + "," +

                        image;

        FileUtil.writeFile(
                "data/movies.txt",
                data);

        return "redirect:/movies";
    }

    // DELETE MOVIE

    @GetMapping("/delete/{id}")
    public String deleteMovie(
            @PathVariable int id) {

        List<String> movies =
                FileUtil.readFile(
                        "data/movies.txt");

        List<String> updatedMovies =
                new ArrayList<>();

        for(String movie : movies) {

            if(movie.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    movie.split(",");

            if(Integer.parseInt(
                    data[0]) != id) {

                updatedMovies.add(
                        movie);
            }
        }

        FileUtil.overwriteFile(
                "data/movies.txt",
                updatedMovies);

        return "redirect:/movies";
    }

    // EDIT MOVIE PAGE

    @GetMapping("/edit/{id}")
    public String editMovie(

            @PathVariable int id,

            Model model) {

        List<String> movies =
                FileUtil.readFile(
                        "data/movies.txt");

        for(String movie : movies) {

            if(movie.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    movie.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                model.addAttribute(
                        "movie",
                        movie);

                break;
            }
        }

        return "edit-movie";
    }

    // UPDATE MOVIE

    @PostMapping("/update")
    public String updateMovie(

            @RequestParam int id,

            @RequestParam String title,

            @RequestParam String genre,

            @RequestParam String duration,

            @RequestParam String director,

            @RequestParam String rating,

            @RequestParam String image) {

        List<String> movies =
                FileUtil.readFile(
                        "data/movies.txt");

        List<String> updatedMovies =
                new ArrayList<>();

        for(String movie : movies) {

            if(movie.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    movie.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                updatedMovies.add(

                        id + "," +

                                title + "," +

                                genre + "," +

                                duration + "," +

                                director + "," +

                                rating + "," +

                                image);

            } else {

                updatedMovies.add(
                        movie);
            }
        }

        FileUtil.overwriteFile(
                "data/movies.txt",
                updatedMovies);

        return "redirect:/movies";
    }

    // SELECT MOVIE + LOAD SHOWTIMES

    @GetMapping("/select/{movieName}")
    public String selectMovie(

            @PathVariable String movieName,

            Model model) {

        // READ ALL SHOWTIMES

        List<String> allShowtimes =
                FileUtil.readFile(
                        "data/showtimes.txt");

        // FILTER MOVIE SHOWTIMES

        List<String> movieShowtimes =
                new ArrayList<>();

        for(String showtime :
                allShowtimes) {

            if(showtime.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    showtime.split(",");

            if(data.length < 4) {
                continue;
            }

            // FILTER SELECTED MOVIE

            if(data[1].equalsIgnoreCase(
                    movieName)) {

                movieShowtimes.add(
                        showtime);
            }
        }

        // SEND TO JSP

        model.addAttribute(
                "movieName",
                movieName);

        model.addAttribute(
                "showtimes",
                movieShowtimes);

        return "movie-showtimes";
    }
}