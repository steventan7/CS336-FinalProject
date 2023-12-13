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
		                <a class="nav-link" href="repHome.jsp">Home <span class="sr-only">(current)</span></a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="repReservation.jsp">Make Reservation</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="repEditReserve.jsp">Edit Reservation</a>
		            </li>
		              <li class="nav-item">
		                <a class="nav-link" href="repEditInfo.jsp">Edit Information</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="repStatsReserve.jsp">Statistics</a>
		            </li>
		        </ul>
		        <form class="form-inline my-2 my-lg-0">
		            <input class="form-control mr-sm-2" type="text" placeholder="Search.." name="search">
		        </form>
		    </div>
	</nav>          
	<br>
	<div style="text-align:center;">
		<h3>Please review and confirm your reservation for the following flight:</h3>
		<%
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");	
			String str = "";
			Statement stmt = con.createStatement();
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String econRate = request.getParameter("reserveecon_rate");
			String bookingFee = "10";
			if (econRate.equals("Business")) {
				bookingFee = "20";
			} else if (econRate.equals("Economy")) {
				bookingFee = "25";
			}
			String seatNumber = request.getParameter("seatnumber");
			String type = request.getParameter("type") + "";
			String date1 = request.getParameter("reservedate1");
			String date2 = request.getParameter("reservedate2");
			String airlineID = request.getParameter("reserveairlineID");
			String aircraftID = request.getParameter("reserveaircraftID");
			String price = request.getParameter("reserveprice");
			String flightNumber = request.getParameter("reserveflightnumber");
			
			out.print("<p><b>First name: </b>" + fname + "<p>");
			out.print("<p><b>Last name: </b>" + lname + "<p>");
			out.print("<p><b>Flight type: </b>" + type + "<p>");
			out.print("<p><b>Date of flight: </b>"  + date1 + "<p>");
			if (date2 != null){
				out.print("<p><b>Date of flight 2: </b>"  + date2 + "<p>");
			}
			out.print("<p><b>Booking fee: </b> $"  + bookingFee + "<p>");
			out.print("<p><b>Seat number: </b>" + seatNumber + " <p>");
			out.print("<p><b>Airline ID: </b>" + airlineID + "<p>");
			out.print("<p><b>Aircraft ID: </b>" + aircraftID + "<p>");
			out.print("<p><b>Total fare: </b>" + price + "<p>");
			out.print("<p><b>Flight Number: </b>" + flightNumber + "<p>");
			out.print("<p><b>Econ Rate: </b>" + econRate + "<p>");
			
			str = "select count(*) as count from FlightTicketReserve";
			ResultSet result = stmt.executeQuery(str);
			int num = 0;
			if (result.next()) {
				num = result.getInt("count") + 1;
            }
			String ticketNum = String.valueOf(num);
			out.print("<p><b>Ticket Number: </b>" + ticketNum + "</p>");
			
			if (result != null) {
			    result.close();
			}
			
			str = "SELECT CURRENT_TIMESTAMP AS CurrentDateTime";
			result = stmt.executeQuery(str);
			String datePurchased = "";
			if (result.next()) {
				datePurchased = result.getString("CurrentDateTime");
            }
			out.print("<p><b>Date of Purchase: </b>" + datePurchased + "</p>");
			
			if (result != null) {
			    result.close();
			}
			
			//close the connection.
			con.close();

		
		%> 
		<form action="repConfirmation.jsp">
	    	<input type="submit" name="confirm" value="Confirm Reservation">
			<input type="hidden" name=airline_id value="<%=airlineID%>">
			<input type="hidden" name=aircraft_id value="<%=aircraftID%>">
			<input type="hidden" name=fname value="<%=fname%>">
			<input type="hidden" name=lname value="<%=lname%>">
			<input type="hidden" name=bookingFee value="<%=bookingFee%>">
			<input type="hidden" name=type value="<%=type%>">
			<input type="hidden" name=date1 value="<%=date1%>">
			<input type="hidden" name=date2 value="<%=date2%>">
			<input type="hidden" name=price value="<%=price%>">
			<input type="hidden" name=flightNumber value="<%=flightNumber%>">
			<input type="hidden" name=econRate value="<%=econRate%>">
			<input type="hidden" name=seatNumber value="<%=seatNumber%>">
			<input type="hidden" name=ticketNum value="<%=ticketNum%>">
			<input type="hidden" name=datePurchased value="<%=datePurchased%>">
    	</form>
	</div>
</body>
</html>