package com.moviebooking.controller;

import com.moviebooking.model.Booking;
import com.moviebooking.service.BookingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BookingController {

    private BookingService service = new BookingService();

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/booking")
    public String page() {
        return "booking";
    }

    @PostMapping("/createBooking")
    public String create(@RequestParam String userId,
                         @RequestParam String showtimeId,
                         @RequestParam String seats) throws Exception {

        if(userId.isEmpty() || showtimeId.isEmpty() || seats.isEmpty()){
            return "booking";
        }

        Booking b = new Booking();
        b.setUserId(userId);
        b.setShowtimeId(showtimeId);
        b.setSeats(seats);

        service.createBooking(b);

        return "success";
    }

    @GetMapping("/allBookings")
    public String view(Model model) throws Exception {
        model.addAttribute("list", service.getAllBookings());
        return "viewBookings";
    }

    @GetMapping("/cancel")
    public String cancel(@RequestParam String id) throws Exception {
        service.cancelBooking(id);
        return "redirect:/allBookings";
    }

    @GetMapping("/history")
    public String history(@RequestParam String userId, Model model) throws Exception {

        model.addAttribute("list", service.getUserBookings(userId));
        return "history";
    }
}
