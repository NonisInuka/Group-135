<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>

<html>

<head>

    <title>My Booking History</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        body{

            background:
            linear-gradient(
            rgba(0,0,0,0.8),
            rgba(0,0,0,0.8)),

            url('/images/cinema-bg.jpg');

            background-size:cover;
            background-attachment:fixed;

            min-height:100vh;

            color:white;
        }

        /* PAGE TITLE */

        .page-title{

            font-size:65px;

            font-weight:bold;

            text-align:center;

            margin-top:50px;

            margin-bottom:50px;

            color:#4d79ff;

            text-shadow:
            0 0 20px
            rgba(255,255,255,0.4);
        }

        /* GLASS TABLE */

        .glass-box{

            background:
            rgba(255,255,255,0.08);

            backdrop-filter:
            blur(12px);

            border-radius:25px;

            padding:30px;

            box-shadow:
            0 8px 30px
            rgba(0,0,0,0.4);
        }

        /* TABLE */

        .table{

            overflow:hidden;

            border-radius:20px;

            margin-bottom:0;
        }

        .table thead{

            background:#111827;

            color:white;
        }

        .table th{

            padding:20px;

            font-size:22px;
        }

        .table td{

            padding:20px;

            font-size:20px;

            vertical-align:middle;
        }

        .table tbody tr{

            transition:0.3s;
        }

        .table tbody tr:hover{

            background:
            rgba(255,255,255,0.1);

            transform:scale(1.01);
        }

        /* BADGES */

        .movie-badge{

            background:#0d6efd;

            padding:10px 20px;

            border-radius:50px;

            color:white;

            font-weight:bold;
        }

        .seat-badge{

            background:#198754;

            padding:10px 20px;

            border-radius:50px;

            color:white;

            font-weight:bold;
        }

        .showtime-badge{

            background:#ffc107;

            padding:10px 20px;

            border-radius:50px;

            color:black;

            font-weight:bold;
        }

        /* EMPTY MESSAGE */

        .empty-box{

            text-align:center;

            padding:80px;

            background:
            rgba(255,255,255,0.08);

            border-radius:25px;

            backdrop-filter:
            blur(10px);
        }

        .empty-box i{

            font-size:90px;

            color:#ffc107;

            margin-bottom:20px;
        }

        /* FOOTER */

        footer{

            margin-top:80px;

            background:#111;

            padding:30px;

            text-align:center;

            color:white;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5">

    <h1 class="page-title">

        <i class="fa-solid fa-ticket"></i>

        My Booking History

    </h1>

    <%

    List<String> bookings =
    (List<String>) request.getAttribute(
            "bookings");

    if(bookings != null &&
       !bookings.isEmpty()) {
    %>

    <div class="glass-box">

        <table class="table table-dark table-hover align-middle">

            <thead>

            <tr>

                <th>ID</th>

                <th>Movie</th>

                <th>Showtime</th>

                <th>Seat</th>

                <th>Status</th>

            </tr>

            </thead>

            <tbody>

            <%

            for(String booking : bookings) {

                if(booking.trim().isEmpty()) {
                    continue;
                }

                String[] data =
                        booking.split(",");

                if(data.length < 4) {
                    continue;
                }

                String id = data[0];
                String movie = data[1];
                String showtime = data[2];
                String seat = data[3];
            %>

            <tr>

                <td>

                    #<%= id %>

                </td>

                <td>

                    <span class="movie-badge">

                        <%= movie %>

                    </span>

                </td>

                <td>

                    <span class="showtime-badge">

                        <%= showtime %>

                    </span>

                </td>

                <td>

                    <span class="seat-badge">

                        <%= seat %>

                    </span>

                </td>

                <td>

                    <span class="badge bg-success p-3">

                        Confirmed

                    </span>

                </td>

            </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>

    <%
    } else {
    %>

    <div class="empty-box">

        <i class="fa-solid fa-film"></i>

        <h2>

            No Bookings Found

        </h2>

        <p class="mt-3">

            Book your favorite movies now.

        </p>

        <a href="/"
           class="btn btn-primary btn-lg mt-4 px-5 rounded-pill">

            Browse Movies

        </a>

    </div>

    <%
    }
    %>

</div>

<footer>

    © 2026 Movie Ticket Platform | All Rights Reserved

</footer>

</body>

</html>