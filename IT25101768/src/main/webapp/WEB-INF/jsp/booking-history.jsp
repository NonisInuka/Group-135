<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

    <title>Booking History</title>

    <link href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="container mt-5">

<h2 class="mb-4">

    User Booking History

</h2>

<table class="table table-bordered table-striped">

    <thead class="table-dark">

    <tr>

        <th>Booking ID</th>
        <th>User ID</th>
        <th>Movie</th>
        <th>Showtime</th>
        <th>Seats</th>
        <th>Date</th>
        <th>Status</th>

    </tr>

    </thead>

    <tbody>

    <c:forEach var="booking"
               items="${bookings}">

        <tr>

            <td>${booking.bookingId}</td>
            <td>${booking.userId}</td>
            <td>${booking.movieName}</td>
            <td>${booking.showtime}</td>
            <td>${booking.seats}</td>
            <td>${booking.bookingDate}</td>
            <td>${booking.status}</td>

        </tr>

    </c:forEach>

    </tbody>

</table>

<a href="/booking-list"
   class="btn btn-primary">

    Back to Booking List

</a>

</body>

</html>