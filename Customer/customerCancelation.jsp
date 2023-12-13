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
	
	<div style="text-align:center;">
		<%	
		
		    try {
		        ApplicationDB db = new ApplicationDB();	
		        Connection con = db.getConnection();	
		        Statement stmt = con.createStatement();
		
		        String ticketNumber = request.getParameter("ticketNumber");
		        String seat_number = request.getParameter("seat_number");
		        String flight_number = request.getParameter("flight_number");
		        String airline_id = request.getParameter("airline_id");
		        String aircraft_id = request.getParameter("aircraft_id");
		        String econClass = request.getParameter("class");
					
		        String s = "delete from flightSpecificInfo where ticketNumber = " + ticketNumber +  " and seat_number = " +
						seat_number + " and flight_number = " + flight_number + " and airline_id = '" + airline_id + "' and aircraft_id = " + aircraft_id + " and class = '" + econClass + "'";
		        int delete1 = stmt.executeUpdate(s);
				
				int delete2 = stmt.executeUpdate("delete from flightticketreserve where ticketNumber = " + ticketNumber);
				int delete3 = stmt.executeUpdate("delete from ReservationPortfolioHas where accountId = " + session.getAttribute("accountid") + ticketNumber + " and flight_number = " + flight_number + " and airline_id = '" + airline_id + "' and aircraft_id = " + aircraft_id);		

		    } catch (Exception e) {
		        e.printStackTrace(); 
		        out.println(e);
		        out.println("An error occurred! Please try again!");
		        // response.sendRedirect("your_destination_page.jsp");
		    } 
		%>
		
	</div>
</body>
</html>