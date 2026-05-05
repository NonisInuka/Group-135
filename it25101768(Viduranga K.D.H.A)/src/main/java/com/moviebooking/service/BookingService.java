package com.moviebooking.service;

import com.moviebooking.model.Booking;
import org.springframework.stereotype.Service;

import java.io.*;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class BookingService {

    private static final String FILE = "bookings.txt";

    // ✅ CREATE BOOKING
    public void createBooking(Booking booking) throws IOException {

        // Generate booking details
        booking.setBookingId(UUID.randomUUID().toString());
        booking.setBookingTime(LocalDateTime.now().toString());
        booking.setStatus("ACTIVE");

        // Open file in append mode
        BufferedWriter writer =
                new BufferedWriter(new FileWriter(FILE, true));

        // Save booking data
        writer.write(
                booking.getBookingId() + "," +
                        booking.getUserId() + "," +
                        booking.getShowtimeId() + "," +
                        booking.getSeats() + "," +
                        booking.getBookingTime() + "," +
                        booking.getStatus().trim()
        );

        writer.newLine();
        writer.close();
    }

    // ✅ GET ALL BOOKINGS (SAFE VERSION)
    public List<Booking> getAllBookings() throws IOException {

        List<Booking> list = new ArrayList<>();

        File file = new File(FILE);
        if (!file.exists()) return list;

        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;

        while ((line = reader.readLine()) != null) {

            if (line.trim().isEmpty()) continue; // skip empty lines

            String[] data = line.split(",");

            if (data.length < 6) continue; // skip broken lines

            Booking b = new Booking();
            b.setBookingId(data[0]);
            b.setUserId(data[1]);
            b.setShowtimeId(data[2]);
            b.setSeats(data[3]);
            b.setBookingTime(data[4]);
            b.setStatus(data[5]);

            list.add(b);
        }

        reader.close();
        return list;
    }

    // ✅ CANCEL BOOKING
    public void cancelBooking(String id) throws IOException {

        List<Booking> list = getAllBookings();

        BufferedWriter writer = new BufferedWriter(new FileWriter(FILE));

        for (Booking b : list) {

            if (b.getBookingId().equals(id)) {
                b.setStatus("CANCELLED");
            }

            writer.write(
                    b.getBookingId() + "," +
                            b.getUserId() + "," +
                            b.getShowtimeId() + "," +
                            b.getSeats() + "," +
                            b.getBookingTime() + "," +
                            b.getStatus()
            );
            writer.newLine();
        }

        writer.close();
    }

    // ✅ GET BOOKINGS BY USER
    public List<Booking> getUserBookings(String userId) throws IOException {

        List<Booking> all = getAllBookings();
        List<Booking> result = new ArrayList<>();

        for (Booking b : all) {
            if (b.getUserId().equals(userId)) {
                result.add(b);
            }
        }

        return result;
    }
}