<%@ page import="java.util.*" %>
<%@ page import="com.moviebooking.model.Booking" %>

<%
List<Booking> list = (List<Booking>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<title>My Bookings</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#141414;
    color:white;
    font-family:Arial;
}

.container-box{
    width:95%;
    margin:auto;
    margin-top:40px;
    background:#1f1f1f;
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 20px rgba(255,0,0,0.2);
}

h1{
    text-align:center;
    color:#e50914;
    font-weight:bold;
    margin-bottom:30px;
}

table{
    background:white;
    color:black;
}

th{
    background:#e50914 !important;
    color:white;
}

.full-btn{
    width:100%;
    margin-top:15px;
}

</style>

</head>
<body>

<div class="container-box">

<h1>MY BOOKINGS</h1>

<table class="table table-bordered table-hover text-center">

<tr>
<th>ID</th>
<th>Seats</th>
<th>Status</th>
</tr>

<% for(Booking b : list){ %>

<tr>

<td><%= b.getBookingId() %></td>
<td><%= b.getSeats() %></td>

<td>
<% if(b.getStatus().equals("ACTIVE")){ %>
<span class="badge bg-success">ACTIVE</span>
<% } else { %>
<span class="badge bg-danger">CANCELLED</span>
<% } %>
</td>

</tr>

<% } %>

</table>

<a href="/booking" class="btn btn-danger full-btn">
Back to Booking
</a>

</div>

</body>
</html>