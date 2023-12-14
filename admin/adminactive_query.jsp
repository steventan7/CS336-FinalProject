<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Polarbears123!");
        stmt = con.createStatement();

        // Get the parameter for the selected month from the request
       
        String query = "SELECT airline_id, aircraft_id, flight_number, COUNT(*) as numTicketsPerFlight " +
                "FROM flightSpecificInfo " +
                "GROUP BY airline_id, aircraft_id, flight_number " +
                "ORDER BY numTicketsPerFlight DESC;";

        rs = stmt.executeQuery(query);
        /* int rowCount = 0;

        while (rs.next()) {
            rowCount++;
        }

        System.out.println("Number of Rows in Result Set: " + rowCount); */
        

        out.print("<h1>Active Flights </h1>");
        out.print("<table border='1'>");
        out.print("<tr>");
        out.print("<th>Airline ID</th>");
        out.print("<th>Aircraft ID</th>");
        out.print("<th>Flight Number</th>");
        out.print("<th>Number of Tickets Per Flight</th>");
        
        out.print("</tr>");

        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(rs.getString("airline_id"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("aircraft_id"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("flight_number"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("numTicketsPerFlight"));
            out.print("</td>");
            out.print("</tr>");
        }

        out.print("</table>");
        
        con.close();
		} catch (Exception e){
		}
%>
		
</body>
</html>	