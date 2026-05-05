<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Movie | CineBook</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body          { background-color: #f8f9fa; }
        .navbar       { background-color: #1a1a2e; }
        .form-card    { max-width: 680px; margin: 0 auto; }
        .form-label   { font-size: 0.88rem; font-weight: 500; color: #374151; }
        .section-head { font-size: 0.75rem; font-weight: 600; text-transform: uppercase;
                        letter-spacing: 0.06em; color: #9ca3af; margin: 1.5rem 0 0.75rem; }
    </style>
</head>
<body>

<%-- ─── Navbar ─────────────────────────────────────────────────────────── --%>
<nav class="navbar navbar-dark px-4 py-3 mb-4">
    <span class="navbar-brand fw-bold fs-5">🎬 CineBook</span>
    <a href="movies" class="btn btn-outline-light btn-sm">← Back to Movies</a>
</nav>

<div class="container form-card">

    <%-- ─── Page header ───────────────────────────────────────────────────── --%>
    <h5 class="fw-bold mb-1">Add New Movie</h5>
    <p class="text-muted mb-4" style="font-size:0.88rem;">
        Fill in the details below. All fields are required.
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

    <%-- ─── Form ──────────────────────────────────────────────────────────── --%>
    <%
        // Re-populate fields if the form was returned due to validation errors
        String rTitle    = (String) request.getAttribute("title");
        String rGenre    = (String) request.getAttribute("genre");
        String rLang     = (String) request.getAttribute("language");
        String rRating   = (String) request.getAttribute("rating");
        String rPrice    = (String) request.getAttribute("priceStr");
        String rDuration = (String) request.getAttribute("durationStr");

        rTitle    = rTitle    != null ? rTitle    : "";
        rGenre    = rGenre    != null ? rGenre    : "";
        rLang     = rLang     != null ? rLang     : "";
        rRating   = rRating   != null ? rRating   : "";
        rPrice    = rPrice    != null ? rPrice    : "";
        rDuration = rDuration != null ? rDuration : "";
    %>

    <div class="card border-0 shadow-sm p-4">
        <form action="add-movie" method="post" novalidate>

            <p class="section-head">Movie details</p>

            <%-- Title --%>
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" id="title" name="title"
                       class="form-control form-control-sm"
                       placeholder="e.g. Inception"
                       value="<%= rTitle %>" required>
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
                                <%= rGenre.equals(g) ? "selected" : "" %>>
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
                           placeholder="e.g. 148" min="1"
                           value="<%= rDuration %>" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <%-- Language --%>
                <div class="col-sm-6">
                    <label for="language" class="form-label">Language</label>
                    <input type="text" id="language" name="language"
                           class="form-control form-control-sm"
                           placeholder="e.g. English"
                           value="<%= rLang %>" required>
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
                                <%= rRating.equals(r) ? "selected" : "" %>>
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
                           placeholder="e.g. 1200" min="0" step="0.01"
                           value="<%= rPrice %>" required>
                </div>

                <%-- Availability toggle --%>
                <div class="col-sm-6 d-flex flex-column justify-content-end">
                    <div class="form-check form-switch mb-1">
                        <input class="form-check-input" type="checkbox"
                               id="available" name="available" value="true" checked>
                        <label class="form-check-label form-label mb-0" for="available">
                            Currently showing
                        </label>
                    </div>
                    <p class="text-muted mb-0" style="font-size:0.78rem;">
                        Toggle off if the movie is not yet released.
                    </p>
                </div>
            </div>

            <%-- Buttons --%>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-warning btn-sm px-4 fw-semibold">
                    Save Movie
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
