package com.moviebooking.moviebooking.model;

public class Booking {

    private String bookingId;
    private String userId;
    private String movieName;
    private String showtime;
    private String seats;
    private String bookingDate;
    private String status;

    public Booking() {
    }

    public Booking(String bookingId,
                   String userId,
                   String movieName,
                   String showtime,
                   String seats,
                   String bookingDate,
                   String status) {

        this.bookingId = bookingId;
        this.userId = userId;
        this.movieName = movieName;
        this.showtime = showtime;
        this.seats = seats;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getShowtime() {
        return showtime;
    }

    public void setShowtime(String showtime) {
        this.showtime = showtime;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
