<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights Reserved</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
	.content-container {
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        #flightTable {
            width: 100%;
            border-collapse: collapse;
        }

        #flightTable td, #flightTable th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
</style>        
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="padding:20px;">
		    <a class="navbar-brand">Website</a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
		        <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		        <ul class="navbar-nav mr-auto">
		            <li class="nav-item active">
		                <a class="nav-link" href="customerHome.jsp">Home <span class="sr-only">(current)</span></a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="customerReservations.jsp">Your Flights</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="customerReserve.jsp">Make Reservation</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="customerHelp.jsp">Ask for Help</a>
		            </li>
		        </ul>
		        <form class="form-inline my-2 my-lg-0">
		            <input class="form-control mr-sm-2" type="text" placeholder="Search.." name="search">
		        </form>
		    </div>
		    <button id="logout-button" disabled>
			  Logout
			</button>
	</nav>
	<div class="content-container">
	<br>
	<h3> You have the following flights reserved: </h3>
	
	<br>
	<%	

    try {
        ApplicationDB db = new ApplicationDB();	
        Connection con = db.getConnection();	
        Statement stmt = con.createStatement();


        String str1 = "select distinct h.accountId, s.ticketNumber, s.seat_number, s.flight_number, s.airline_id, s.aircraft_id, s.class, r.purchasedatetime, r.totalfare, r.firstName, r.lastName, r.bookingfee, r.typeOneRound " +
        		"FROM flightSpecificInfo s INNER JOIN flightticketreserve r ON s.ticketNumber = r.ticketNumber " +
        		"INNER JOIN ReservationPortfolioHas h ON h.airline_id = s.airline_id where h.accountId = " + session.getAttribute("accountid");
        
        ResultSet result = stmt.executeQuery(str1);
        
     
        // Printing the combined table
        out.print("<table style=\"padding: 20px\" id=\"flightTable\">");

        // Table headers for ReservationPortfolioHas
        out.print("<tr>");
        out.print("<th>accountId</th>");
        out.print("<th>ticketNumber</th>");
        out.print("<th>seat_number</th>");
        out.print("<th>flight_number</th>");
        out.print("<th>airline_id</th>");
        out.print("<th>aircraft_id</th>");
        out.print("<th>class</th>");
        out.print("<th>purchasedatetime</th>");
        out.print("<th>totalfare</th>");
        out.print("<th>firstName</th>");
        out.print("<th>lastName</th>");
        out.print("<th>bookingfee</th>");
        out.print("<th>typeOneRound</th>");
        out.print("</tr>");

        // Table data for ReservationPortfolioHas
        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getString("accountId") + "</td>");
            out.print("<td>" + result.getString("ticketNumber") + "</td>");
            out.print("<td>" + result.getString("seat_number") + "</td>");
            out.print("<td>" + result.getString("flight_number") + "</td>");
            out.print("<td>" + result.getString("airline_id") + "</td>");
            out.print("<td>" + result.getString("aircraft_id") + "</td>");
            out.print("<td>" + result.getString("class") + "</td>");
            out.print("<td>" + result.getString("purchasedatetime") + "</td>");
            out.print("<td>" + result.getString("totalfare") + "</td>");
            out.print("<td>" + result.getString("firstName") + "</td>");
            out.print("<td>" + result.getString("lastName") + "</td>");
            out.print("<td>" + result.getString("bookingfee") + "</td>");
            out.print("<td>" + result.getString("typeOneRound") + "</td>");
            out.print("</tr>");
        }

        out.print("</table>");

        // Close the connections
        if (result != null) {
            result.close();
        }

		
        con.close();

    } catch (Exception e) {
        e.printStackTrace(); // Print the exception for debugging purposes
    }
	%>
	<br>
	<br>
	<br>
	<h3>Cancel a reserved flight: </h3>
	
	<form action="customerCancelation.jsp">
		<input type="text" name="ticketNumber" placeholder="Ticket Number" required>
		<input type="text" name="seat_number" placeholder="Seat Number" required>
		<input type="text" name="flight_number" placeholder="Flight Number" required>
		<input type="text" name="airline_id" placeholder="Airline ID" required>
		<input type="text" name="aircraft_id" placeholder="Aircraft ID" required>
		<input type="text" name="class" placeholder="Flight Class" required>
		<input type="submit" value="Confirm Cancellation">
	</form>
	</div>
</body>
</html>