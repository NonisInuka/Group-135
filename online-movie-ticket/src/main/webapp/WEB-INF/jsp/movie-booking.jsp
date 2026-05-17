<%@ page import="java.util.List" %>

<%
List<String> seats =
(List<String>) request.getAttribute("seats");

String movieName =
(String) request.getAttribute("movieName");
%>

<html>

<head>

    <title>Movie Seat Booking</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>

        body{
            background:#f4f6f9;
        }

        .screen{
            width:80%;
            height:20px;
            background:red;
            margin:40px auto;
            border-radius:50%;
        }

        .seat-grid{
            display:grid;
            grid-template-columns:repeat(10,80px);
            gap:15px;
            justify-content:center;
            margin-top:50px;
        }

        .seat{
            width:70px;
            height:70px;
            border-radius:12px;
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
            font-weight:bold;
            font-size:18px;
            cursor:pointer;
            transition:0.3s;
        }

        .seat:hover{
            transform:scale(1.1);
        }

        .available{
            background:#198754;
        }

        .reserved{
            background:#dc3545;
            cursor:not-allowed;
        }

        .selected{
            background:#0d6efd !important;
        }

        .legend{
            display:flex;
            justify-content:center;
            gap:40px;
            margin-top:40px;
        }

        .legend-box{
            width:25px;
            height:25px;
            border-radius:5px;
            display:inline-block;
            margin-right:10px;
        }

    </style>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5">

    <h1 class="text-center">

        <%= movieName %>

    </h1>

    <h3 class="text-center mt-3">

        Select Your Seats

    </h3>

    <div class="screen"></div>

    <h4 class="text-center text-secondary">

        SCREEN

    </h4>

    <div class="seat-grid">

        <%

            for(String seat : seats) {

                if(seat.trim().isEmpty()) {
                    continue;
                }

                String[] data =
                        seat.split(",");

                if(data.length < 4) {
                    continue;
                }

                if(!data[2].equals(movieName)) {
                    continue;
                }

                String status =
                        data[3];

        %>

        <div class="seat
             <%= status.equals("Reserved")
             ? "reserved"
             : "available" %>"

             <% if(!status.equals("Reserved")) { %>

             onclick="selectSeat(
             this,
             '<%= data[1] %>')"

             <% } %>>

            <%= data[1] %>

        </div>

        <%
            }
        %>

    </div>

    <div class="legend">

        <div>

            <span class="legend-box"
                  style="background:#198754"></span>

            Available

        </div>

        <div>

            <span class="legend-box"
                  style="background:#dc3545"></span>

            Reserved

        </div>

        <div>

            <span class="legend-box"
                  style="background:#0d6efd"></span>

            Selected

        </div>

    </div>

    <div class="card mt-5 p-4 shadow">

        <div class="row">

            <div class="col-md-6">

                <h4>

                    Selected Seats

                </h4>

                <h3 id="selectedSeat"
                    class="text-danger">

                    None

                </h3>

                <p class="mt-2">

                    Maximum 4 seats allowed

                </p>

            </div>

            <div class="col-md-6 text-end">

                <button class="btn btn-success btn-lg"
                        onclick="confirmBooking()">

                    Continue to Booking

                </button>

            </div>

        </div>

    </div>

</div>

<jsp:include page="footer.jsp"/>

<script>

    let selectedSeats = [];

    function selectSeat(
        element,
        seatNumber) {

        if(element.classList.contains(
            'selected')) {

            element.classList.remove(
                'selected');

            selectedSeats =
                selectedSeats.filter(
                    seat => seat !== seatNumber);

            updateSelectedSeats();

            return;
        }

        if(selectedSeats.length >= 4) {

            alert(
                "You can select maximum 4 seats");

            return;
        }

        element.classList.add(
            'selected');

        selectedSeats.push(
            seatNumber);

        updateSelectedSeats();
    }

    function updateSelectedSeats() {

        if(selectedSeats.length === 0) {

            document.getElementById(
                "selectedSeat").innerText =
                "None";

            return;
        }

        document.getElementById(
            "selectedSeat").innerText =
            selectedSeats.join(", ");
    }

    function confirmBooking() {

        if(selectedSeats.length === 0) {

            alert(
                "Please select at least one seat");

            return;
        }

        alert(
            "Booking Confirmed for Seats: "
            + selectedSeats.join(", "));
    }

</script>

</body>

</html>