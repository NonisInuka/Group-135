<%@ page import="java.util.*" %>
<%@ page import="com.moviebooking.model.Booking" %>

<%
List<Booking> list = (List<Booking>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<title>All Bookings</title>

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
    table-layout:fixed;
    word-wrap:break-word;
}

th, td{
    padding:15px;
    vertical-align:middle;
}

td:first-child{
    width:40%;
}

th{
    background:#e50914 !important;
    color:white;
}

.btn-netflix{
    background:#e50914;
    border:none;
    color:white;
}

.btn-netflix:hover{
    background:#b20710;
}

.full-btn{
    width:100%;
    margin-top:15px;
}

</style>

</head>
<body>

<div class="container-box">

<h1>ALL BOOKINGS</h1>

<table class="table table-bordered table-hover text-center table-striped">

<tr>
<th>ID</th>
<th>User</th>
<th>Seats</th>
<th>Status</th>
<th>Action</th>
</tr>

<% for(Booking b : list){ %>

<tr>

<td><%= b.getBookingId() %></td>
<td><%= b.getUserId() %></td>
<td><%= b.getSeats() %></td>

<td>
<% if(b.getStatus() != null && b.getStatus().trim().equalsIgnoreCase("ACTIVE")) { %>

<span class="badge bg-success">ACTIVE</span>

<% } else { %>

<span class="badge bg-danger">CANCELLED</span>

<% } %>
</td>

<td>
<a href="/cancel?id=<%= b.getBookingId() %>" class="btn btn-sm btn-netflix">
Cancel
</a>
</td>

</tr>

<% } %>

</table>

<a href="/booking" class="btn btn-netflix full-btn">New Booking</a>

<a href="/" class="btn btn-secondary full-btn">Back</a>

</div>

</body>
</html>