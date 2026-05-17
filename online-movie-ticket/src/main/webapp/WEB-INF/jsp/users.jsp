<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>

<html>

<head>

    <title>User Management</title>

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

        /* PAGE TITLE */

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

        /* USER TABLE */

        .user-table{

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
            #1e3a8a);

            color:white;
        }

        .table th{

            padding:22px;

            font-size:20px;
        }

        .table td{

            padding:22px;

            vertical-align:middle;

            font-size:19px;
        }

        .table tbody tr{

            transition:0.3s;
        }

        .table tbody tr:hover{

            background:#f8fafc;
        }

        /* USER AVATAR */

        .avatar{

            width:55px;

            height:55px;

            border-radius:50%;

            display:flex;

            align-items:center;

            justify-content:center;

            color:white;

            font-size:24px;

            font-weight:bold;
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

        .add-btn:hover{

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

                <i class="fa-solid fa-users"></i>

                All Users

            </h1>

            <p class="text-secondary fs-4">

                Manage platform users

            </p>

        </div>

        <input type="text"
               placeholder="Search users..."
               class="search-box">
    </div>

    <!-- TOP CARDS -->

    <div class="row mb-5">

        <div class="col-md-4">

            <div class="top-card d-flex align-items-center">

                <div class="top-icon bg-primary me-4">

                    <i class="fa-solid fa-users"></i>

                </div>

                <div>

                    <h3>Total Users</h3>

                    <h2>

                        <%= ((List<String>)request.getAttribute("users")).size() %>

                    </h2>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="top-card d-flex align-items-center">

                <div class="top-icon bg-success me-4">

                    <i class="fa-solid fa-envelope"></i>

                </div>

                <div>

                    <h3>Emails Added</h3>

                    <h2>100%</h2>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="top-card d-flex align-items-center">

                <div class="top-icon bg-warning me-4">

                    <i class="fa-solid fa-phone"></i>

                </div>

                <div>

                    <h3>Phone Users</h3>

                    <h2>Available</h2>

                </div>

            </div>

        </div>

    </div>

    <!-- ADD USER -->

    <a href="/users/add"
       class="btn add-btn mb-4">

        <i class="fa-solid fa-plus"></i>

        Add User

    </a>

    <!-- USER TABLE -->

    <div class="user-table">

        <table class="table">

            <thead>

            <tr>

                <th>ID</th>

                <th>Name</th>

                <th>Email</th>

                <th>Password</th>

                <th>Phone</th>

                <th>Actions</th>

            </tr>

            </thead>

            <tbody>

            <%

            List<String> users =
            (List<String>) request.getAttribute(
                    "users");

            for(String user : users) {

                String[] data =
                        user.split(",");

                if(data.length < 5) {
                    continue;
                }

                String id = data[0];
                String name = data[1];
                String email = data[2];
                String password = data[3];
                String phone = data[4];

                String firstLetter =
                        name.substring(0,1)
                        .toUpperCase();
            %>

            <tr>

                <td>

                    <%= id %>

                </td>

                <td>

                    <div class="d-flex align-items-center">

                        <div class="avatar bg-primary me-3">

                            <%= firstLetter %>

                        </div>

                        <strong>

                            <%= name %>

                        </strong>

                    </div>

                </td>

                <td>

                    <%= email %>

                </td>

                <td>

                    <span class="badge bg-secondary p-3">

                        <%= password %>

                    </span>

                </td>

                <td>

                    <span class="badge bg-success p-3">

                        <%= phone %>

                    </span>

                </td>

                <td>

                    <a href="/users/edit/<%= id %>"
                       class="btn edit-btn">

                        <i class="fa-solid fa-pen"></i>

                        Edit

                    </a>

                    <a href="/users/delete/<%= id %>"
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