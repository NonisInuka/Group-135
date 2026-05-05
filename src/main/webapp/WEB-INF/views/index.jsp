<!DOCTYPE html>
<html>
<head>
<title>Movie Booking System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#141414;
    font-family:Arial;
}

.home-box{
    width:500px;
    margin:auto;
    margin-top:100px;
    background:#1f1f1f;
    padding:40px;
    border-radius:18px;
    text-align:center;
    box-shadow:0 0 25px rgba(255,0,0,0.25);
}

h1{
    color:#e50914;
    font-weight:bold;
    margin-bottom:30px;
}

p{
    color:white;
    margin-bottom:25px;
}

.btn-home{
    width:100%;
    margin-top:12px;
    border-radius:10px;
}

</style>

</head>
<body>

<div class="home-box">

<h1>MOVIE BOOKING SYSTEM</h1>

<p>Welcome to Online Ticket Reservation Platform</p>

<a href="/booking" class="btn btn-danger btn-home">
Book Ticket
</a>

<a href="/allBookings" class="btn btn-light btn-home">
All Bookings
</a>

<a href="/history?userId=U001" class="btn btn-info btn-home">
My Bookings
</a>

</div>

</body>
</html>