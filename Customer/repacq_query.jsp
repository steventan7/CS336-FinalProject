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
<div>
	<%
	
		try {

			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();	
			//out.print("<h1>All Flights Entering or Leaving Airport </h1>");
			
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Chikipu!23");
		   // Statement st = con.createStatement();
		   // ResultSet rs;
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str = "";
			
			
			String questionid = request.getParameter("questionID"); 
			String responsee = request.getParameter("response"); 
			String status = "Closed";
		
		
			String sql = "Update QuestionsToRep " +
	   			    "SET response = ?, " +
	   			    "    status = ? " +
	   			    "WHERE question_id = ?";

	   			PreparedStatement pstmt = con.prepareStatement(sql);
	   			pstmt.setString(1, responsee);
	   			pstmt.setString(2, status);  
	   			pstmt.setString(3, questionid);

	   			int updated = pstmt.executeUpdate();

		
	   		
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			if (updated > 0) {
				out.print("Update succeeded :)");
			} else {
				out.print("Update failed :( Question ID does not exist");
			}

		} catch (Exception e) {
		}
	%>
</div>
</body>
</html>
