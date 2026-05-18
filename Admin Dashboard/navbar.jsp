<%@ page contentType="text/html;charset=UTF-8" %>

<%
String admin =
(String) session.getAttribute(
        "admin");

String user =
(String) session.getAttribute(
        "loggedUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-lg fixed-top">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand fw-bold fs-2"
           href="/">

            🎬 Movie Ticket Platform

        </a>

        <!-- MENU -->

        <div class="d-flex align-items-center flex-wrap">

            <!-- HOME -->

            <a href="/"
               class="btn btn-outline-light rounded-pill px-4 me-2 mb-2">

                Home

            </a>

            <!-- ADMIN LOGIN -->

            <%

                if(admin == null &&
                   user == null) {
            %>

            <a href="/admin-login"
               class="btn btn-warning rounded-pill px-4 me-2 mb-2">

                Admin Login

            </a>

            <%
                }
            %>

            <!-- ADMIN MENUS -->

            <%

                if(admin != null) {
            %>

            <a href="/users"
               class="btn btn-outline-light rounded-pill px-4 me-2 mb-2">

                Users

            </a>

            <a href="/movies"
               class="btn btn-outline-light rounded-pill px-4 me-2 mb-2">

                Movies

            </a>

            <a href="/showtimes"
               class="btn btn-outline-light rounded-pill px-4 me-2 mb-2">

                Showtimes

            </a>

            <a href="/seats"
               class="btn btn-outline-light rounded-pill px-4 me-2 mb-2">

                Seats

            </a>



            <a href="/bookings"
               class="btn btn-outline-light rounded-pill px-4 me-2 mb-2">

                Bookings

            </a>

            <a href="/admin"
               class="btn btn-warning rounded-pill px-4 me-2 mb-2">

                Dashboard

            </a>

            <%
                }
            %>

            <!-- USER MENU -->

            <%

                if(user != null) {
            %>

            <a href="/bookings/my-bookings"
               class="btn btn-info rounded-pill px-4 me-2 mb-2">

                My Bookings

            </a>

            <%
                }
            %>

            <!-- DARK MODE -->

            <button class="btn btn-secondary rounded-pill px-4 me-2 mb-2"
                    onclick="toggleDarkMode()">

                Dark Mode

            </button>

            <!-- LOGOUT -->

            <%

                if(user != null ||
                   admin != null) {
            %>

            <a href="/logout"
               class="btn btn-danger rounded-pill px-4 mb-2">

                Logout

            </a>

            <%
                }
            %>

        </div>

    </div>

</nav>

<!-- SPACE FOR FIXED NAVBAR -->

<div style="height:100px;"></div>

<!-- CUSTOM STYLE -->

<style>

    .navbar{

        background:
        linear-gradient(
        90deg,
        #111827,
        #1f2937);

        padding:15px 0;

        box-shadow:
        0 4px 20px
        rgba(0,0,0,0.4);
    }

    .navbar-brand{

        color:white !important;

        letter-spacing:1px;
    }

    .btn{

        transition:0.3s;
    }

    .btn:hover{

        transform:
        translateY(-2px);

        box-shadow:
        0 5px 15px
        rgba(255,255,255,0.2);
    }

</style>

<!-- DARK MODE SCRIPT -->

<script>

    function toggleDarkMode() {

        document.body.classList.toggle(
            "bg-dark");

        document.body.classList.toggle(
            "text-white");

        // TABLES

        const tables =
            document.querySelectorAll(
                ".table");

        tables.forEach(table => {

            table.classList.toggle(
                "table-dark");
        });

        // CARDS

        const cards =
            document.querySelectorAll(
                ".card");

        cards.forEach(card => {

            card.classList.toggle(
                "bg-dark");

            card.classList.toggle(
                "text-white");
        });

        // HERO SECTION

        const hero =
            document.querySelector(
                ".hero");

        if(hero){

            hero.classList.toggle(
                "dark-hero");
        }
    }

</script>