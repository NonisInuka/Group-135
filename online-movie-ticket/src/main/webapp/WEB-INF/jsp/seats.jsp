<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>

<html>

<head>

    <title>Seat Management</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        body{

            background:
            linear-gradient(
            135deg,
            #f5f7fa,
            #e4e8f0);

            min-height:100vh;

            font-family:Arial,sans-serif;
        }

        /* TITLE */

        .title-box{

            display:flex;

            justify-content:space-between;

            align-items:center;

            margin-top:40px;

            margin-bottom:30px;
        }

        .page-title{

            font-size:60px;

            font-weight:bold;

            color:#111827;
        }

        /* TOP CARDS */

        .top-card{

            background:white;

            border-radius:25px;

            padding:25px;

            box-shadow:
            0 10px 25px
            rgba(0,0,0,0.08);

            transition:0.3s;
        }

        .top-card:hover{

            transform:
            translateY(-5px);
        }

        .top-icon{

            width:70px;

            height:70px;

            border-radius:20px;

            display:flex;

            align-items:center;

            justify-content:center;

            font-size:30px;

            color:white;
        }

        /* TABLE */

        .seat-table{

            background:white;

            border-radius:30px;

            overflow:hidden;

            box-shadow:
            0 10px 30px
            rgba(0,0,0,0.08);
        }

        .table{

            margin-bottom:0;
        }

        .table thead{

            background:
            linear-gradient(
            90deg,
            #111827,
            #2563eb);

            color:white;
        }

        .table th{

            padding:22px;

            font-size:20px;
        }

        .table td{

            padding:22px;

            vertical-align:middle;

            font-size:18px;
        }

        .table tbody tr{

            transition:0.3s;
        }

        .table tbody tr:hover{

            background:#f8fafc;
        }

        /* BUTTONS */

        .add-btn{

            background:
            linear-gradient(
            90deg,
            #2563eb,
            #9333ea);

            color:white;

            border:none;

            padding:15px 35px;

            border-radius:50px;

            font-size:20px;

            font-weight:bold;

            transition:0.3s;
        }

        .layout-btn{

            background:
            linear-gradient(
            90deg,
            #06b6d4,
            #3b82f6);

            color:white;

            border:none;

            padding:15px 35px;

            border-radius:50px;

            font-size:20px;

            font-weight:bold;

            transition:0.3s;
        }

        .add-btn:hover,
        .layout-btn:hover{

            transform:scale(1.03);
        }

        .edit-btn{

            background:#facc15;

            color:black;

            border:none;

            padding:10px 22px;

            border-radius:12px;

            font-weight:bold;
        }

        .delete-btn{

            background:#ef4444;

            color:white;

            border:none;

            padding:10px 22px;

            border-radius:12px;

            font-weight:bold;
        }

        /* STATUS */

        .available{

            background:#22c55e;

            color:white;

            padding:10px 18px;

            border-radius:20px;

            font-size:15px;

            font-weight:bold;
        }

        .reserved{

            background:#ef4444;

            color:white;

            padding:10px 18px;

            border-radius:20px;

            font-size:15px;

            font-weight:bold;
        }

        /* SEARCH */

        .search-box{

            border-radius:50px;

            padding:15px 25px;

            border:none;

            box-shadow:
            0 5px 20px
            rgba(0,0,0,0.08);

            width:350px;
        }

        /* SEAT ICON */

        .seat-icon{

            width:60px;

            height:60px;

            border-radius:18px;

            background:
            linear-gradient(
            135deg,
            #2563eb,
            #7c3aed);

            display:flex;

            align-items:center;

            justify-content:center;

            color:white;

            font-size:25px;
        }

        /* FOOTER */

        footer{

            margin-top:80px;

            background:
            linear-gradient(
            90deg,
            #111827,
            #1e3a8a);

            color:white;

            padding:30px;

            text-align:center;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container">

    <!-- TITLE -->

    <div class="title-box">

        <div>

            <h1 class="page-title">

                <i class="fa-solid fa-couch"></i>

                Seat Reservations

            </h1>

            <p class="text-secondary fs-4">

                Manage cinema seat reservations

            </p>

        </div>

        <input type="text"
               placeholder="Search seats..."
               class="search-box">
    </div>

    <!-- TOP CARDS -->

    <div class="row mb-5">

        <div class="col-md-4">

            <div class="top-card d-flex align-items-center">

                <div class="top-icon bg-primary me-4">

                    <i class="fa-solid fa-couch"></i>

                </div>

                <div>

                    <h3>Total Seats</h3>

                    <h2>

                        <%= ((List<String>)request.getAttribute("seats")).size() %>

                    </h2>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="top-card d-flex align-items-center">

                <div class="top-icon bg-success me-4">

                    <i class="fa-solid fa-check"></i>

                </div>

                <div>

                    <h3>Available</h3>

                    <h2>Open</h2>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="top-card d-flex align-items-center">

                <div class="top-icon bg-danger me-4">

                    <i class="fa-solid fa-lock"></i>

                </div>

                <div>

                    <h3>Reserved</h3>

                    <h2>Booked</h2>

                </div>

            </div>

        </div>

    </div>

    <!-- BUTTONS -->

    <div class="mb-4">

        <a href="/seats/add"
           class="btn add-btn">

            <i class="fa-solid fa-plus"></i>

            Add Seat

        </a>

        <a href="/seats/layout"
           class="btn layout-btn ms-2">

            <i class="fa-solid fa-layer-group"></i>

            Seat Layout

        </a>

    </div>

    <!-- TABLE -->

    <div class="seat-table">

        <table class="table">

            <thead>

            <tr>

                <th>ID</th>

                <th>Seat</th>

                <th>Movie</th>

                <th>Status</th>

                <th>Actions</th>

            </tr>

            </thead>

            <tbody>

            <%

            List<String> seats =
            (List<String>) request.getAttribute(
                    "seats");

            for(String seat : seats) {

                String[] data =
                        seat.split(",");

                if(data.length < 4) {
                    continue;
                }

                String id = data[0];
                String seatNo = data[1];
                String movie = data[2];
                String status = data[3];
            %>

            <tr>

                <td>

                    <%= id %>

                </td>

                <td>

                    <div class="d-flex align-items-center">

                        <div class="seat-icon me-3">

                            <i class="fa-solid fa-couch"></i>

                        </div>

                        <strong>

                            <%= seatNo %>

                        </strong>

                    </div>

                </td>

                <td>

                    <%= movie %>

                </td>

                <td>

                    <%

                    if(status.equalsIgnoreCase(
                            "Available")) {
                    %>

                    <span class="available">

                        Available

                    </span>

                    <%
                    } else {
                    %>

                    <span class="reserved">

                        Reserved

                    </span>

                    <%
                    }
                    %>

                </td>

                <td>

                    <a href="/seats/edit/<%= id %>"
                       class="btn edit-btn">

                        <i class="fa-solid fa-pen"></i>

                        Edit

                    </a>

                    <a href="/seats/delete/<%= id %>"
                       class="btn delete-btn">

                        <i class="fa-solid fa-trash"></i>

                        Delete

                    </a>

                </td>

            </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>

</div>

<footer>

    © 2026 Online Movie Ticket Reservation Platform

</footer>

</body>

</html>