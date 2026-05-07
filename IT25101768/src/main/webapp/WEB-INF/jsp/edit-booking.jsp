<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Edit Booking</title>

    <!-- Bootstrap -->

    <link href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->

    <link rel="stylesheet"
          href=
"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Font -->

    <link href=
"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <style>

        body {

            font-family: 'Poppins', sans-serif;

            background:
                    linear-gradient(to right,
                    #0f2027,
                    #203a43,
                    #2c5364);

            min-height: 100vh;

        }

        .edit-card {

            background: white;

            border-radius: 25px;

            padding: 40px;

            margin-top: 50px;

            box-shadow:
                    0 10px 40px rgba(0,0,0,0.4);

        }

        .form-control {

            height: 50px;

            border-radius: 12px;

        }

        .btn-custom {

            height: 50px;

            border-radius: 12px;

            font-size: 18px;

            transition: 0.3s;

        }

        .btn-custom:hover {

            transform: translateY(-3px);

        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-lg">

    <div class="container-fluid">

        <a class="navbar-brand fw-bold"
           href="/">

            🎬 Movie Booking System

        </a>

    </div>

</nav>

<div class="container">

    <div class="row justify-content-center">

        <div class="col-md-8">

            <div class="edit-card">

                <h2 class="text-center mb-4">

                    <i class="bi bi-pencil-square"></i>

                    Edit Booking

                </h2>

                <!-- FORM -->

                <form action="/update-booking"
                      method="post">

                    <div class="mb-3">

                        <label class="form-label">

                            Booking ID

                        </label>

                        <input type="text"
                               name="bookingId"
                               class="form-control"
                               value="${booking.bookingId}"
                               readonly>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            User ID

                        </label>

                        <input type="text"
                               name="userId"
                               class="form-control"
                               value="${booking.userId}"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Movie Name

                        </label>

                        <input type="text"
                               name="movieName"
                               class="form-control"
                               value="${booking.movieName}"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Showtime

                        </label>

                        <input type="text"
                               name="showtime"
                               class="form-control"
                               value="${booking.showtime}"
                               required>

                    </div>

                    <div class="mb-4">

                        <label class="form-label">

                            Seats

                        </label>

                        <input type="text"
                               name="seats"
                               class="form-control"
                               value="${booking.seats}"
                               required>

                    </div>

                    <button class="btn btn-success
                            w-100 btn-custom">

                        <i class="bi bi-save-fill"></i>

                        Update Booking

                    </button>

                </form>

                <hr class="my-4">

                <div class="text-center">

                    <a href="/booking-list"
                       class="btn btn-dark">

                        <i class="bi bi-card-list"></i>

                        Booking List

                    </a>

                    <a href="/"
                       class="btn btn-secondary">

                        <i class="bi bi-house-fill"></i>

                        Dashboard

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- FOOTER -->

<footer class="bg-dark text-white
text-center p-3 mt-5">

    <h5>

        Online Movie Ticket Reservation Platform

    </h5>

    <p>

        Developed using Spring Boot,
        JSP and Bootstrap

    </p>

</footer>

</body>

</html>