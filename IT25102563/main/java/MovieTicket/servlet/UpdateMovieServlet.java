package main.java.MovieTicket.servlet;

package com.movieticket.servlet;

import main.java.MovieTicket.model.Movie;
import main.java.MovieTicket.util.MovieFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit-movie")
public class UpdateMovieServlet extends HttpServlet {

    /**
     * Handles GET /edit-movie?id=M001
     * Loads the existing movie by ID and forwards to the edit form,
     * pre-populated with current values.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movieId = request.getParameter("id");

        if (movieId == null || movieId.trim().isEmpty()) {
            request.getSession().setAttribute("errorMsg", "No movie ID provided.");
            response.sendRedirect(request.getContextPath() + "/movies");
            return;
        }

        Movie movie = MovieFileHandler.getMovieById(movieId.trim());

        if (movie == null) {
            request.getSession().setAttribute("errorMsg",
                    "Movie with ID \"" + movieId + "\" was not found.");
            response.sendRedirect(request.getContextPath() + "/movies");
            return;
        }

        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/WEB-INF/views/edit-movie.jsp")
                .forward(request, response);
    }

    /**
     * Handles POST /edit-movie
     * Reads updated form fields, validates them, builds an updated Movie object,
     * and saves it via MovieFileHandler.updateMovie().
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ── 1. Read form parameters ───────────────────────────────────────────
        String movieId      = request.getParameter("movieId");
        String title        = request.getParameter("title");
        String genre        = request.getParameter("genre");
        String durationStr  = request.getParameter("durationMinutes");
        String language     = request.getParameter("language");
        String rating       = request.getParameter("rating");
        String priceStr     = request.getParameter("ticketPrice");
        String available    = request.getParameter("available");  // "true" or null

        // ── 2. Basic validation ───────────────────────────────────────────────
        if (isBlank(movieId) || isBlank(title) || isBlank(genre)
                || isBlank(durationStr) || isBlank(language)
                || isBlank(rating)      || isBlank(priceStr)) {

            request.setAttribute("errorMsg", "All fields are required.");
            // Re-load movie so the form can be re-displayed
            Movie existing = MovieFileHandler.getMovieById(movieId);
            request.setAttribute("movie", existing);
            request.getRequestDispatcher("/WEB-INF/views/edit-movie.jsp")
                    .forward(request, response);
            return;
        }

        // ── 3. Parse numeric fields ───────────────────────────────────────────
        int    duration;
        double price;
        try {
            duration = Integer.parseInt(durationStr.trim());
            price    = Double.parseDouble(priceStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("errorMsg",
                    "Duration must be a whole number and price must be a valid number.");
            Movie existing = MovieFileHandler.getMovieById(movieId);
            request.setAttribute("movie", existing);
            request.getRequestDispatcher("/WEB-INF/views/edit-movie.jsp")
                    .forward(request, response);
            return;
        }

        if (duration <= 0 || price < 0) {
            request.setAttribute("errorMsg",
                    "Duration must be greater than 0 and price cannot be negative.");
            Movie existing = MovieFileHandler.getMovieById(movieId);
            request.setAttribute("movie", existing);
            request.getRequestDispatcher("/WEB-INF/views/edit-movie.jsp")
                    .forward(request, response);
            return;
        }

        // ── 4. Build updated Movie object (keep the same ID) ──────────────────
        Movie updatedMovie = new Movie(
                movieId.trim(),
                title.trim(),
                genre.trim(),
                duration,
                language.trim(),
                rating.trim(),
                price,
                "true".equals(available)
        );

        // ── 5. Save changes ───────────────────────────────────────────────────
        boolean updated = MovieFileHandler.updateMovie(updatedMovie);

        if (updated) {
            request.getSession().setAttribute("successMsg",
                    "Movie \"" + updatedMovie.getTitle() + "\" updated successfully!");
        } else {
            request.getSession().setAttribute("errorMsg",
                    "Could not update the movie. Please try again.");
        }

        // ── 6. Redirect back to movie list ────────────────────────────────────
        response.sendRedirect(request.getContextPath() + "/movies");
    }

    // ── Helper ────────────────────────────────────────────────────────────────

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
