<%@ page contentType="text/html;charset=UTF-8" %>

<%
String[] movie =
((String) request.getAttribute("movie")).split(",");
%>

<html>

<head>

    <title>Edit Movie</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-warning">
        Edit Movie
    </h2>

    <form action="/movies/update" method="post">

        <input type="number"
               name="id"
               value="<%= movie[0] %>"
               readonly
               class="form-control mt-3">

        <input type="text"
               name="title"
               value="<%= movie[1] %>"
               class="form-control mt-3">

        <input type="text"
               name="genre"
               value="<%= movie[2] %>"
               class="form-control mt-3">

        <input type="text"
               name="duration"
               value="<%= movie[3] %>"
               class="form-control mt-3">

        <input type="text"
               name="director"
               value="<%= movie[4] %>"
               class="form-control mt-3">

        <input type="text"
               name="rating"
               value="<%= movie[5] %>"
               class="form-control mt-3">

        <button class="btn btn-warning mt-4">

            Update Movie

        </button>

    </form>

</div>

</body>

</html>