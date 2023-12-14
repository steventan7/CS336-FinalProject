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
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Polarbears123!");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get parameters from the HTML form at the HelloWorld.jsp
		String username = request.getParameter("username");
        String password= request.getParameter("password");
       
        String usertype = request.getParameter("type");
		
		String changeUser = request.getParameter("changeusername");
		String changePass = request.getParameter("changepassword");
		
	
   		String sql = "UPDATE users " +
   			    "SET username = ?, " +
   			    "    password = ? " +
   			    "WHERE username = ?";

   			PreparedStatement pstmt = con.prepareStatement(sql);
   			pstmt.setString(1, changeUser);
   			pstmt.setString(2, changePass);  
   			pstmt.setString(3, username);
   			
   		
   			int updated = pstmt.executeUpdate();

	
   		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		if (updated > 0) {
			out.print("Update succeeded :)");
		} else {
			out.print("Update failed :( Username does not exist!");
		}

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed :()");
	}
%>
</body>
</html>