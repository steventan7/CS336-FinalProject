<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	<%
	
		try {

			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();	
			//out.print("<h1>All Flights Entering or Leaving Airport </h1>");
			
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");
		   // Statement st = con.createStatement();
		   // ResultSet rs;
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str = "";
		
			
			String airline = request.getParameter("airlineID"); 
			String aircraft = request.getParameter("Aircraft ID"); 
			String flightnum = request.getParameter("flightNumber"); 
			
	
			
			str = "SELECT * FROM HasWaitingList WHERE airline_id = '"+ airline+ "' AND aircraft_id = '"+ aircraft+ "' AND flight_number = '"+flightnum+ "'";
			ResultSet result = stmt.executeQuery(str);
			
			out.print("<h2>Flight Waiting List</h1>");
			out.print("<table style=\"padding: 20px\" id=\"flightTable\">");

			//make a row
			
				out.print("<tr>");
				out.print("<td>");
				out.print("airline_id");
				out.print("</td>");
				out.print("<td>");
				out.print("aircraft_id");
				out.print("</td>");
				out.print("<td>");
				out.print("flight_number");
				out.print("</td>");
				out.print("<td>");
				out.print("ticketNumber");
				out.print("</td>");
				out.print("<td>");
				out.print("firstName");
				out.print("</td>");
				out.print("<td>");
				out.print("lastName");
				out.print("</td>");
				out.print("<td>");
				out.print("bookingdate");
				out.print("</td>");
			

			//parse out the results
			while (result.next()) {
				//make a row
				
					out.print("<tr>");
					out.print("<td>");
					out.print(result.getString("airline_id"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("aircraft_id"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("flight_number"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("ticketNumber"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("firstName"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("lastName"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("bookingdate"));
					out.print("</td>");
				} 

			
			
			out.print("</table>");
						
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
</div>
</body>
</html>