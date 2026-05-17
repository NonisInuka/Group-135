<%@ page contentType="text/html;charset=UTF-8" %>

<%
String[] booking =
((String) request.getAttribute("booking")).split(",");
%>

<html>

<head>

    <title>Edit Booking</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-warning">
        Edit Booking
    </h2>

    <form action="/bookings/update" method="post">

        <input type="number"
               name="bookingId"
               value="<%= booking[0] %>"
               readonly
               class="form-control mt-3">

        <input type="text"
               name="userName"
               value="<%= booking[1] %>"
               class="form-control mt-3">

        <input type="text"
               name="movieName"
               value="<%= booking[2] %>"
               class="form-control mt-3">

        <input type="text"
               name="showtime"
               value="<%= booking[3] %>"
               class="form-control mt-3">

        <input type="text"
               name="seatNumber"
               value="<%= booking[4] %>"
               class="form-control mt-3">

        <button class="btn btn-warning mt-4">

            Update Booking

        </button>

    </form>

</div>

</body>

</html>