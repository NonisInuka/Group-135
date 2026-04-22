<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.movieticket.model.Movie" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Movie | CineBook</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body          { background-color: #f8f9fa; }
        .navbar       { background-color: #1a1a2e; }
        .form-card    { max-width: 680px; margin: 0 auto; }
        .form-label   { font-size: 0.88rem; font-weight: 500; color: #374151; }
        .section-head { font-size: 0.75rem; font-weight: 600; text-transform: uppercase;
                        letter-spacing: 0.06em; color: #9ca3af; margin: 1.5rem 0 0.75rem; }
        .id-badge     { font-size: 0.78rem; font-family: monospace;
                        background: #f3f4f6; border: 1px solid #e5e7eb;
                        padding: 2px 8px; border-radius: 4px; color: #6b7280; }
    </style>
</head>
<body>

<%-- ─── Navbar ─────────────────────────────────────────────────────────── --%>
<nav class="navbar navbar-dark px-4 py-3 mb-4">
    <span class="navbar-brand fw-bold fs-5">🎬 CineBook</span>
    <a href="movies" class="btn btn-outline-light btn-sm">← Back to Movies</a>
</nav>

<div class="container form-card">

    <%
        Movie movie = (Movie) request.getAttribute("movie");
    %>

    <%-- ─── Page header ───────────────────────────────────────────────────── --%>
    <div class="d-flex align-items-center gap-3 mb-1">
        <h5 class="fw-bold mb-0">Edit Movie</h5>
        <span class="id-badge"><%= movie.getMovieId() %></span>
    </div>
    <p class="text-muted mb-4" style="font-size:0.88rem;">
        Update the details below and click Save Changes.
    </p>

    <%-- ─── Error message ────────────────────────────────────────────────── --%>
    <%
        String errorMsg = (String) request.getAttribute("errorMsg");
        if (errorMsg != null) {
    %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <%= errorMsg %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <%-- ─── Edit form ──────────────────────────────────────────────────────── --%>
    <div class="card border-0 shadow-sm p-4">
        <form action="edit-movie" method="post" novalidate>

            <%-- Hidden field carries the movie ID through the POST --%>
            <input type="hidden" name="movieId" value="<%= movie.getMovieId() %>">

            <p class="section-head">Movie details</p>

            <%-- Title --%>
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" id="title" name="title"
                       class="form-control form-control-sm"
                       value="<%= movie.getTitle() %>" required>
            </div>

            <div class="row g-3 mb-3">
                <%-- Genre --%>
                <div class="col-sm-6">
                    <label for="genre" class="form-label">Genre</label>
                    <select id="genre" name="genre" class="form-select form-select-sm">
                        <%
                            String[] genres = {"Action","Comedy","Drama","Horror",
                                               "Romance","Sci-Fi","Thriller","Animation","Documentary"};
                            for (String g : genres) {
                        %>
                            <option value="<%= g %>"
                                <%= movie.getGenre().equals(g) ? "selected" : "" %>>
                                <%= g %>
                            </option>
                        <% } %>
                    </select>
                </div>

                <%-- Duration --%>
                <div class="col-sm-6">
                    <label for="durationMinutes" class="form-label">Duration (minutes)</label>
                    <input type="number" id="durationMinutes" name="durationMinutes"
                           class="form-control form-control-sm"
                           value="<%= movie.getDurationMinutes() %>"
                           min="1" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <%-- Language --%>
                <div class="col-sm-6">
                    <label for="language" class="form-label">Language</label>
                    <input type="text" id="language" name="language"
                           class="form-control form-control-sm"
                           value="<%= movie.getLanguage() %>" required>
                </div>

                <%-- Age Rating --%>
                <div class="col-sm-6">
                    <label for="rating" class="form-label">Age Rating</label>
                    <select id="rating" name="rating" class="form-select form-select-sm">
                        <%
                            String[] ratings = {"G","PG","PG-13","R","NC-17"};
                            for (String r : ratings) {
                        %>
                            <option value="<%= r %>"
                                <%= movie.getRating().equals(r) ? "selected" : "" %>>
                                <%= r %>
                            </option>
                        <% } %>
                    </select>
                </div>
            </div>

            <p class="section-head">Pricing &amp; availability</p>

            <div class="row g-3 mb-4">
                <%-- Ticket price --%>
                <div class="col-sm-6">
                    <label for="ticketPrice" class="form-label">Ticket Price (LKR)</label>
                    <input type="number" id="ticketPrice" name="ticketPrice"
                           class="form-control form-control-sm"
                           value="<%= movie.getTicketPrice() %>"
                           min="0" step="0.01" required>
                </div>

                <%-- Availability toggle --%>
                <div class="col-sm-6 d-flex flex-column justify-content-end">
                    <div class="form-check form-switch mb-1">
                        <input class="form-check-input" type="checkbox"
                               id="available" name="available" value="true"
                               <%= movie.isAvailable() ? "checked" : "" %>>
                        <label class="form-check-label form-label mb-0" for="available">
                            Currently showing
                        </label>
                    </div>
                    <p class="text-muted mb-0" style="font-size:0.78rem;">
                        Toggle off to mark as no longer showing.
                    </p>
                </div>
            </div>

            <%-- Buttons --%>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-warning btn-sm px-4 fw-semibold">
                    Save Changes
                </button>
                <a href="movies" class="btn btn-outline-secondary btn-sm px-4">
                    Cancel
                </a>
            </div>

        </form>
    </div>
</div>

<div class="mb-5"></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
