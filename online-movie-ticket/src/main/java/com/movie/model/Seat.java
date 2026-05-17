package com.movie.model;

public class Seat {

    private int id;
    private String seatNumber;
    private String movieName;
    private String status;

    public Seat() {
    }

    public Seat(int id,
                String seatNumber,
                String movieName,
                String status) {

        this.id = id;
        this.seatNumber = seatNumber;
        this.movieName = movieName;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }


    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
