<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	                <a class="nav-link" href="repReservation.jsp">Make Reservation</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="repEditReserve.jsp">Edit Reservation</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="repEditInfo.jsp">Edit Information</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="repStatsReserve.jsp">Statistics</a>
	            </li>
	        </ul>
	    </div>
	    <button id="logout-button" disabled style="margin:10px;">
		  Logout
		</button>
	</nav>
<br><br>
   <h1>Edit for Customer:</h1>
   <form id="editForm">
   	<input type="text" name="customerUsername" placeholder="customer username">
    <button type="submit" form="form1" value="Submit" onclick="submitForm()">Submit</button>
   </form>
   <script>
		function submitForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('editForm'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'repEdit_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send();
		};
	</script>
	
    
</body>
</html>