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
	<%
		try {

			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();	
			
			
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Polarbears123!");
		   // Statement st = con.createStatement();
		   // ResultSet rs;
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String sort = request.getParameter("sort");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "";
			
			String[] selectedValues = request.getParameterValues("filter");
			int n = selectedValues.length;
			

			String filters = "";
			for (int i = 0; i < selectedValues.length; i++) {
				filters += selectedValues[i];
				
				if (i < selectedValues.length - 1) {
					filters += ", ";
				} 
			}
			
			String dateFilter = request.getParameter("date1"); // Adjust "date1" to the actual parameter name in your form

			out.println("Date FilterHERE: " + dateFilter);
			
			/* if (!sort.equals("all")) {
				if(!filters.equals("none")) {
					str = "SELECT " + filters + " FROM FlightOperatedBy ORDER BY " + sort;
				} else {
					str = "SELECT * FROM FlightOperatedBy ORDER BY " + sort;
				}
			} */
			
			if (!sort.equals("all")) {
			    if (!dateFilter.isEmpty()) {
			        /* str = "SELECT * FROM FlightOperatedBy WHERE departure_time = '" + dateFilter + "' ORDER BY " + sort;
			        out.println("SQL Query: " + str); */
			    	//str = "SELECT * FROM FlightOperatedBy WHERE departure_time >= '2023-01-01' AND departure_time < '2023-01-02' ORDER BY " + sort;
			    	 str = "SELECT * FROM FlightOperatedBy WHERE DATE(departure_time) = '" + dateFilter + "' ORDER BY " + sort;
			    } else if (!filters.equals("none")) {
			        str = "SELECT " + filters + " FROM FlightOperatedBy ORDER BY " + sort;
			    } else {
			        str = "SELECT * FROM FlightOperatedBy ORDER BY " + sort;
			    }
			}
			
			if (sort.equals("all") || (n >= 2 && selectedValues[0].equals("none"))) {
				str = "SELECT * FROM FlightOperatedBy";
			}
			
			ResultSet result = stmt.executeQuery(str);
			
			out.print("<h1>Flight 1 </h1>");
			out.print("<table style=\"padding: 20px\" id=\"flightTable\">");

			//make a row
			if (filters.equals("none")) {
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
				out.print("arrival_time");
				out.print("</td>");
				out.print("<td>");
				out.print("price");
				out.print("</td>");
				out.print("<td>");
				out.print("typeDomInt");
				out.print("</td>");
				out.print("<td>");
				out.print("numOfStops");
				out.print("</td>");
			} else {
				out.print("<tr>");
				for (int i = 0; i < selectedValues.length; i++) {
					out.print("<td>");
					out.print(selectedValues[i]);
					out.print("</td>");
				}
			}
			

			//parse out the results
			while (result.next()) {
				//make a row
				if (filters.equals("none")) {
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
					out.print(result.getString("arrival_time"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("price"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("typeDomInt"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("numOfStops"));
					out.print("</td>");
				} else {
					out.print("<tr>");
					for (int i = 0; i < selectedValues.length; i++) {
						out.print("<td>");
						out.print(result.getString(selectedValues[i]));
						out.print("</td>");
					}
				}
			}
			out.print("</table>");
						
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>
