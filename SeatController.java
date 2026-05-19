package com.movie.controller;

import com.movie.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/seats")
public class SeatController {

    // VIEW SEATS

    @GetMapping
    public String viewSeats(
            Model model) {

        List<String> seats =
                FileUtil.readFile(
                        "data/seats.txt");

        model.addAttribute(
                "seats",
                seats);

        return "seats";
    }

    // OPEN ADD PAGE

    @GetMapping("/add")
    public String addSeatPage() {

        return "add-seat";
    }

    // SAVE SEAT

    @PostMapping("/save")
    public String saveSeat(

            @RequestParam int id,

            @RequestParam String seatNumber,

            @RequestParam String movieName,

            @RequestParam String status) {

        String data =

                id + "," +

                        seatNumber + "," +

                        movieName + "," +

                        status;

        FileUtil.writeFile(
                "data/seats.txt",
                data);

        return "redirect:/seats";
    }

    // DELETE SEAT

    @GetMapping("/delete/{id}")
    public String deleteSeat(
            @PathVariable int id) {

        List<String> seats =
                FileUtil.readFile(
                        "data/seats.txt");

        List<String> updatedSeats =
                new ArrayList<>();

        for(String seat : seats) {

            if(seat.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    seat.split(",");

            if(Integer.parseInt(
                    data[0]) != id) {

                updatedSeats.add(
                        seat);
            }
        }

        FileUtil.overwriteFile(
                "data/seats.txt",
                updatedSeats);

        return "redirect:/seats";
    }

    // EDIT PAGE

    @GetMapping("/edit/{id}")
    public String editSeat(

            @PathVariable int id,

            Model model) {

        List<String> seats =
                FileUtil.readFile(
                        "data/seats.txt");

        for(String seat : seats) {

            if(seat.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    seat.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                model.addAttribute(
                        "seat",
                        seat);

                break;
            }
        }

        return "edit-seat";
    }

    // UPDATE SEAT

    @PostMapping("/update")
    public String updateSeat(

            @RequestParam int id,

            @RequestParam String seatNumber,

            @RequestParam String movieName,

            @RequestParam String status) {

        List<String> seats =
                FileUtil.readFile(
                        "data/seats.txt");

        List<String> updatedSeats =
                new ArrayList<>();

        for(String seat : seats) {

            if(seat.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    seat.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                updatedSeats.add(

                        id + "," +

                                seatNumber + "," +

                                movieName + "," +

                                status);

            } else {

                updatedSeats.add(
                        seat);
            }
        }

        FileUtil.overwriteFile(
                "data/seats.txt",
                updatedSeats);

        return "redirect:/seats";
    }

    // MOVIE SEAT LAYOUT

    @GetMapping("/movie/{movieName}")
    public String movieSeats(

            @PathVariable String movieName,

            Model model) {

        // READ BOOKINGS

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        // RESERVED SEATS

        List<String> reservedSeats =
                new ArrayList<>();

        for(String booking : bookings) {

            if(booking.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    booking.split(",");

            // CHECK MOVIE

            if(data.length >= 5 &&
                    data[2].equals(movieName)) {

                // GET RESERVED SEATS

                for(int i = 4;
                    i < data.length;
                    i++) {

                    reservedSeats.add(
                            data[i]);
                }
            }
        }

        // SEND DATA TO JSP

        model.addAttribute(
                "movieName",
                movieName);

        model.addAttribute(
                "reservedSeats",
                reservedSeats);

        return "seat-layout";
    }
}