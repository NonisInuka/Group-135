<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movieticket.model.Movie" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies | CineBook</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body        { background-color: #f8f9fa; }
        .navbar     { background-color: #1a1a2e; }
        .page-title { font-weight: 600; font-size: 1.4rem; margin-bottom: 0.25rem; }
        .badge-available   { background-color: #d1fae5; color: #065f46; }
        .badge-unavailable { background-color: #fee2e2; color: #991b1b; }
        .search-bar { max-width: 380px; }
        .table th   { font-size: 0.78rem; text-transform: uppercase;
                      letter-spacing: 0.05em; color: #6b7280; font-weight: 600; }
        .table td   { vertical-align: middle; font-size: 0.92rem; }
        .action-btn { font-size: 0.8rem; padding: 3px 10px; }
        .empty-state { text-align: center; padding: 3rem 0; color: #9ca3af; }
    </style>
</head>
<body>

<%-- ─── Navbar ─────────────────────────────────────────────────────────── --%>
<nav class="navbar navbar-dark px-4 py-3 mb-4">
    <span class="navbar-brand fw-bold fs-5">🎬 CineBook</span>
    <div class="d-flex gap-2">
        <a href="movies" class="btn btn-outline-light btn-sm">All Movies</a>
        <a href="add-movie" class="btn btn-warning btn-sm fw-semibold">+ Add Movie</a>
    </div>
</nav>

<div class="container-lg">

    <%-- ─── Page header ───────────────────────────────────────────────────── --%>
    <div class="d-flex justify-content-between align-items-start mb-4 flex-wrap gap-3">
        <div>
            <p class="page-title">Movie List</p>
            <p class="text-muted mb-0" style="font-size:0.88rem;">
                <%
                    Integer total = (Integer) request.getAttribute("totalCount");
                    String keyword = (String) request.getAttribute("searchKeyword");
                    if (keyword != null && !keyword.isEmpty()) {
                %>
                    Showing <strong><%= total %></strong> result(s) for
                    &ldquo;<strong><%= keyword %></strong>&rdquo;
                    &nbsp;&mdash;&nbsp; <a href="movies">Clear search</a>
                <% } else { %>
                    <strong><%= total %></strong> movie(s) in the system
                <% } %>
            </p>
        </div>

        <%-- Search form --%>
        <form action="movies" method="get" class="d-flex search-bar gap-2">
            <input type="text" name="search" class="form-control form-control-sm"
                   placeholder="Search by title or genre..."
                   value="<%= keyword != null ? keyword : "" %>">
            <button type="submit" class="btn btn-dark btn-sm px-3">Search</button>
        </form>
    </div>


    <%-- ─── Success / error flash messages ───────────────────────────────── --%>
    <%
        String successMsg = (String) session.getAttribute("successMsg");
        String errorMsg   = (String) session.getAttribute("errorMsg");
        if (successMsg != null) { session.removeAttribute("successMsg"); %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= successMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
    <%  }
        if (errorMsg != null) { session.removeAttribute("errorMsg"); %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= errorMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
    <%  } %>

    <%-- ─── Movie table ───────────────────────────────────────────────────── --%>
    <%
        List<Movie> movies = (List<Movie>) request.getAttribute("movies");
        if (movies == null || movies.isEmpty()) {
    %>
        <div class="empty-state">
            <p style="font-size:2.5rem;">🎞️</p>
            <p class="fw-semibold">No movies found.</p>
            <a href="add-movie" class="btn btn-warning btn-sm mt-1">Add the first movie</a>
        </div>
    <% } else { %>

    <div class="card shadow-sm border-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Duration</th>
                        <th>Language</th>
                        <th>Rating</th>
                        <th>Price (LKR)</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Movie movie : movies) { %>
                    <tr>
                        <td class="text-muted"><%= movie.getMovieId() %></td>
                        <td class="fw-semibold"><%= movie.getTitle() %></td>
                        <td><%= movie.getGenre() %></td>
                        <td><%= movie.getDurationMinutes() %> min</td>
                        <td><%= movie.getLanguage() %></td>
                        <td><span class="badge bg-secondary"><%= movie.getRating() %></span></td>
                        <td><%= String.format("%.2f", movie.getTicketPrice()) %></td>
                        <td>
                            <% if (movie.isAvailable()) { %>
                                <span class="badge badge-available px-2 py-1">Showing</span>
                            <% } else { %>
                                <span class="badge badge-unavailable px-2 py-1">Not Showing</span>
                            <% } %>
                        </td>
                        <td>
                            <%-- Edit button --%>
                            <a href="edit-movie?id=<%= movie.getMovieId() %>"
                               class="btn btn-outline-primary action-btn me-1">Edit</a>

                            <%-- Delete button (triggers confirm dialog) --%>
                            <button type="button"
                                    class="btn btn-outline-danger action-btn"
                                    onclick="confirmDelete('<%= movie.getMovieId() %>',
                                                          '<%= movie.getTitle().replace("'", "\\'") %>')">
                                Delete
                            </button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <% } %>
</div>

<%-- ─── Delete confirmation modal ────────────────────────────────────────── --%>
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h6 class="modal-title fw-bold">Confirm Delete</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-muted" style="font-size:0.92rem;">
                Are you sure you want to delete <strong id="modalMovieTitle"></strong>?
                This cannot be undone.
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-secondary btn-sm"
                        data-bs-dismiss="modal">Cancel</button>
                <form id="deleteForm" action="delete-movie" method="post">
                    <input type="hidden" name="movieId" id="modalMovieId">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(movieId, movieTitle) {
        document.getElementById('modalMovieId').value    = movieId;
        document.getElementById('modalMovieTitle').textContent = movieTitle;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
    }
</script>

</body>
</html>