package com.movie.model;

public class Booking {

    private int bookingId;
    private String userName;
    private String movieName;
    private String showtime;
    private String seatNumber;

    public Booking() {
    }

    public Booking(int bookingId,
                   String userName,
                   String movieName,
                   String showtime,
                   String seatNumber) {

        this.bookingId = bookingId;
        this.userName = userName;
        this.movieName = movieName;
        this.showtime = showtime;
        this.seatNumber = seatNumber;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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


    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }
}