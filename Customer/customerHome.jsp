<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Tracker</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
	 .dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  float: none;
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	  text-align: left;
	}
	
	.dropdown-content a:hover {
	  background-color: #ddd;
	}
	
	.dropdown:hover .dropdown-content {
	  display: block;
	}
	
	select {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  text-indent: 1px;
	  text-overflow: '';
	}
    </style>
</head>
<body style="text-align:center;">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="padding:20px;">
	    <a class="navbar-brand">Website</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	        <ul class="navbar-nav mr-auto">
	            <li class="nav-item active">
	                <a class="nav-link">Home <span class="sr-only">(current)</span></a>
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
	    </div>
	    <button id="logout-button" style="margin:10px;">
		  <a href="logout.jsp">Logout</a>
		</button>
	</nav>
	<div style="justify-content: center">
		<h1>Welcome <%=session.getAttribute("user") %></h1>
    <form id="searchForm">
        <label for="searchInput">Search:</label>
        <input type="text" id="searchInput" name="searchInput" placeholder="Enter keywords">
        <button type="button" onclick="searchFAQ()">Search</button>
    </form>
	</div>
    <div id="searchResults">
    </div>
	
	<%
    // Your Java code to connect to the database and execute a query
    try {
    	ApplicationDB db = new ApplicationDB();	
        Connection con = db.getConnection();	
        Statement stmt = con.createStatement();
        Statement stmt2 = con.createStatement();
        
        String sqlQuery = "SELECT aircraft_id, airline_id, flight_number FROM HasWaitingList where userid = " + session.getAttribute("accountid");

        PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
        ResultSet result = preparedStatement.executeQuery();

        String aircraftID = "";
        String airlineID = "";
        String flightNumber = "";
        if (result.next()) {
        	aircraftID = result.getString("aircraft_id");
        	airlineID = result.getString("aircraft_id");
        	flightNumber = result.getString("flight_number");
        	if (result != null) {
			    result.close();
			}
        	String str = "select num_of_seats from Aircraft where aircraft_id = '" + aircraftID + "'";
		    result = stmt.executeQuery(str);
		    int capacity = 0;
			if (result.next()) {
				capacity = result.getInt("num_of_seats");
            }
			
			if (result != null) {
			    result.close();
			}
				
			String str2 = "select count(*) as currentBookings from flightSpecificInfo where aircraft_id = " + aircraftID + " AND airline_id = '" + airlineID + "' AND flight_number = '" + flightNumber + "'";
			ResultSet result2 = stmt2.executeQuery(str2);

			int currentBooking = 0;
			if (result2.next()) {
				currentBooking = result2.getInt("currentBookings");
            }
			
			if (result2 != null) {
			    result2.close();
			}									
				
			if (currentBooking >= capacity) {
				%>
		        <script>
		            alert('You are still in a waiting table for reserving a ticket!');
		        </script>
				<%
			} else {
				
				%>
		        <script>
		            alert('There is a ticket available: Flight ' + <%=flightNumber%> + ' Aircraft: ' + <%=aircraftID%> + ' Airline: '+ <%=airlineID%> + "! Reserve your ticket now!");
		        </script>
				<%
			}
	     }
	
	        preparedStatement.close();
	        con.close();
	    } catch (Exception e) {
	    	out.print(e);
	        e.printStackTrace();
	    }
	%>

    <script>
        function searchFAQ() {
            var userInput = document.getElementById('searchInput').value;
            var faqData = [
                { question: "Reserve", answer: "<p>You could reserve flights on this link:</p> <a href='customerReserve.jsp'>Click here</a>" },
                { question: "How to reserve?", answer: "<p>You could search flights on this link:</p> <a href='customerReserve.jsp'>Click here</a>" },
                { question: "Customer Reserve", answer: "<p>Customer reservation could be found here:</p> <a href='customerReserve.jsp'>Click here</a>" },
                { question: "Help", answer: "<p>You could ask for help using this link:</p> <a href='customerHelp.jsp'>Click here</a>" },
                { question: "Ask for Help", answer: "<p>Looking for help? Use this link:</p> <a href='customerHelp.jsp'>Click here</a>" },
                { question: "Questions", answer: "<p>Have any questions? Maybe this could help:</p> <a href='customerHelp.jsp'>Click here</a>" },
                { question: "My Flights", answer: "<p>You could check your flights using this link</p> <a href='customerReservations.jsp'>Click here</a>" },
                { question: "Reservation", answer: "<p>Check your flights here:</p> <a href='customerReserve.jsp'>Click here</a>" },
                { question: "Reservations", answer: "<p>Made a reservation recently?:</p> <a href='customerReserve.jsp'>Click here</a>" },
                { question: "FAQ", answer: "<p>Here's a list of frequently asked questions!</p> <a href='customerFAQ.jsp'>Click here</a>" },
                { question: "terminals", answer: "<p>Have questions about our terminals?:</p> <a href='customerFAQ.jsp'>Click here</a>" },
                { question: "wifi", answer: "<p>Looking to learn more about our wifi policies?:</p> <a href='customerFAQ.jsp'>Click here</a>" }
            ];

            var searchResults = faqData.filter(function (faq) {
                return faq.question.toLowerCase().includes(userInput.toLowerCase()) ||
                       faq.answer.toLowerCase().includes(userInput.toLowerCase());
            });

            displayResults(searchResults, userInput);
        }

        function displayResults(results, userInput) {
            var resultsContainer = document.getElementById('searchResults');
            resultsContainer.innerHTML = ''; 

            if (results.length === 0 || userInput.length === 0) {
                resultsContainer.innerHTML = '<p>No results found.</p>';
            } else {
                results.forEach(function (result) {
                    var resultItem = document.createElement('div');
                    resultItem.innerHTML = '<br>' + result.answer + '<hr>';
                    resultsContainer.appendChild(resultItem);
                });
            }
        }
    </script>
	
    
</body>
</html>