package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String adminDashboard(
            Model model) {

        // USERS

        List<String> users =
                FileUtil.readFile(
                        "data/users.txt");

        // MOVIES

        List<String> movies =
                FileUtil.readFile(
                        "data/movies.txt");

        // SHOWTIMES

        List<String> showtimes =
                FileUtil.readFile(
                        "data/showtimes.txt");

        // SEATS

        List<String> seats =
                FileUtil.readFile(
                        "data/seats.txt");

        // BOOKINGS

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        // COUNTS

        int totalUsers =
                users.size();

        int totalMovies =
                movies.size();

        int totalShowtimes =
                showtimes.size();

        int totalSeats =
                seats.size();

        int totalBookings =
                bookings.size();

        // REVENUE

        int revenue = 0;

        // POPULAR MOVIE

        Map<String,Integer> movieCount =
                new HashMap<>();

        for(String booking : bookings) {

            if(booking.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    booking.split(",");

            if(data.length < 5) {
                continue;
            }

            // COUNT SEATS

            int seatCount =
                    data.length - 4;

            // Rs.1200 PER SEAT

            revenue +=
                    seatCount * 1200;

            // MOVIE NAME

            String movie =
                    data[2];

            movieCount.put(

                    movie,

                    movieCount.getOrDefault(
                            movie,
                            0) + 1);
        }

        // FIND MOST POPULAR MOVIE

        String popularMovie =
                "N/A";

        int max = 0;

        for(String movie :
                movieCount.keySet()) {

            if(movieCount.get(movie)
                    > max) {

                max =
                        movieCount.get(movie);

                popularMovie =
                        movie;
            }
        }

        // SEND DATA

        model.addAttribute(
                "totalUsers",
                totalUsers);

        model.addAttribute(
                "totalMovies",
                totalMovies);

        model.addAttribute(
                "totalShowtimes",
                totalShowtimes);

        model.addAttribute(
                "totalSeats",
                totalSeats);

        model.addAttribute(
                "totalBookings",
                totalBookings);

        model.addAttribute(
                "revenue",
                revenue);

        model.addAttribute(
                "popularMovie",
                popularMovie);

        return "admin-dashboard";
    }
}