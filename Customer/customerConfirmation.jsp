<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Your Flight</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">     

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
	<br>
	<div style="text-align:center;">
		<%	
		
		    try {
		        ApplicationDB db = new ApplicationDB();	
		        Connection con = db.getConnection();	
		        Statement stmt = con.createStatement();
		
		        String airlineID = request.getParameter("airline_id");
		        String aircraftID = request.getParameter("aircraft_id");
		        String fname = request.getParameter("fname");
		        String lname = request.getParameter("lname");
		        String bookingFee = request.getParameter("bookingFee");
		        String type = request.getParameter("type");
		        String date1 = request.getParameter("date1");
		        String date2 = request.getParameter("date2");
		        String price = request.getParameter("price");
		        String flightNumber = request.getParameter("flightNumber");
		        String econRate = request.getParameter("econRate");
		        String seatNumber = request.getParameter("seatNumber");
		        String ticketNumber = request.getParameter("ticketNum");
		        String datePurchased = request.getParameter("datePurchased");
				
		        String totalFare = String.valueOf(Integer.parseInt(price) + Integer.parseInt(bookingFee));
		        
		        String str = "select num_of_seats from Aircraft where aircraft_id = " + aircraftID;
		        ResultSet result = stmt.executeQuery(str);
				String capacity = "";
				if (result.next()) {
					capacity = result.getString("num_of_seats");
	            }
				
				if (result != null) {
				    result.close();
				}
				str = "select count(*) as currentBookings from flightSpecificInfo where aircraft_id = " + aircraftID;
				result = stmt.executeQuery(str);
				String currentBooking = "";
				if (result.next()) {
					currentBooking = result.getString("currentBookings");
	            }
				
				
				if (Integer.parseInt(currentBooking) > Integer.parseInt(capacity)) {
					out.print("<h1> The flight you attempted to reserve for is fully booked!</h1>");
					out.print("<h1> You have been added to the waiting list.</h1>");
					int updateWaitingList =  stmt.executeUpdate("insert into HasWaitingList (ticketNumber, firstName, lastName, bookingdate, flight_number, airline_id, aircraft_id)" +
							"VALUES ('" + ticketNumber + "','" + fname + "','" + lname + "' ,'" + datePurchased+ "' ,'" +
									flightNumber + "','" + airlineID + "','" + aircraftID + "')");
					response.sendRedirect("customerReserve.jsp");
				}
				
				
		        float update1 = stmt.executeUpdate("insert into FlightTicketReserve (ticketNumber, purchasedatetime, totalfare, firstName, lastName, " + 
		        	"bookingfee, typeOneRound) values ('" + ticketNumber + "','" + datePurchased + "','" + totalFare + "' ,'" + fname+ "' ,'" +
		        			lname + "','" + bookingFee + "','" + type + "')");
		        
				if (update1 != 1){
					out.print("<h1>An error occured. Please try again.</h1>");
				}
				
				float update2 = stmt.executeUpdate("insert into flightSpecificInfo (ticketNumber, seat_number, flight_number, airline_id, aircraft_id, class)" +
					"values ('" + ticketNumber + "','" + seatNumber + "' ,'" + flightNumber+ "' ,'" + airlineID + "','" + aircraftID + "','" + econRate + "')");
		        
				if (update2 != 1){
					out.print("<h1>An error occurred. Please try again.</h1>");
				}
				
				float update3 = stmt.executeUpdate("insert into ReservationPortfolioHas (accountId, airline_id, aircraft_id, flight_number)"  +
						" VALUES ('" + session.getAttribute("accountid") + "','" + airlineID + "' ,'" + aircraftID+ "' ,'" + flightNumber + "')");
		        
				if (update3 != 1){
					out.print("<h1>An error occurred. Please try again.</h1>");
				} else {
					out.print("<h1>You have successfully reserved a flight!</h1>");
				}
				con.close();
				Thread.sleep(5000);			
				response.sendRedirect("customerReservations.jsp");
		
		    } catch (Exception e) {
		        e.printStackTrace(); 
		        out.println("An error occurred! Please try again!");
		        response.sendRedirect("customerReserve.jsp");
		    } 
		%>
		
	</div>
</body>
</html>