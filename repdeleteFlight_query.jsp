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

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");

        Statement stmt = con.createStatement();

        String airlineid = request.getParameter("deletefairlineid");
        String aircraftid = request.getParameter("deletefaircraftid");
        String flightnumber = request.getParameter("deletefflight_number");
        String delete = "DELETE FROM FlightOperatedBy WHERE airline_id = ? " + "AND aircraft_id = ? " + "AND flight_number = ? ";

        PreparedStatement ps = con.prepareStatement(delete);

        ps.setString(1, airlineid);
        ps.setString(2, aircraftid);
        ps.setString(3, flightnumber);

 
        
        int deletedd = ps.executeUpdate();
       

        con.close();
        

        if (deletedd > 0) {
            out.print("Delete succeeded:)");
        } else {
            out.print("Delete failed :( Aircraft ID, Airline ID, or Flight Number does not exist!");
        }

    } catch (Exception ex) {
        out.print(ex);
        out.print("Delete failed :()");
    }
    %>
</body>
</html>
