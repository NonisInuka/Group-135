<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>

<%
String movieName =
(String) request.getAttribute(
        "movieName");

List<String> reservedSeats =
(List<String>) request.getAttribute(
        "reservedSeats");

String loggedUser =
(String) session.getAttribute(
        "loggedUser");

String showtime =
(String) request.getAttribute(
        "showtime");

if(showtime == null) {

    showtime = "7PM";
}
%>

<html>

<head>

    <title>Seat Layout</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .screen{

            width:70%;
            height:20px;

            background:#dc3545;

            margin:40px auto;

            border-radius:50%;
        }

        .seat-grid{

            display:grid;

            grid-template-columns:
            repeat(10,90px);

            gap:20px;

            justify-content:center;

            margin-top:50px;
        }

        .seat{

            width:90px;
            height:90px;

            border-radius:15px;

            display:flex;

            justify-content:center;

            align-items:center;

            color:white;

            font-size:18px;

            font-weight:bold;

            cursor:pointer;

            transition:0.3s;
        }

        .seat:hover{

            transform:scale(1.05);
        }

        .available{

            background:#198754;
        }

        .reserved{

            background:#dc3545;

            cursor:not-allowed;
        }

        .selected{

            background:#0d6efd;
        }

        .legend{

            display:flex;

            justify-content:center;

            gap:50px;

            margin-top:50px;
        }

        .legend-box{

            width:35px;

            height:35px;

            border-radius:8px;
        }

        .booking-box{

            background:white;

            padding:30px;

            border-radius:15px;

            margin-top:60px;

            box-shadow:
            0 0 10px
            rgba(0,0,0,0.1);
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container">

    <h1 class="text-center mt-5">

        <%= movieName %>

    </h1>

    <h3 class="text-center text-primary">

        Showtime :
        <%= showtime %>

    </h3>

    <h2 class="text-center mb-5">

        Select Your Seat

    </h2>

    <div class="screen"></div>

    <h1 class="text-center text-secondary">

        SCREEN

    </h1>

    <div class="seat-grid">

        <%

            char row = 'A';

            for(int i = 1; i <= 60; i++) {

                String seatNo =
                        row + "" +
                        ((i - 1) % 10 + 1);

                String status =
                        "available";

                if(reservedSeats != null &&
                   reservedSeats.contains(
                           seatNo)) {

                    status =
                            "reserved";
                }

                if(i % 10 == 0) {

                    row++;
                }
        %>

        <div class="seat <%= status %>"
             data-seat="<%= seatNo %>">

            <%= seatNo %>

        </div>

        <%
            }
        %>

    </div>

    <!-- LEGEND -->

    <div class="legend">

        <div class="d-flex
                    align-items-center
                    gap-3">

            <div class="legend-box available"></div>

            <h3>

                Available

            </h3>

        </div>

        <div class="d-flex
                    align-items-center
                    gap-3">

            <div class="legend-box reserved"></div>

            <h3>

                Reserved

            </h3>

        </div>

        <div class="d-flex
                    align-items-center
                    gap-3">

            <div class="legend-box selected"></div>

            <h3>

                Selected

            </h3>

        </div>

    </div>

    <!-- BOOKING BOX -->

    <div class="booking-box
                d-flex
                justify-content-between
                align-items-center">

        <div>

            <h1>

                Selected Seats

            </h1>

            <h1 id="selectedSeats"
                class="text-danger">

                None

            </h1>

            <h4>

                Maximum 4 seats allowed

            </h4>

        </div>

        <button class="btn btn-success btn-lg"
                onclick="confirmBooking()">

            Continue to Booking

        </button>

    </div>

</div>

<jsp:include page="footer.jsp"/>

<script>

    let selectedSeats = [];

    const seatButtons =
        document.querySelectorAll(
            ".seat");

    const selectedText =
        document.getElementById(
            "selectedSeats");

    seatButtons.forEach(seat => {

        if(seat.classList.contains(
                "reserved")) {

            return;
        }

        seat.addEventListener(
            "click",

            function () {

                const seatNo =
                    this.dataset.seat;

                // REMOVE SEAT

                if(selectedSeats.includes(
                        seatNo)) {

                    selectedSeats =
                        selectedSeats.filter(
                            s => s !== seatNo);

                    this.classList.remove(
                        "selected");

                    this.classList.add(
                        "available");
                }

                // ADD SEAT

                else {

                    if(selectedSeats.length >= 4) {

                        alert(
                            "Maximum 4 seats allowed");

                        return;
                    }

                    selectedSeats.push(
                        seatNo);

                    this.classList.remove(
                        "available");

                    this.classList.add(
                        "selected");
                }

                // UPDATE TEXT

                if(selectedSeats.length === 0) {

                    selectedText.innerText =
                        "None";

                } else {

                    selectedText.innerText =
                        selectedSeats.join(", ");
                }
            });
    });

    // CONFIRM BOOKING

    function confirmBooking() {

        if(selectedSeats.length === 0) {

            alert(
                "Please select seats");

            return;
        }

        // LOGIN CHECK

        const loggedUser =
            "<%= loggedUser %>";

        if(loggedUser == "null") {

            alert(
                "Please login first!");

            window.location.href =
                "/login";

            return;
        }

        // BOOKING DETAILS

        const movie =
            "<%= movieName %>";

        const seats =
            selectedSeats.join(",");

        const showtime =
            "<%= showtime %>";

        // REDIRECT PAYMENT

        const bookingUrl =

            "/bookings/save-booking" +

            "?movie=" + movie +

            "&seats=" + seats +

            "&showtime=" + showtime;

        window.location.href =
            bookingUrl;
    }

</script>

</body>

</html>