<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask for Help</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="padding:20px;">
    <a class="navbar-brand" >Website</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="customerHome.jsp"> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerReservations.jsp"> Your Flights</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerReserve.jsp"> Make Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerHelp.jsp">Ask for Help</a>
            </li>
        </ul>
    </div>
</nav>

<div style="border-radius: 5px; background-color: #f2f2f2; padding: 50px;">
	<%
	try {
		ApplicationDB db = new ApplicationDB();	
        Connection con = db.getConnection();	
        Statement stmt = con.createStatement();
        String question = request.getParameter("question");
		
        float update1 = stmt.executeUpdate("INSERT INTO QuestionsToRep (customer_id, question) VALUES ('" + session.getAttribute("accountid") + "','" + question + "')");
		
	} catch (Exception e) {
        e.printStackTrace(); 
        out.println(e);
        out.println("An error occurred! Please try again!");
    } 
	%>
</div>
</body>
</html>