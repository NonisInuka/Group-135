<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
uri="jakarta.tags.core" %>

<html>

<head>

    <title>Booking List</title>

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
                    #ece9e6,
                    #ffffff);

            min-height: 100vh;

        }

        .table-card {

            background: white;

            border-radius: 25px;

            padding: 40px;

            margin-top: 40px;

            box-shadow:
                    0 10px 40px rgba(0,0,0,0.15);

        }

        .table tbody tr:hover {

            background-color: #f5f5f5;

            transition: 0.3s;

        }

        .btn-action {

            transition: 0.3s;

        }

        .btn-action:hover {

            transform: translateY(-3px);

        }

        .search-box {

            border-radius: 12px;

            height: 50px;

        }

        .status-badge {

            font-size: 14px;

            padding: 8px 14px;

            border-radius: 20px;

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

    <!-- TITLE -->

    <div class="table-card">

        <h2 class="text-center mb-4">

            <i class="bi bi-card-list"></i>

            All Bookings

        </h2>

        <!-- SEARCH FORM -->

        <form action="/search-booking"
              method="get"
              class="row mb-4">

            <div class="col-md-8">

                <input type="text"
                       name="keyword"
                       class="form-control search-box"
                       placeholder="Search by Booking ID or User ID">

            </div>

            <div class="col-md-4">

                <button class="btn btn-success
                        w-100 search-box">

                    <i class="bi bi-search"></i>

                    Search Booking

                </button>

            </div>

        </form>

        <!-- HISTORY FORM -->

        <form action="/booking-history"
              method="get"
              class="row mb-4">

            <div class="col-md-8">

                <input type="text"
                       name="userId"
                       class="form-control search-box"
                       placeholder="Enter User ID for Booking History">

            </div>

            <div class="col-md-4">

                <button class="btn btn-info
                        w-100 search-box">

                    <i class="bi bi-clock-history"></i>

                    View History

                </button>

            </div>

        </form>

        <!-- TABLE -->

        <div class="table-responsive">

            <table class="table
                   table-bordered
                   table-hover
                   align-middle">

                <thead class="table-dark">

                <tr>

                    <th>Booking ID</th>
                    <th>User ID</th>
                    <th>Movie</th>
                    <th>Showtime</th>
                    <th>Seats</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>

                </tr>

                </thead>

                <tbody>

                <c:forEach var="booking"
                           items="${bookings}">

                    <tr>

                        <td>

                            ${booking.bookingId}

                        </td>

                        <td>

                            ${booking.userId}

                        </td>

                        <td>

                            ${booking.movieName}

                        </td>

                        <td>

                            ${booking.showtime}

                        </td>

                        <td>

                            ${booking.seats}

                        </td>

                        <td>

                            ${booking.bookingDate}

                        </td>

                        <td>

                            <span class=
                            "badge bg-success status-badge">

                                ${booking.status}

                            </span>

                        </td>

                        <td>

                            <a href=
"/edit-booking/${booking.bookingId}"

                               class=
"btn btn-warning btn-sm btn-action">

                                <i class="bi bi-pencil-fill"></i>

                                Edit

                            </a>

                            <a href=
"/delete-booking/${booking.bookingId}"

                               class=
"btn btn-danger btn-sm btn-action">

                                <i class="bi bi-trash-fill"></i>

                                Cancel

                            </a>

                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </div>

        <!-- BUTTONS -->

        <div class="text-center mt-4">

            <a href="/booking-form"
               class="btn btn-primary">

                <i class="bi bi-plus-circle-fill"></i>

                Create Booking

            </a>

            <a href="/"
               class="btn btn-secondary">

                <i class="bi bi-house-fill"></i>

                Dashboard

            </a>

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