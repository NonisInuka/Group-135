package main.java.MovieTicket.servlet;


import main.java.MovieTicket.util.MovieFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-movie")
public class DeleteMovieServlet extends HttpServlet {

    /**
     * Handles POST /delete-movie
     *
     * Reads the movieId from the form, deletes the record via MovieFileHandler,
     * sets a flash message, then redirects back to the movie list.
     *
     * Delete is always POST (never GET) — a GET request should never
     * cause a data change because browsers and crawlers can follow GET links.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movieId = request.getParameter("movieId");

        // ── Validate ──────────────────────────────────────────────────────────
        if (movieId == null || movieId.trim().isEmpty()) {
            request.getSession().setAttribute("errorMsg",
                    "Delete failed: no movie ID was provided.");
            response.sendRedirect(request.getContextPath() + "/movies");
            return;
        }

        // ── Delete ────────────────────────────────────────────────────────────
        boolean deleted = MovieFileHandler.deleteMovie(movieId.trim());

        // ── Flash message & redirect ──────────────────────────────────────────
        if (deleted) {
            request.getSession().setAttribute("successMsg",
                    "Movie (ID: " + movieId + ") was deleted successfully.");
        } else {
            request.getSession().setAttribute("errorMsg",
                    "Could not find a movie with ID \"" + movieId + "\". Nothing was deleted.");
        }

        response.sendRedirect(request.getContextPath() + "/movies");
    }
}
