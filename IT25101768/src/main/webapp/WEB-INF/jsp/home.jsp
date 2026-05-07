<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Movie Booking Dashboard</title>

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
                    #141e30,
                    #243b55);

            min-height: 100vh;

        }

        .dashboard-card {

            background: rgba(255,255,255,0.1);

            border-radius: 25px;

            padding: 50px;

            margin-top: 50px;

            backdrop-filter: blur(10px);

            box-shadow:
                    0 10px 40px rgba(0,0,0,0.4);

        }

        .menu-btn {

            height: 140px;

            border-radius: 20px;

            font-size: 22px;

            font-weight: bold;

            transition: 0.3s;

        }

        .menu-btn:hover {

            transform: translateY(-5px);

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

    <div class="dashboard-card">

        <h1 class="text-center text-white mb-5">

            Online Movie Ticket Reservation Platform

        </h1>

        <div class="row g-4">

            <div class="col-md-3">

                <a href="/booking-form"
                   class="btn btn-primary
                   w-100 menu-btn">

                    <i class="bi bi-plus-circle-fill"></i>

                    <br><br>

                    Create Booking

                </a>

            </div>

            <div class="col-md-3">

                <a href="/booking-list"
                   class="btn btn-success
                   w-100 menu-btn">

                    <i class="bi bi-card-list"></i>

                    <br><br>

                    View Bookings

                </a>

            </div>

            <div class="col-md-3">

                <a href="/booking-list"
                   class="btn btn-warning
                   w-100 menu-btn">

                    <i class="bi bi-search"></i>

                    <br><br>

                    Search Booking

                </a>

            </div>

            <div class="col-md-3">

                <a href="/booking-list"
                   class="btn btn-info
                   w-100 menu-btn">

                    <i class="bi bi-clock-history"></i>

                    <br><br>

                    Booking History

                </a>

            </div>

        </div>

    </div>

</div>

<!-- FOOTER -->

<footer class="bg-dark text-white text-center p-3 mt-5">

    <h5>

        Online Movie Ticket Reservation Platform

    </h5>

    <p>

        Developed using Spring Boot, JSP and Bootstrap

    </p>

</footer>

</body>

</html>