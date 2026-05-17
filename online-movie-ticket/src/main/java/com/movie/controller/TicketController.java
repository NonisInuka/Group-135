package com.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TicketController {

    @GetMapping("/ticket")
    public String ticketPage(

            @RequestParam String movie,

            @RequestParam String seats,

            Model model) {

        // SAMPLE DATA

        model.addAttribute(
                "movie",
                movie);

        model.addAttribute(
                "seats",
                seats);

        model.addAttribute(
                "showtime",
                "7PM");

        model.addAttribute(
                "bookingId",
                "BK" + System.currentTimeMillis());

        return "ticket";
    }
}
