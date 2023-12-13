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

		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get parameters from the HTML form at the HelloWorld.jsp
		String aircraftid = request.getParameter("editaircraftID");
        String numSeats= request.getParameter("editnumSeats");
        String monday = request.getParameter("editmonday");
		boolean operatesMonday = "true".equals(monday);
		String tuesday = request.getParameter("edittuesday");
		boolean operatesTuesday = "true".equals(tuesday);
		String wednesday = request.getParameter("editwednesday");
	    boolean operatesWednesday = "true".equals(wednesday);
	    String thursday = request.getParameter("editthursday");
	 	boolean operatesThursday = "true".equals(thursday);
	 	String friday = request.getParameter("editfriday");
		boolean operatesFriday = "true".equals(friday);
		String saturday = request.getParameter("editsaturday");
		boolean operatesSaturday = "true".equals(saturday);
		String sunday = request.getParameter("editsunday");
		boolean operatesSunday = "true".equals(sunday);
	
   		String sql = "UPDATE Aircraft " +
   			    "SET num_of_seats = ?, " +
   			    "    operates_monday = ?, " +
   			    "    operates_tuesday = ?, " +
   			    "    operates_wednesday = ?, " +
   			    "    operates_thursday = ?, "  +
   			    "    operates_friday = ?, " +
   			    "    operates_saturday = ?, " +
   			    "    operates_sunday = ? " +
   			    "WHERE aircraft_id = ?";

   			PreparedStatement pstmt = con.prepareStatement(sql);
   			pstmt.setString(1, numSeats);
   			pstmt.setInt(2, operatesMonday ? 1 : 0);  
   			pstmt.setInt(3, operatesTuesday ? 1 : 0);
   			pstmt.setInt(4, operatesWednesday ? 1 : 0);
   			pstmt.setInt(5, operatesThursday ? 1 : 0);
   			pstmt.setInt(6, operatesFriday ? 1 : 0);
   			pstmt.setInt(7, operatesSaturday ? 1 : 0);
   			pstmt.setInt(8, operatesSunday ? 1 : 0);
   			pstmt.setString(9, aircraftid);

   			int updated = pstmt.executeUpdate();

	
   		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		if (updated > 0) {
			out.print("Update succeeded :)");
		} else {
			out.print("Update failed :( Aircraft ID does not exist!");
		}

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed :()");
	}
%>
</body>
</html>