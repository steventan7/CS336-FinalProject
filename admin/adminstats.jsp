<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
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
	                <a class="nav-link" href="adminHome.jsp"> Home <span class="sr-only">(current)</span></a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="adminStats.jsp"> Statistics</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="admineditInfo.jsp">Edit Information</a>
	            </li>
	        </ul>
	    </div>
	</nav>
	
	<h1>Statistics!</h1>
	<br><br>
	<!-- Add buttons with onclick event handlers -->
	<h3>Obtain Sales Report</h3>
	<form id="salesReport">
		 <input type="text" name="month" placeholder="month">
		 <button type="submit" form="form1" value="Submit" onclick="salesReportForm()">Submit</button>
		 
	</form>
	<div id="result"></div>
   
    <br><br>
   
    <h3>Check Reservations</h3>
    
    <form id="reservationForm">
	    <input type="text" name="flightNumber" placeholder="flight number">
		<br><br>
		<input type="text" name="customerFirstName" placeholder="customer first name">
		<input type="text" name="customerLastName" placeholder="customer last name">
		
		<br><br>
		<button type="submit" form="form2" value="Submit" onclick="reservationForm()">Submit</button>
	</form>
	<div id="result"></div>
	
	<br><br>
	
	<h3>Revenue</h3>
	<br>
	<p>Revenue Summary (Please enter one)</p>
	<form id="summaryRevForm">
		<input type="text" name="flight" placeholder="flight">
		<input type="text" name="airline" placeholder="airline">
		<input type="text" name="customer" placeholder="customer">
		<button type="submit" form="form3" value="Submit" onclick="summaryForm()">Submit</button>
	
	</form>
	<div id="result"></div>
	
   	<br><br>
   	
   	<h3>Most Active Flights</h3>
	<br>
	
	<form id="mostactiveForm">
		
		<button type="submit" form="form3" value="Submit" onclick="activeForm()">Submit</button>
	
	</form>
	<div id="result"></div>
	<br><br><br><br>
    <!-- JavaScript to handle form submission and redirection -->
    <script>
	    function reservationForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('reservationForm'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'adminreservation_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};
		
		function salesReportForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('salesReport'));

		    xhr.onreadystatechange = function () {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };

		   
		   
		    xhr.open('GET', 'adminsales_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};

		
		function summaryForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('summaryRevForm'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'adminsummary_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};
		
		function summaryForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('mostactiveForm'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'adminactive_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};
       
    </script>
</body>
</html>