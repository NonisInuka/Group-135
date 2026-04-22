package main.java.MovieTicket.util;

import main.java.MovieTicket.model.Movie;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

    public class MovieFileHandler {


        private static final String FILE_PATH = "data/movies.txt";

        // Read all movies

        /**
         * Reads every line from movies.txt and returns a list of Movie objects.
         * Skips blank lines and malformed entries silently.
         *
         * @return list of all movies (empty list if file does not exist yet)
         */
        public static List<Movie> getAllMovies() {
            List<Movie> movies = new ArrayList<>();
            File file = new File(FILE_PATH);

            if (!file.exists()) return movies;   // no file yet — return empty list

            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    Movie movie = Movie.fromFileString(line);
                    if (movie != null) {
                        movies.add(movie);
                    }
                }
            } catch (IOException e) {
                System.err.println("MovieFileHandler.getAllMovies: " + e.getMessage());
            }

            return movies;
        }

        // ─── Search by title ──────────────────────────────────────────────────────

        /**
         * Returns all movies whose title contains the search keyword
         * (case-insensitive).
         *
         * @param keyword  partial or full title to search for
         * @return         matching movies
         */
        public static List<Movie> searchByTitle(String keyword) {
            List<Movie> results = new ArrayList<>();
            if (keyword == null || keyword.trim().isEmpty()) return results;

            for (Movie movie : getAllMovies()) {
                if (movie.getTitle().toLowerCase().contains(keyword.toLowerCase())) {
                    results.add(movie);
                }
            }
            return results;
        }

        // ─── Search by genre ──────────────────────────────────────────────────────

        /**
         * Returns all movies that match the given genre (case-insensitive).
         *
         * @param genre  genre to filter by (e.g. "Action", "Comedy")
         * @return       matching movies
         */
        public static List<Movie> searchByGenre(String genre) {
            List<Movie> results = new ArrayList<>();
            if (genre == null || genre.trim().isEmpty()) return results;

            for (Movie movie : getAllMovies()) {
                if (movie.getGenre().equalsIgnoreCase(genre.trim())) {
                    results.add(movie);
                }
            }
            return results;
        }

        // ─── Find by ID ───────────────────────────────────────────────────────────

        /**
         * Finds a single movie by its unique ID.
         *
         * @param movieId  the ID to look for (e.g. "M001")
         * @return         the matching Movie, or null if not found
         */
        public static Movie getMovieById(String movieId) {
            if (movieId == null || movieId.trim().isEmpty()) return null;

            for (Movie movie : getAllMovies()) {
                if (movie.getMovieId().equalsIgnoreCase(movieId.trim())) {
                    return movie;
                }
            }
            return null;
        }

        // ─── Add a movie ──────────────────────────────────────────────────────────

        /**
         * Appends a new movie to movies.txt.
         * Creates the file (and parent directories) if they do not exist.
         *
         * @param movie  the Movie object to save
         * @return       true if saved successfully, false otherwise
         */
        public static boolean addMovie(Movie movie) {
            if (movie == null) return false;

            // Auto-generate an ID if one was not supplied
            if (movie.getMovieId() == null || movie.getMovieId().trim().isEmpty()) {
                movie.setMovieId(generateId());
            }

            ensureFileExists();

            try (BufferedWriter writer = new BufferedWriter(
                    new FileWriter(FILE_PATH, true))) {   // true = append mode
                writer.write(movie.toFileString());
                writer.newLine();
                return true;
            } catch (IOException e) {
                System.err.println("MovieFileHandler.addMovie: " + e.getMessage());
                return false;
            }
        }

        // ─── Update a movie ───────────────────────────────────────────────────────

        /**
         * Replaces the entry for the given movie ID with updated data.
         * Rewrites the entire file (standard approach for flat-file storage).
         *
         * @param updatedMovie  Movie object containing the new values
         * @return              true if a matching record was found and updated
         */
        public static boolean updateMovie(Movie updatedMovie) {
            if (updatedMovie == null) return false;

            List<Movie> movies  = getAllMovies();
            boolean     updated = false;

            for (int i = 0; i < movies.size(); i++) {
                if (movies.get(i).getMovieId().equalsIgnoreCase(updatedMovie.getMovieId())) {
                    movies.set(i, updatedMovie);
                    updated = true;
                    break;
                }
            }

            if (updated) writeAll(movies);
            return updated;
        }

        // ─── Delete a movie ───────────────────────────────────────────────────────

        /**
         * Removes the movie with the given ID from movies.txt.
         *
         * @param movieId  ID of the movie to delete
         * @return         true if a matching record was found and removed
         */
        public static boolean deleteMovie(String movieId) {
            if (movieId == null || movieId.trim().isEmpty()) return false;

            List<Movie> movies  = getAllMovies();
            boolean     removed = movies.removeIf(
                    m -> m.getMovieId().equalsIgnoreCase(movieId.trim()));

            if (removed) writeAll(movies);
            return removed;
        }

        // ─── Private helpers ──────────────────────────────────────────────────────

        /**
         * Overwrites movies.txt with the given list of movies.
         * Used internally by update and delete operations.
         */
        private static void writeAll(List<Movie> movies) {
            ensureFileExists();

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
                for (Movie movie : movies) {
                    writer.write(movie.toFileString());
                    writer.newLine();
                }
            } catch (IOException e) {
                System.err.println("MovieFileHandler.writeAll: " + e.getMessage());
            }
        }

        /**
         * Creates the data directory and movies.txt if they don't already exist.
         */
        private static void ensureFileExists() {
            File file = new File(FILE_PATH);
            try {
                file.getParentFile().mkdirs();   // create data/ folder if needed
                file.createNewFile();            // no-op if file already exists
            } catch (IOException e) {
                System.err.println("MovieFileHandler.ensureFileExists: " + e.getMessage());
            }
        }

        /**
         * Generates a simple unique ID based on the current timestamp.
         * Format: M followed by last 4 digits of System.currentTimeMillis()
         * Example: M7342
         */
        private static String generateId() {
            return "M" + (System.currentTimeMillis() % 10000);
        }
    }

