package com.example.moviebooking.model;

public class Showtime {

    private int id;
    private String movieName;
    private String showDate;
    private String showTime;
    private String theater;

    public Showtime() {
    }

    public Showtime(int id, String movieName, String showDate, String showTime, String theater) {
        this.id = id;
        this.movieName = movieName;
        this.showDate = showDate;
        this.showTime = showTime;
        this.theater = theater;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getShowDate() {
        return showDate;
    }

    public void setShowDate(String showDate) {
        this.showDate = showDate;
    }

    public String getShowTime() {
        return showTime;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public String getTheater() {
        return theater;
    }

    public void setTheater(String theater) {
        this.theater = theater;
    }

    @Override
    public String toString() {
        return id + "," + movieName + "," + showDate + "," + showTime + "," + theater;
    }
}


