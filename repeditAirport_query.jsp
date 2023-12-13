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

		// Create a SQL statement
		Statement stmt = con.createStatement();
		
		// Get parameters from the HTML form at the HelloWorld.jsp
		String newairportid = request.getParameter("newairportID");
		String oldairportid = request.getParameter("oldairportID");

		// Update the existing record
		String Sql = "UPDATE Airport SET airport_id = ? WHERE airport_id = ? ";
		PreparedStatement updateStmt = con.prepareStatement(Sql);
		updateStmt.setString(1, newairportid);
		updateStmt.setString(2, oldairportid);
		
		
		int updated = updateStmt.executeUpdate();

		// Close the connection
		con.close();
		if (updated > 0) {
			out.print("Update succeeded :)");
		} else {
			out.print("Update failed :( Airport ID does not exist!");
		}

	

	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed :()");
	}
	%>
</body>
</html>
