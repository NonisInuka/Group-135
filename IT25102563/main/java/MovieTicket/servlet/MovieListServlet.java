package main.java.MovieTicket.servlet;

import main.java.MovieTicket.model.Movie;
import main.java.MovieTicket.util.MovieFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/movies")
public class MovieListServlet extends HttpServlet {

    /**
     * Handles GET /movies
     *
     * Supports two modes:
     *   1. No parameters  → load all movies
     *   2. ?search=...    → filter by title or genre keyword
     *
     * Puts the result list into request scope and forwards to movie-list.jsp
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchKeyword = request.getParameter("search");
        List<Movie> movies;

        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            // Combine title and genre search results
            List<Movie> byTitle = MovieFileHandler.searchByTitle(searchKeyword);
            List<Movie> byGenre = MovieFileHandler.searchByGenre(searchKeyword);

            // Merge without duplicates
            byTitle.addAll(byGenre);
            byTitle = byTitle.stream()
                    .distinct()
                    .collect(java.util.stream.Collectors.toList());

            movies = byTitle;
            request.setAttribute("searchKeyword", searchKeyword);
        } else {
            movies = MovieFileHandler.getAllMovies();
        }

        // Pass movie list to the JSP
        request.setAttribute("movies", movies);
        request.setAttribute("totalCount", movies.size());

        // Forward to the view
        request.getRequestDispatcher("/WEB-INF/views/movie-list.jsp")
                .forward(request, response);
    }
}
