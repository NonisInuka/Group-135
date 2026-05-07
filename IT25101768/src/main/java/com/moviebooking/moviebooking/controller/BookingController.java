package com.moviebooking.moviebooking.controller;

import com.moviebooking.moviebooking.model.Booking;
import com.moviebooking.moviebooking.service.BookingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
public class BookingController {

    @Autowired
    private BookingService bookingService;

    // OPEN BOOKING FORM
    @GetMapping("/booking-form")
    public String bookingForm() {

        return "create-booking";
    }

    // SAVE BOOKING
    @PostMapping("/save-booking")
    public String saveBooking(

            @RequestParam String bookingId,
            @RequestParam String userId,
            @RequestParam String movieName,
            @RequestParam String showtime,
            @RequestParam String seats,
            Model model
    ) {

        // CHECK DUPLICATE BOOKING ID
        if (bookingService.bookingExists(bookingId)) {

            model.addAttribute(
                    "message",
                    "Booking ID already exists!"
            );

            return "create-booking";
        }

        Booking booking = new Booking();

        booking.setBookingId(bookingId);
        booking.setUserId(userId);
        booking.setMovieName(movieName);
        booking.setShowtime(showtime);
        booking.setSeats(seats);

        booking.setBookingDate(
                LocalDate.now().toString());

        booking.setStatus("CONFIRMED");

        bookingService.saveBooking(booking);

        model.addAttribute(
                "message",
                "Booking Saved Successfully!"
        );

        return "create-booking";
    }

    // DISPLAY BOOKINGS
    @GetMapping("/booking-list")
    public String bookingList(Model model) {

        model.addAttribute(
                "bookings",
                bookingService.getAllBookings()
        );

        return "booking-list";
    }

    // DELETE BOOKING
    @GetMapping("/delete-booking/{id}")
    public String deleteBooking(
            @PathVariable("id") String bookingId) {

        bookingService.deleteBooking(bookingId);

        return "redirect:/booking-list";
    }

    // OPEN EDIT PAGE
    @GetMapping("/edit-booking/{id}")
    public String editBooking(
            @PathVariable("id") String bookingId,
            Model model) {

        Booking booking =
                bookingService.findBookingById(bookingId);

        model.addAttribute("booking", booking);

        return "edit-booking";
    }

    // UPDATE BOOKING
    @PostMapping("/update-booking")
    public String updateBooking(

            @RequestParam String bookingId,
            @RequestParam String userId,
            @RequestParam String movieName,
            @RequestParam String showtime,
            @RequestParam String seats
    ) {

        Booking booking = new Booking();

        booking.setBookingId(bookingId);
        booking.setUserId(userId);
        booking.setMovieName(movieName);
        booking.setShowtime(showtime);
        booking.setSeats(seats);

        booking.setBookingDate(
                LocalDate.now().toString());

        booking.setStatus("UPDATED");

        bookingService.updateBooking(booking);

        return "redirect:/booking-list";
    }

    // SEARCH BOOKINGS
    @GetMapping("/search-booking")
    public String searchBooking(

            @RequestParam String keyword,
            Model model
    ) {

        model.addAttribute(
                "bookings",
                bookingService.searchBookings(keyword)
        );

        return "booking-list";
    }

    // USER BOOKING HISTORY
    @GetMapping("/booking-history")
    public String bookingHistory(

            @RequestParam String userId,
            Model model
    ) {

        model.addAttribute(
                "bookings",
                bookingService.getBookingsByUserId(userId)
        );

        return "booking-history";
    }
}