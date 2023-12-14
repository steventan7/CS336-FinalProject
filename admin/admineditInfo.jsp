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
		    <input type="text" name="ausername" placeholder="Username">
		    <input type="text" name="apassword" placeholder="Password">
		    <input type="radio" name="atype" value="customer" > Customer
		    <input type="radio" name="atype" value="representative" > Representative
		    <br>
			<button type="submit" onclick="submitForm();">Submit</button>
			</form>
		
		</div>
		<div style="text-align: center; padding:20px;">
		<center><div id="result"></div></center>
		</div>
		
		<h3>Edit Information </h3>
			<form id="editform">
		    <input type="text" name="eusername" placeholder="Username">
		    <input type="text" name="epassword" placeholder="Password">
		    <input type="radio" name="etype" value="customer" > Customer
		    <input type="radio" name="etype" value="representative" > Representative
		    <p>what would you like to change?</p>
		    <input type="text" name="changeusername" placeholder="Username to Change">
		    <input type="text" name="changepassword" placeholder="Password to Change">
		    <br>
		
			<button type="submit" value="Submit" onclick="submitForm1();">Submit</button>
		</form>
		</div><center>
		<div style="text-align: center; padding:20px;">
		<center><div id="result1"></div></center>
		</div>
		<h3>Delete Information </h3>
			<form id="deleteform">
		   
		    
		    <p>what would you like to delete?</p>
			    <input type="text" name="dusername" placeholder="Username">
			    <input type="text" name="dpassword" placeholder="Password">
		    <br>
		
			<button type="submit"  value="Submit" onclick="submitForm2();">Submit</button>
		</form>
		</div><center>
		<div style="text-align: center; padding:20px;">
		<center><div id="result2"></div></center>
		</div>
		
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
		
		    xhr.open('GET', 'adminadd_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};
		
		function submitForm1() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('editform'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result1').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'admineditquery.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};
		function submitForm2() {
		    var xhr = new XMLHttpRequest();
		    var formData = new FormData(document.getElementById('deleteform'));
			
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                document.getElementById('result2').innerHTML = xhr.responseText;
		            } else {
		                console.error('Error:', xhr.status, xhr.statusText);
		            }
		        }
		    };
		
		    xhr.open('GET', 'admindelete_query.jsp?' + new URLSearchParams(formData).toString(), true);
		    xhr.send(formData);
		};
		</script>
		

</body>
</html>