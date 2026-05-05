package main.java.MovieTicket.model;

public class Movie {

    private String movieId;
    private String title;
    private String genre;
    private int durationMinutes;
    private String language;
    private String rating;
    private double ticketPrice;
    private boolean available;  //true = currently showing

    //Default Constructor
    public Movie() {
    }
    //Parameterized Constructor
    public Movie(String movieId, String title, String genre, int durationMinutes, String language, String rating, double ticketPrice, boolean available) {
        this.movieId = movieId;
        this.title = title;
        this.genre = genre;
        this.durationMinutes = durationMinutes;
        this.language = language;
        this.rating = rating;
        this.ticketPrice = ticketPrice;
        this.available = available;
    }

    public static Movie fromFileString(String line) {
        return null;
    }

    //Getters

    public String getMovieId() {
        return movieId;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public int getDurationMinutes() {
        return durationMinutes;
    }

    public String getLanguage() {
        return language;
    }

    public String getRating() {
        return rating;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public boolean isAvailable() {
        return available;
    }

    //Setters

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public void setTitle(String title) {
        title = title;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setDurationMinutes(int durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String toFileString() {
        return movieId + "," +
                title + "," +
                genre + "," +
                durationMinutes + "," +
                language + "," +
                rating + "," +
                ticketPrice + "," +
                available;
    }
    @Override
    public String toString() {
        return "Movie{" +
                "movieId='"  + movieId  + '\'' +
                ", title='"  + title    + '\'' +
                ", genre='"  + genre    + '\'' +
                ", duration=" + durationMinutes + " min" +
                ", language='" + language + '\'' +
                ", rating='" + rating   + '\'' +
                ", price="   + ticketPrice +
                ", available=" + available +
                '}';
    }
}