<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Add Booking</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-primary">
        Create Booking
    </h2>

    <form action="/bookings/save" method="post">

        <input type="number"
               name="bookingId"
               placeholder="Booking ID"
               class="form-control mt-3">

        <input type="text"
               name="userName"
               placeholder="User Name"
               class="form-control mt-3">

        <input type="text"
               name="movieName"
               placeholder="Movie Name"
               class="form-control mt-3">

        <input type="text"
               name="showtime"
               placeholder="Showtime"
               class="form-control mt-3">

        <input type="text"
               name="seatNumber"
               placeholder="Seat Number"
               class="form-control mt-3">

        <button class="btn btn-primary mt-4">

            Save Booking

        </button>

    </form>

</div>

</body>

</html>