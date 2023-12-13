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
		String airlineid = request.getParameter("airlineid");
        String aircraftid= request.getParameter("aircraftid");
        String flight_number= request.getParameter("flight_number");
        String departure_airport= request.getParameter("departure_airport");
        String destination_airport= request.getParameter("destination_airport");
        String domInt = request.getParameter("domint");
        String deptime= request.getParameter("depdatetimeInput");
        String arrtime = request.getParameter("arrdatetimeInput");
        String price = request.getParameter("price");
        String numstops= request.getParameter("numstops");
        String flight_duration= request.getParameter("flight_duration");
        
        
		
      
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO FlightOperatedBy(destination_airport, departure_airport, typeDomInt, departure_time, flight_number, airline_id, aircraft_id, arrival_time, price, numOfStops, flight_duration)"
				+ "VALUES (?, ?, ?,?,?, ?,?,?,?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, destination_airport);
		ps.setString(2, departure_airport);
		ps.setString(3, domInt);
		ps.setString(4, deptime);
		ps.setString(5, flight_number);
		ps.setString(6, airlineid);
		ps.setString(7, aircraftid);
		ps.setString(8, arrtime);
		ps.setString(9, price);
		ps.setString(10, numstops);
		ps.setString(11, flight_duration);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Insert succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>