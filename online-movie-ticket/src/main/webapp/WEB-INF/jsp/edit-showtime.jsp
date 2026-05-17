<%@ page contentType="text/html;charset=UTF-8" %>

<%
String[] showtime =
((String) request.getAttribute("showtime")).split(",");
%>

<html>

<head>

    <title>Edit Showtime</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-warning">
        Edit Showtime
    </h2>

    <form action="/showtimes/update" method="post">

        <input type="number"
               name="id"
               value="<%= showtime[0] %>"
               readonly
               class="form-control mt-3">

        <input type="text"
               name="movieName"
               value="<%= showtime[1] %>"
               class="form-control mt-3">

        <input type="date"
               name="showDate"
               value="<%= showtime[2] %>"
               class="form-control mt-3">

        <input type="time"
               name="showTime"
               value="<%= showtime[3] %>"
               class="form-control mt-3">

        <input type="text"
               name="theater"
               value="<%= showtime[4] %>"
               class="form-control mt-3">

        <button class="btn btn-warning mt-4">

            Update Showtime

        </button>

    </form>

</div>

</body>

</html>