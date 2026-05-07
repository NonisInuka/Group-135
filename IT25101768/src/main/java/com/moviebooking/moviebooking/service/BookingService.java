package com.moviebooking.moviebooking.service;

import com.moviebooking.moviebooking.model.Booking;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class BookingService {

    private final String FILE_PATH =
            "src/main/resources/bookings.txt";

    // SAVE BOOKING
    public void saveBooking(Booking booking) {

        try {

            BufferedWriter writer =
                    new BufferedWriter(
                            new FileWriter(FILE_PATH, true));

            writer.write(
                    booking.getBookingId() + "," +
                            booking.getUserId() + "," +
                            booking.getMovieName() + "," +
                            booking.getShowtime() + "," +
                            booking.getSeats() + "," +
                            booking.getBookingDate() + "," +
                            booking.getStatus()
            );

            writer.newLine();

            writer.close();

        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    // READ ALL BOOKINGS
    public List<Booking> getAllBookings() {

        List<Booking> bookings =
                new ArrayList<>();

        try {

            BufferedReader reader =
                    new BufferedReader(
                            new FileReader(FILE_PATH));

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split(",");

                Booking booking = new Booking(
                        data[0],
                        data[1],
                        data[2],
                        data[3],
                        data[4],
                        data[5],
                        data[6]
                );

                bookings.add(booking);
            }

            reader.close();

        } catch (IOException e) {

            e.printStackTrace();
        }

        return bookings;
    }

    // DELETE BOOKING
    public void deleteBooking(String bookingId) {

        List<Booking> bookings = getAllBookings();

        try {

            BufferedWriter writer =
                    new BufferedWriter(
                            new FileWriter(FILE_PATH));

            for (Booking booking : bookings) {

                if (!booking.getBookingId()
                        .equals(bookingId)) {

                    writer.write(
                            booking.getBookingId() + "," +
                                    booking.getUserId() + "," +
                                    booking.getMovieName() + "," +
                                    booking.getShowtime() + "," +
                                    booking.getSeats() + "," +
                                    booking.getBookingDate() + "," +
                                    booking.getStatus()
                    );

                    writer.newLine();
                }
            }

            writer.close();

        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    // FIND BOOKING BY ID
    public Booking findBookingById(String bookingId) {

        List<Booking> bookings = getAllBookings();

        for (Booking booking : bookings) {

            if (booking.getBookingId()
                    .equals(bookingId)) {

                return booking;
            }
        }

        return null;
    }

    // UPDATE BOOKING
    public void updateBooking(Booking updatedBooking) {

        List<Booking> bookings = getAllBookings();

        try {

            BufferedWriter writer =
                    new BufferedWriter(
                            new FileWriter(FILE_PATH));

            for (Booking booking : bookings) {

                if (booking.getBookingId()
                        .equals(updatedBooking.getBookingId())) {

                    writer.write(
                            updatedBooking.getBookingId() + "," +
                                    updatedBooking.getUserId() + "," +
                                    updatedBooking.getMovieName() + "," +
                                    updatedBooking.getShowtime() + "," +
                                    updatedBooking.getSeats() + "," +
                                    updatedBooking.getBookingDate() + "," +
                                    updatedBooking.getStatus()
                    );

                } else {

                    writer.write(
                            booking.getBookingId() + "," +
                                    booking.getUserId() + "," +
                                    booking.getMovieName() + "," +
                                    booking.getShowtime() + "," +
                                    booking.getSeats() + "," +
                                    booking.getBookingDate() + "," +
                                    booking.getStatus()
                    );
                }

                writer.newLine();
            }

            writer.close();

        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    // SEARCH BOOKINGS
    public List<Booking> searchBookings(String keyword) {

        List<Booking> results =
                new ArrayList<>();

        List<Booking> bookings =
                getAllBookings();

        for (Booking booking : bookings) {

            if (booking.getBookingId()
                    .toLowerCase()
                    .contains(keyword.toLowerCase())

                    ||

                    booking.getUserId()
                            .toLowerCase()
                            .contains(keyword.toLowerCase())
            ) {

                results.add(booking);
            }
        }

        return results;
    }

    // GET USER BOOKING HISTORY
    public List<Booking> getBookingsByUserId(String userId) {

        List<Booking> results =
                new ArrayList<>();

        List<Booking> bookings =
                getAllBookings();

        for (Booking booking : bookings) {

            if (booking.getUserId()
                    .equalsIgnoreCase(userId)) {

                results.add(booking);
            }
        }

        return results;
    }

    // CHECK DUPLICATE BOOKING ID
    public boolean bookingExists(String bookingId) {

        List<Booking> bookings =
                getAllBookings();

        for (Booking booking : bookings) {

            if (booking.getBookingId()
                    .equalsIgnoreCase(bookingId)) {

                return true;
            }
        }

        return false;
    }
}