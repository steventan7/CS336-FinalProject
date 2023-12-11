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
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");
		   // Statement st = con.createStatement();
		   // ResultSet rs;
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			//Get the combobox from the index.jsp
			String sort = request.getParameter("sort");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "";
			String str2 = "";
			
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
			//var oneWayRadio = document.getElementById("one-way");
			String flexibleValue = request.getParameter("flexible");
			boolean isFlexible = "true".equals(flexibleValue);
			String roundtripp = request.getParameter("type");
			boolean isroundtrip = "true".equals(roundtripp);
			
			
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

			//out.println("Date FilterHERE: " + isFlexible);
		
			
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
			
			//flight 2
			if(isFlexible){
				if (dateFilter.isEmpty()&& departure_airport.isEmpty() && destination_airport.isEmpty()){
					if (!sort.equals("all")) {
					 	if (!filters.equals("none")) {
					        str2 = "SELECT " + filters + " FROM FlightOperatedBy ORDER BY " + sort;
					 	}
					    else{
					    	str2 = "SELECT * FROM FlightOperatedBy ORDER BY " + sort;
					    }
					}
					else{
						if (!filters.equals("none")) {
					        str2 = "SELECT " + filters + " FROM FlightOperatedBy";
					 	}
					    else{
					    	 str2 = "SELECT * FROM FlightOperatedBy";
					    }
					}
				}
				else{
					if (!sort.equals("all")) {
					 	if (!filters.equals("none")) {
					 		str2 = "SELECT " + filters + " FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + date2 + "',INTERVAL 3 DAY) AND DATE_ADD('" + date2 + "',INTERVAL 3 DAY)) AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "' ORDER BY " + sort;
					 	}
					    else{
					    	str2 = "SELECT * FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + date2 + "',INTERVAL 3 DAY) AND DATE_ADD('" + date2 + "',INTERVAL 3 DAY)) AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "' ORDER BY " + sort;
					    }
					}
					else{
						if (!filters.equals("none")) {
							str2 = "SELECT " + filters + " FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + date2 + "',INTERVAL 3 DAY) AND DATE_ADD('" + date2+ "',INTERVAL 3 DAY)) AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "'";
					 	}
					    else{
					    	str2 = "SELECT * FROM FlightOperatedBy WHERE (DATE(departure_time) BETWEEN DATE_SUB('" + date2 + "',INTERVAL 3 DAY) AND DATE_ADD('" + date2+ "',INTERVAL 3 DAY)) AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "'";
					    }
					}
					
				}
				
			}
			else{

			//out.println("Date FilterHERE: " + isFlexible);
		
			
			if (dateFilter.isEmpty()&& departure_airport.isEmpty() && destination_airport.isEmpty()){
				if (!sort.equals("all")) {
				 	if (!filters.equals("none")) {
				        str2 = "SELECT " + filters + " FROM FlightOperatedBy ORDER BY " + sort;
				 	}
				    else{
				    	str2 = "SELECT * FROM FlightOperatedBy ORDER BY " + sort;
				    }
				}
				else{
					if (!filters.equals("none")) {
				        str2 = "SELECT " + filters + " FROM FlightOperatedBy";
				 	}
				    else{
				    	 str2 = "SELECT * FROM FlightOperatedBy";
				    }
				}
			}
			else{
				if (!sort.equals("all")) {
				 	if (!filters.equals("none")) {
				 		str2 = "SELECT " + filters + " FROM FlightOperatedBy WHERE DATE(departure_time) = '" + date2 + "' AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "' ORDER BY " + sort;
				 	}
				    else{
				    	str2 = "SELECT * FROM FlightOperatedBy WHERE DATE(departure_time) = '" + date2 + "' AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "' ORDER BY " + sort;
				    }
				}
				else{
					if (!filters.equals("none")) {
						str2 = "SELECT " + filters + " FROM FlightOperatedBy WHERE DATE(departure_time) = '" + date2 + "' AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "'";
				 	}
				    else{
				    	str2 = "SELECT * FROM FlightOperatedBy WHERE DATE(departure_time) = '" + date2 + "' AND departure_airport = '" + destination_airport + "' AND destination_airport = '" + departure_airport + "'";
				    }
				}
				
			}
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
			
			if(isroundtrip){
			
			ResultSet result2 = stmt2.executeQuery(str2);
			
			out.print("<h1>Flight 2 </h1>");
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
			

			//parse out the results
			while (result2.next()) {
				//make a row
				if (filters.equals("none")) {
					out.print("<tr>");
					out.print("<td>");
					out.print(result2.getString("destination_airport"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("departure_airport"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("typeDomInt"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("departure_time"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("flight_number"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("airline_id"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("aircraft_id"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("arrival_time"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("price"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("typeDomInt"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("numOfStops"));
					out.print("</td>");
					out.print("<td>");
					out.print(result2.getString("flight_duration"));
					out.print("</td>");
				} else {
					out.print("<tr>");
					for (int i = 0; i < selectedValues.length; i++) {
						out.print("<td>");
						out.print(result2.getString(selectedValues[i]));
						out.print("</td>");
					}
				}

			}
			out.print("</table>");
			
			}
			
			
			
						
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>
