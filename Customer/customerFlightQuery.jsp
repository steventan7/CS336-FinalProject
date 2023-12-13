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
			
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "yashas");

			Statement stmt = con.createStatement();
			String sort = request.getParameter("sort");
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
			
			String dateFilter = request.getParameter("date1"); 
			String date2 = request.getParameter("date2"); 
			String departure_airport = request.getParameter("departure_airport");
			String destination_airport = request.getParameter("destination_airport");
			String flexibleValue = request.getParameter("flexible");
			boolean isFlexible = "true".equals(flexibleValue);
			
			if(isFlexible){
				if (dateFilter.isEmpty()&& departure_airport.isEmpty() && destination_airport.isEmpty()){
					if (!sort.equals("all")) {
					 	if (!filters.equals("none")) {
					        str = "SELECT " + filters + " FROM FlightOperatedBy ORDER BY " + sort;
					 	}
					    else{
					    	str = "SELECT * FROM FlightOperatedBy ORDER BY " + sort;
					    }
					}
					else{
						if (!filters.equals("none")) {
					        str = "SELECT " + filters + " FROM FlightOperatedBy";
					 	}
					    else{
					    	 str = "SELECT * FROM FlightOperatedBy";
					    }
					}
				}
				else{
					if (!sort.equals("all")) {
					 	if (!filters.equals("none")) {
					 		str = "SELECT " + filters + " FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + dateFilter + "',INTERVAL 3 DAY) AND DATE_ADD('" + dateFilter+ "',INTERVAL 3 DAY)) AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "' ORDER BY " + sort;
					 	}
					    else{
					    	str = "SELECT * FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + dateFilter + "',INTERVAL 3 DAY) AND DATE_ADD('" + dateFilter+ "',INTERVAL 3 DAY)) AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "' ORDER BY " + sort;
					    }
					}
					else{
						if (!filters.equals("none")) {
							str = "SELECT " + filters + " FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + dateFilter + "',INTERVAL 3 DAY) AND DATE_ADD('" + dateFilter+ "',INTERVAL 3 DAY)) AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "'";
					 	}
					    else{
					    	str = "SELECT * FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + dateFilter + "',INTERVAL 3 DAY) AND DATE_ADD('" + dateFilter+ "',INTERVAL 3 DAY)) AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "'";
					    }
					}
					
				}
				
			}
			else{

			
			if (dateFilter.isEmpty()&& departure_airport.isEmpty() && destination_airport.isEmpty()){
				if (!sort.equals("all")) {
				 	if (!filters.equals("none")) {
				        str = "SELECT " + filters + " FROM FlightOperatedBy ORDER BY " + sort;
				 	}
				    else{
				    	str = "SELECT * FROM FlightOperatedBy ORDER BY " + sort;
				    }
				}
				else{
					if (!filters.equals("none")) {
				        str = "SELECT " + filters + " FROM FlightOperatedBy";
				 	}
				    else{
				    	 str = "SELECT * FROM FlightOperatedBy";
				    }
				}
			}
			else{
				if (!sort.equals("all")) {
				 	if (!filters.equals("none")) {
				 		str = "SELECT " + filters + " FROM FlightOperatedBy WHERE DATE(departure_time) = '" + dateFilter + "' AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "' ORDER BY " + sort;
				 	}
				    else{
				    	str = "SELECT * FROM FlightOperatedBy WHERE DATE(departure_time) = '" + dateFilter + "' AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "' ORDER BY " + sort;
				    }
				}
				else{
					if (!filters.equals("none")) {
						str = "SELECT " + filters + " FROM FlightOperatedBy WHERE DATE(departure_time) = '" + dateFilter + "' AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "'";
				 	}
				    else{
				    	str = "SELECT * FROM FlightOperatedBy WHERE DATE(departure_time) = '" + dateFilter + "' AND departure_airport = '" + departure_airport + "' AND destination_airport = '" + destination_airport + "'";
				    }
				}
				
			}
			}

			ResultSet result = stmt.executeQuery(str);
			
			out.print("<h1>Flight 1 </h1>");
			out.print("<table style=\"padding: 20px\" id=\"flightTable\">");

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
				out.print("aircraft_id");
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
				out.print("<td>");
				out.print("flight_duration");
				out.print("</td>");
			} else {
				out.print("<tr>");
				for (int i = 0; i < selectedValues.length; i++) {
					out.print("<td>");
					out.print(selectedValues[i]);
					out.print("</td>");
				}
			}
			

			while (result.next()) {
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
					out.print(result.getString("aircraft_id"));
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
					out.print("<td>");
					out.print(result.getString("flight_duration"));
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
						
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>