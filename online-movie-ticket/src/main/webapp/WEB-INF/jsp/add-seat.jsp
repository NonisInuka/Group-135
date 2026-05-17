<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Add Seat</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-primary">
        Add Seat Reservation
    </h2>

    <form action="/seats/save" method="post">

        <input type="number"
               name="id"
               placeholder="Seat ID"
               class="form-control mt-3">

        <input type="text"
               name="seatNumber"
               placeholder="Seat Number (A1)"
               class="form-control mt-3">

        <input type="text"
               name="movieName"
               placeholder="Movie Name"
               class="form-control mt-3">

        <select name="status"
                class="form-control mt-3">

            <option value="Available">
                Available
            </option>

            <option value="Reserved">
                Reserved
            </option>

        </select>

        <button class="btn btn-primary mt-4">

            Save Seat

        </button>

    </form>

</div>

</body>

</html>