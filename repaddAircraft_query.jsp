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
		String aircraftid = request.getParameter("aircraftID");
        String numSeats= request.getParameter("numSeats");
        String monday = request.getParameter("Operates Monday");
		boolean operatesMonday = "true".equals(monday);
		String tuesday = request.getParameter("Operates Tuesday");
		boolean operatesTuesday = "true".equals(tuesday);
		String wednesday = request.getParameter("Operates Wednesday");
	    boolean operatesWednesday = "true".equals(wednesday);
	    String thursday = request.getParameter("Operates Thursday");
	 	boolean operatesThursday = "true".equals(thursday);
	 	String friday = request.getParameter("Operates Friday");
		boolean operatesFriday = "true".equals(friday);
		String saturday = request.getParameter("Operates Saturday");
		boolean operatesSaturday = "true".equals(saturday);
		String sunday = request.getParameter("Operates Sunday");
		boolean operatesSunday = "true".equals(sunday);
		
      
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO Aircraft(aircraft_id, num_of_seats, operates_monday, operates_tuesday, operates_wednesday, operates_thursday, operates_friday, operates_saturday, operates_sunday)"
				+ "VALUES (?, ?, ?,?,?, ?,?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, aircraftid);
		ps.setString(2, numSeats);
		ps.setBoolean(3, operatesMonday);
		ps.setBoolean(4, operatesTuesday);
		ps.setBoolean(5, operatesWednesday);
		ps.setBoolean(6, operatesThursday);
		ps.setBoolean(7, operatesFriday);
		ps.setBoolean(8, operatesSaturday);
		ps.setBoolean(9, operatesSunday);
		
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