<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights Reserved</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
	.content-container {
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        #flightTable {
            width: 100%;
            border-collapse: collapse;
        }

        #flightTable td, #flightTable th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
</style>        
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="padding:20px;">
		    <a class="navbar-brand">Website</a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
		        <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		        <ul class="navbar-nav mr-auto">
		            <li class="nav-item active">
		                <a class="nav-link" href="customerHome.jsp">Home <span class="sr-only">(current)</span></a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="customerReservations.jsp">Your Flights</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="customerReserve.jsp">Make Reservation</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="customerHelp.jsp">Ask for Help</a>
		            </li>
		        </ul>
		        <form class="form-inline my-2 my-lg-0">
		            <input class="form-control mr-sm-2" type="text" placeholder="Search.." name="search">
		        </form>
		    </div>
		    <button id="logout-button" disabled>
			  Logout
			</button>
	</nav>
	<div class="content-container">
	<br>
	<h3> You have the following flights reserved: </h3>
	
	<br>
	<%	
    int accountId = 10001;
    List<String> list = new ArrayList<String>();

    try {
        ApplicationDB db = new ApplicationDB();	
        Connection con = db.getConnection();	
        Statement stmt = con.createStatement();

        // Query for ReservationPortfolioHas table
        String str1 = "SELECT * FROM ReservationPortfolioHas WHERE accountId = 10001";
        ResultSet result = stmt.executeQuery(str1);

        // Query for FlightOperatedBy table
        String str2 = "SELECT * FROM FlightOperatedBy";

        // Printing the combined table
        out.print("<table style=\"padding: 20px\" id=\"flightTable\">");

        // Table headers for ReservationPortfolioHas
        out.print("<tr>");
        out.print("<th>accountId</th>");
        out.print("<th>airline_id</th>");
        out.print("<th>aircraft_id</th>");
        out.print("<th>flight_number</th>");
        out.print("</tr>");

        // Table data for ReservationPortfolioHas
        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getString("accountId") + "</td>");
            out.print("<td>" + result.getString("airline_id") + "</td>");
            out.print("<td>" + result.getString("aircraft_id") + "</td>");
            out.print("<td>" + result.getString("flight_number") + "</td>");
            out.print("</tr>");
        }

        // Table headers for FlightOperatedBy
        out.print("<tr>");
        out.print("<th>destination_airport</th>");
        out.print("<th>departure_airport</th>");
        out.print("<th>typeDomInt</th>");
        out.print("<th>departure_time</th>");
        out.print("<th>arrival_time</th>");
        out.print("<th>price</th>");
        out.print("<th>typeDomInt</th>");
        out.print("<th>numOfStops</th>");

        // New column added
        out.print("<th>New_Column</th>");

        out.print("</tr>");
        
        if (result != null) {
		    result.close();
		}
        
        result = stmt.executeQuery(str2);
        // Table data for FlightOperatedBy
        while (result.next()) {
            out.print("<tr>");
            out.print("<td>" + result.getString("destination_airport") + "</td>");
            out.print("<td>" + result.getString("departure_airport") + "</td>");
            out.print("<td>" + result.getString("typeDomInt") + "</td>");
            out.print("<td>" + result.getString("departure_time") + "</td>");
            out.print("<td>" + result.getString("arrival_time") + "</td>");
            out.print("<td>" + result.getString("price") + "</td>");
            out.print("<td>" + result.getString("typeDomInt") + "</td>");
            out.print("<td>" + result.getString("numOfStops") + "</td>");

            // New column data added
            out.print("<td>New_Column_Data</td>");

            out.print("</tr>");
        }

        out.print("</table>");

        // Close the connections
        if (result != null) {
            result.close();
        }


        con.close();

    } catch (Exception e) {
        e.printStackTrace(); // Print the exception for debugging purposes
    }
	%>
	</div>
</body>
</html>