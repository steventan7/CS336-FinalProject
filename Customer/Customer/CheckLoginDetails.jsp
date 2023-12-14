<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title> 

</head>
<body>
<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs;

    rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
    
    if (rs.next()) {
        String userTypeFromDB = rs.getString("type"); // retrieve user type from the database
		String accountid = rs.getString("id");
        session.setAttribute("user", userid); 
        session.setAttribute("accountid", accountid);
        if ("customer".equals(userTypeFromDB)) {
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("customerHome.jsp");
        } else if ("representative".equals(userTypeFromDB)) {
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("representativeUI.jsp");
        } else if ("admin".equals(userTypeFromDB)) {
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("adminUI.jsp");
        } else {
            // Handle unknown user types
            out.println("Unknown user type");
        }

        out.println("<a href='logout.jsp'>Log out</a>");
        //response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
</body>
</html>