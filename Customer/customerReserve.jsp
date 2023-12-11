<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

<center><h1>Customer Reserve</h1>

<!--  Sort flights by different criteria (price, take-off time, landing time, duration of flight)
[] filter the list of flights by various criteria (price, number of stops, airline, take-off time,
landing time) -->
		<div>
			<h3>Reserve your flight: </h3>
			<form action="customerBooking.jsp">
			<input type="text" name="fname" placeholder="First Name">
  			<input type="text" name="lname" placeholder="Last Name">
  			<input type="text" name="passengerid" placeholder="Passenger ID">
  			<input type="text" name="idNum" placeholder="ID Num">
  			<input type="text" name="seatnumber" placeholder="Seat Number">
  			<br>
		    <input type="radio" name="type" id = "reserveone-way" value="one-way" onclick="disable2()"> One Way
		    <input type="radio" name="type" id = "reserveround-trip"  value="round-trip" > Round Trip
		    <input type="date" name="reservedate1" placeholder="Date1">
   		    <input type="date" name="reservedate2" placeholder="Date2"> <!-- Remove visibility if one-way -->
		    <input type="checkbox" id="flexible" name="flexible" value="true">
  			<label for="flexible">Flexible</label><br>
  			<input type="text" name="reserveairlineID" placeholder="Airlineid">
  			<input type="text" name="reserveaircraftID" placeholder="Aircraftid">
  			<input type="text" name="reserveprice" placeholder="Price">
  			<input type="text" name="reserveflightnumber" placeholder="Flight Number">
		    <input type="radio" name="reserveecon_rate" value="first_class" > First Class
		    <input type="radio" name="reserveecon_rate" value="business" > Business
		    <input type="radio" name="reserveecon_rate" value="economy" > Economy
		    <input type="submit" value="Search">
		    </form>
		    <br>
		  
		    <br>
		    <br>
			<h3>Search your flight: </h3>
		    <form id="sortForm">
		    <input type="radio" name="type" id = "one-way" value="one-way" onclick="disable()"> One Way
		    <input type="radio" name="type" id = "round-trip"  value="round-trip" > Round Trip
		    <input type="date" name="date1" placeholder="Date1">
   		    <input type="date" name="date2" placeholder="Date2"> <!-- Remove visibility if one-way -->
   		     <input type="checkbox" id="flexible" name="flexible" value="true">
  			<label for="flexible">Flexible</label><br>
   		     <input type="text" name="destination_airport" placeholder="Destination Airport">
   		    <input type="text" name="departure_airport" placeholder="Departure Airport">
		    <br>
		    Sort:
		    <br>
			<select name="sort" size=1>
				<option value="all">none</option>
				<option value="price">Price</option>
				<option value="departure_time">Departure</option>
				<option value="arrival_time">Arrival</option>
				<option value="flight_duration">Flight duration</option>
			</select>
			<br>
			Filter:
			<br>
			<select name="filter" multiple>
			<option value="none" selected="selected"> None</option>
            <option value="price">Price</option>
            <option value="numOfStops">Number of Stops</option>
            <option value="airline_id">Airline</option>
            <option value="departure_time">Departure</option>
            <option value="arrival_time">Arrival</option>
        	</select>
			<br>
			<button type="submit" form="form1" value="Submit" onclick="submitForm()">Submit</button>
		</form>
		</div><center>
		<div style="text-align: center; padding:20px;">
		<center><div id="result"></div></center>

		<script>
		function submitForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('sortForm'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'flight_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send();
		};
		function disable() {
	        var oneWayRadio = document.getElementById("one-way");
	        var roundTripRadio = document.getElementById("round-trip");
	        var date2Input = document.getElementsByName("date2")[0];

	        oneWayRadio.addEventListener("change", function() {
	            date2Input.disabled = true;
	        });

	        roundTripRadio.addEventListener("change", function() {
	            date2Input.disabled = false;
	        });
	    }
		function disable2() {
	        var oneWayRadio = document.getElementById("reserveone-way");
	        var roundTripRadio = document.getElementById("reserveround-trip");
	        var date2Input = document.getElementsByName("reservedate2")[0];

	        oneWayRadio.addEventListener("change", function() {
	            date2Input.disabled = true;
	        });

	        roundTripRadio.addEventListener("change", function() {
	            date2Input.disabled = false;
	        });
	    }
		</script>
		
	<br>
	</div>
	
</body>
</html>