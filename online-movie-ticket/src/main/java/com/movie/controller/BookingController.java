package com.movie.controller;

import com.movie.util.FileUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/bookings")
public class BookingController {

    // VIEW ALL BOOKINGS

    @GetMapping
    public String viewBookings(
            Model model) {

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        model.addAttribute(
                "bookings",
                bookings);

        return "bookings";
    }

    // SAVE BOOKING FROM SEAT PAGE

    @GetMapping("/save-booking")
    public String saveBookingFromSeat(

            @RequestParam("movie") String movie,

            @RequestParam("seats") String seats,

            @RequestParam("showtime") String showtime,

            HttpSession session) {

        try {

            // CHECK LOGIN

            String loggedUser =

                    (String) session.getAttribute(
                            "loggedUser");

            if(loggedUser == null) {

                return "redirect:/login";
            }

            // SAVE SESSION VALUES

            session.setAttribute(
                    "movie",
                    movie);

            session.setAttribute(
                    "seats",
                    seats);

            session.setAttribute(
                    "showtime",
                    showtime);

        } catch (Exception e) {

            e.printStackTrace();
        }

        // GO PAYMENT PAGE

        return "redirect:/payment";
    }

    // PAYMENT SUCCESS

    @PostMapping("/confirm-payment")
    public String confirmPayment(

            HttpSession session,

            Model model) {

        // GET SESSION DATA

        String movie =

                (String) session.getAttribute(
                        "movie");

        String seats =

                (String) session.getAttribute(
                        "seats");

        String showtime =

                (String) session.getAttribute(
                        "showtime");

        String loggedUser =

                (String) session.getAttribute(
                        "loggedUser");

        // READ BOOKINGS

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        // GENERATE BOOKING ID

        int bookingId =
                bookings.size() + 1;

        // SAVE BOOKING

        String bookingData =

                bookingId + "," +

                        loggedUser + "," +

                        movie + "," +

                        showtime + "," +

                        seats;

        FileUtil.writeFile(
                "data/bookings.txt",
                bookingData);

        // SEND DATA TO TICKET PAGE

        model.addAttribute(
                "bookingId",
                bookingId);

        model.addAttribute(
                "movie",
                movie);

        model.addAttribute(
                "seats",
                seats);

        model.addAttribute(
                "showtime",
                showtime);

        return "ticket";
    }

    // MY BOOKINGS

    @GetMapping("/my-bookings")
    public String myBookings(

            HttpSession session,

            Model model) {

        String loggedUser =

                (String) session.getAttribute(
                        "loggedUser");

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        List<String> myBookings =
                new ArrayList<>();

        for(String booking : bookings) {

            if(booking.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    booking.split(",");

            if(data.length < 5) {
                continue;
            }

            // FILTER USER BOOKINGS

            if(data[1].equals(
                    loggedUser)) {

                myBookings.add(
                        booking);
            }
        }

        model.addAttribute(
                "bookings",
                myBookings);

        return "my-bookings";
    }

    // OPEN ADD BOOKING PAGE

    @GetMapping("/add")
    public String addBookingPage() {

        return "add-booking";
    }

    // SAVE MANUAL BOOKING

    @PostMapping("/save")
    public String saveBooking(

            @RequestParam int bookingId,

            @RequestParam String userName,

            @RequestParam String movieName,

            @RequestParam String showtime,

            @RequestParam String seatNumber) {

        String data =

                bookingId + "," +

                        userName + "," +

                        movieName + "," +

                        showtime + "," +

                        seatNumber;

        FileUtil.writeFile(
                "data/bookings.txt",
                data);

        return "redirect:/bookings";
    }

    // DELETE BOOKING

    @GetMapping("/delete/{id}")
    public String deleteBooking(
            @PathVariable int id) {

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        List<String> updatedBookings =
                new ArrayList<>();

        for(String booking : bookings) {

            if(booking.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    booking.split(",");

            if(Integer.parseInt(
                    data[0]) != id) {

                updatedBookings.add(
                        booking);
            }
        }

        FileUtil.overwriteFile(
                "data/bookings.txt",
                updatedBookings);

        return "redirect:/bookings";
    }

    // OPEN EDIT PAGE

    @GetMapping("/edit/{id}")
    public String editBooking(

            @PathVariable int id,

            Model model) {

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        for(String booking : bookings) {

            if(booking.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    booking.split(",");

            if(Integer.parseInt(
                    data[0]) == id) {

                model.addAttribute(
                        "booking",
                        booking);

                break;
            }
        }

        return "edit-booking";
    }

    // UPDATE BOOKING

    @PostMapping("/update")
    public String updateBooking(

            @RequestParam int bookingId,

            @RequestParam String userName,

            @RequestParam String movieName,

            @RequestParam String showtime,

            @RequestParam String seatNumber) {

        List<String> bookings =
                FileUtil.readFile(
                        "data/bookings.txt");

        List<String> updatedBookings =
                new ArrayList<>();

        for(String booking : bookings) {

            if(booking.trim().isEmpty()) {
                continue;
            }

            String[] data =
                    booking.split(",");

            if(Integer.parseInt(
                    data[0]) == bookingId) {

                updatedBookings.add(

                        bookingId + "," +

                                userName + "," +

                                movieName + "," +

                                showtime + "," +

                                seatNumber);

            } else {

                updatedBookings.add(
                        booking);
            }
        }

        FileUtil.overwriteFile(
                "data/bookings.txt",
                updatedBookings);

        return "redirect:/bookings";
    }
}