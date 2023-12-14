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
        String selectedMonth = request.getParameter("month");
        System.out.println("Selected Month: " + selectedMonth);

        String query = "SELECT DATE_FORMAT(purchasedatetime, '%Y-%m') AS month, " +
                       "COUNT(ticketNumber) AS tickets_sold, " +
                       "SUM(totalfare + bookingfee) AS total_revenue " +
                       "FROM FlightTicketReserve " +
                       "WHERE DATE_FORMAT(purchasedatetime, '%Y-%m') = '" + selectedMonth + "' " +
                       "GROUP BY month " +
                       "ORDER BY month";

        rs = stmt.executeQuery(query);
        /* int rowCount = 0;

        while (rs.next()) {
            rowCount++;
        }

        System.out.println("Number of Rows in Result Set: " + rowCount); */
        

        out.print("<h1>Sales Report </h1>");
        out.print("<table border='1'>");
        out.print("<tr>");
        out.print("<th>Month</th>");
        out.print("<th>Total Revenue</th>");
        out.print("<th>Tickets Sold</th>");
        out.print("</tr>");

        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(rs.getString("month"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("total_revenue"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs.getString("tickets_sold"));
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