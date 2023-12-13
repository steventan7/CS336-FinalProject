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
<div2>
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
		
			
			String airport = request.getParameter("airportID"); 
			
			
			str = "SELECT * FROM FlightOperatedBy WHERE destination_airport = '"+ airport+ "' OR departure_airport = '"+ airport + "'";
			ResultSet result = stmt.executeQuery(str);
			
			out.print("<h2>All Flights Entering or Leaving " + airport + " </h1>");
			out.print("<table style=\"padding: 20px\" id=\"flightTablee\">");

			//make a row
			
				out.print("<tr>");
				out.print("<td>");
				out.print("destination_airport");
				out.print("</td>");
				out.print("<td>");
				out.print("departure_airport");
				out.print("</td>");
				out.print("<td>");
				out.print("typeDomInt");
				out.print("</td>");
				out.print("<td>");
				out.print("departure_time");
				out.print("</td>");
				out.print("<td>");
				out.print("flight_number");
				out.print("</td>");
				out.print("<td>");
				out.print("airline_id");
				out.print("</td>");
				out.print("<td>");
				out.print("aircraft_id");
				out.print("</td>");
				out.print("<td>");
				out.print("arrival_time");
				out.print("</td>");
				out.print("<td>");
				out.print("price");
				out.print("</td>");
				out.print("<td>");
				out.print("numOfStops");
				out.print("</td>");
				out.print("<td>");
				out.print("flight_duration");
				out.print("</td>");
			

			//parse out the results
			while (result.next()) {
				//make a row
				
					out.print("<tr>");
					out.print("<td>");
					out.print(result.getString("destination_airport"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("departure_airport"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("typeDomInt"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("departure_time"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("flight_number"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("airline_id"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("aircraft_id"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("arrival_time"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("price"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("numOfStops"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("flight_duration"));
					out.print("</td>");
				} 

			
			
			out.print("</table>");
						
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
</div2>
</body>
</html>