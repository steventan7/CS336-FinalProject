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
	
	<h1>Edit Info!</h1>
	

	<div>
			<h3>Add New Customer Or Rep </h3>
			<form id="addform">
		    <input type="text" name="username" placeholder="Username">
		    <input type="text" name="password" placeholder="Password">
		    <input type="radio" name="type" id = "customer" value="one-way" onclick="disable()"> Customer
		    <input type="radio" name="type" id = "rep"  value="true" > Representative
		    <input type="text" name="firstName" placeholder="First Name">
		    <input type="text" name="lastName" placeholder="Last Name">
		    <br>
		
			<button type="submit" form="form1" value="Submit" onclick="submitForm()">Submit</button>
		</form>
		</div><center>
		<div style="text-align: center; padding:20px;">
		<center><div id="result"></div></center>

		<script>
		function submitForm() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('addform'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'admineditquery.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send();
		};
		
		</script>
		
	<br>
	</div>
	
</body>
</html>
