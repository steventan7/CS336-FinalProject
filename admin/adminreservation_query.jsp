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
    String query;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Polarbears123!");
        stmt = con.createStatement();

        // Get the parameter for the selected month from the request
        String flightNum = request.getParameter("flightNumber");
        String custFirstName = request.getParameter("customerFirstName");
        String custLastName = request.getParameter("customerLastName");
        	
       // System.out.println("Selected Month: " + selectedMonth);
       
       if(!flightNum.isEmpty()){
    	   query = "SELECT R.ticketNumber, R.firstName, R.lastName, R.typeOneRound, FOB.flight_number, FOB.airline_id, FOB.aircraft_id " +
                   "FROM FlightTicketReserve R " +
                   "JOIN flightSpecificInfo FSI ON R.ticketNumber = FSI.ticketNumber " +
                   "JOIN FlightOperatedBy FOB ON FSI.flight_number = FOB.flight_number AND FSI.airline_id = FOB.airline_id AND FSI.aircraft_id = FOB.aircraft_id " +
                   "WHERE FOB.flight_number = '" + flightNum + "'";
    	   rs = stmt.executeQuery(query);
       } else if(!custFirstName.isEmpty()){
    	   query = "SELECT R.ticketNumber, R.firstName, R.lastName, R.typeOneRound, FOB.flight_number, FOB.airline_id, FOB.aircraft_id " +
                   "FROM FlightTicketReserve R " +
                   "JOIN flightSpecificInfo FSI ON R.ticketNumber = FSI.ticketNumber " +
                   "JOIN FlightOperatedBy FOB ON FSI.flight_number = FOB.flight_number AND FSI.airline_id = FOB.airline_id AND FSI.aircraft_id = FOB.aircraft_id " +
                   "WHERE R.firstName = '" + custFirstName + "' AND R.lastName = '" + custLastName + "'";
    	   rs = stmt.executeQuery(query);
       }

      

        //rs = stmt.executeQuery(query);
        /* int rowCount = 0;

        while (rs.next()) {
            rowCount++;
        }

        System.out.println("Number of Rows in Result Set: " + rowCount); 
         */

        out.print("<h1>Reservations</h1>");
        out.print("<table border='1'>");
        out.print("<tr>");
        out.print("<th>Ticket Number</th>");
        out.print("<th>First Name</th>");
        out.print("<th>Last Name</th>");
        out.print("<th>Type</th>");
        out.print("<th>Flight Number</th>");
        out.print("<th>Airline ID</th>");
        out.print("<th>Aircraft ID</th>");
        out.print("</tr>");

        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>" + rs.getString("ticketNumber") + "</td>");
            out.print("<td>" + rs.getString("firstName") + "</td>");
            out.print("<td>" + rs.getString("lastName") + "</td>");
            out.print("<td>" + rs.getString("typeOneRound") + "</td>");
            out.print("<td>" + rs.getString("flight_number") + "</td>");
            out.print("<td>" + rs.getString("airline_id") + "</td>");
            out.print("<td>" + rs.getString("aircraft_id") + "</td>");
            out.print("</tr>");
        }

        out.print("</table>");

        
        con.close();
		} catch (Exception e){
		}
%>
		
</body>
</html>	