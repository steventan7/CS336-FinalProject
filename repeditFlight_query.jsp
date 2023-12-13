<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get parameters from the HTML form at the HelloWorld.jsp
		String airlineid = request.getParameter("editfairlineid");
        String aircraftid= request.getParameter("editfaircraftid");
        String flight_number= request.getParameter("editfflight_number");
        String departure_airport= request.getParameter("editfdeparture_airport");
        String destination_airport= request.getParameter("editfdestination_airport");
        String domInt = request.getParameter("editfdomint");
        String deptime= request.getParameter("editfdepdatetimeInput");
        String arrtime = request.getParameter("editfarrdatetimeInput");
        String price = request.getParameter("editfprice");
        String numstops= request.getParameter("editfnumstops");
        String flight_duration= request.getParameter("editfflight_duration");
	
   		String sql = "UPDATE FlightOperatedBy " +
   			    "SET departure_airport = ?, " +
   			    "    destination_airport = ?, "  +
   			    "    typeDomInt = ?, " +
   			    "    departure_time = ?, " +
   			    "    arrival_time = ?, " +
   			    "    price = ?, " +
   			    "    numOfStops = ?, " +
   			    "    flight_duration = ? " +
   			    "WHERE airline_id = '"+ airlineid + "' AND aircraft_id = '" + aircraftid + "' AND flight_number = " + flight_number ;

   			PreparedStatement pstmt = con.prepareStatement(sql);
   			pstmt.setString(1, departure_airport);
   			pstmt.setString(2, destination_airport);
   			pstmt.setString(3, domInt);
   			pstmt.setString(4, deptime);
   			pstmt.setString(5, arrtime);
   			pstmt.setString(6, price);
   			pstmt.setString(7, numstops);
   			pstmt.setString(8, flight_duration);

   			int updated = pstmt.executeUpdate();

	
   		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		if (updated > 0) {
			out.print("Update succeeded :)");
		} else {
			out.print("Update failed :( Aircraft ID does not exist!");
		}

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed :()");
	}
%>
</body>
</html>

