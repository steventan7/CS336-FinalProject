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
       

        String query = "SELECT u.firstName AS first_name, u.lastName AS last_name, SUM(ft.totalfare) AS total_revenue " +
                "FROM users u " +
                "JOIN ReservationPortfolioHas rph ON u.id = rph.accountId " +
                "JOIN FlightTicketReserve ft ON rph.ticketNumber = ft.ticketNumber " +
                "GROUP BY u.firstName, u.lastName " +
                "ORDER BY total_revenue DESC " +
                "LIMIT 1;";
        
        rs = stmt.executeQuery(query);
        int rowCount = 0;

        while (rs.next()) {
            rowCount++;
        }

        System.out.println("Number of Rows in Result Set: " + rowCount); 
        

        out.print("<h1>Best Customer</h1>");
        out.print("<table border='1'>");
        out.print("<tr>");
        out.print("<th>First Name</th>");
        out.print("<th>Last Name</th>");
        out.print("<th>Total Revenue</th>");
        out.print("</tr>");

        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(rs.getString("first_name"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("last_name"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("total_revenue"));
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