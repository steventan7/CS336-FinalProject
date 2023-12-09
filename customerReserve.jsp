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
	                <a class="nav-link" href="home.jsp"> Home <span class="sr-only">(current)</span></a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link"> Your Flights</a>
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
		    <form id="sortForm" id = "form1">
		    <input type="radio" name="type" value="one-way" > One Way
		    <input type="radio" name="type" value="round-trip" > Round Trip
		    <br>
		    <input type="date" name="date1" placeholder="Date1">
		    <br>
   		    <input type="date" name="date2" placeholder="Date2"> <!-- Remove visibility if one-way -->
		    <br>
		    <input type="checkbox" id="flexible" name="flexible" value="isFlexible">
  			<label for="flexible">Flexible</label><br>
		    <input type="radio" name="econ_rate" value="first_class" > First Class
		    <input type="radio" name="econ_rate" value="business" > Business
		    <br>
		    Sort:
			<select name="sort" size=1>
				<option value="all">none</option>
				<option value="price">Price</option>
				<option value="departure">Departure</option>
				<option value="arrival">Arrival</option>
				<option value="flight duration">Flight duration</option>
			</select>
			<br>
			Filter:
			<br>
			<select name="filter" multiple>
			<option value="none" selected="selected"> None</option>
            <option value="price">Price</option>
            <option value="num_stops">Number of Stops</option>
            <option value="airline">Airline</option>
            <option value="departure">Departure</option>
            <option value="arrival">Arrival</option>
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
		</script>
		
	<br>
	</div>
	
</body>
</html>