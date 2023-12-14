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
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
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

<h3 style="padding: 20px 50px 20px 50px;">Contact Form</h3>
<h6 style="padding-left:50px;">Provide a question for our customer representatives!</h6>
<h6 style="padding-left:50px;"><a href="customerFAQ.jsp">Check out our commonly asked questions.</a></h6>
<div style="border-radius: 5px; background-color: #f2f2f2; padding: 50px;">
  <form id ="question">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

    <label for="subject">Question</label>
    <textarea id="question" name="question" placeholder="Write something.." style="height:200px"></textarea>
    <input type="submit" value="Submit" onclick="submitForm()">
  </form>
  <center><div id="result"></div></center>
  <script>
  function submitForm() {
	    var xhr = new XMLHttpRequest();
	    var formData = new FormData(document.getElementById('question'));
		
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            if (xhr.status === 200) {
	                document.getElementById('result').innerHTML = xhr.responseText;
	            } else {
	                console.error('Error:', xhr.status, xhr.statusText);
	            }
	        }
	    };
	
	    xhr.open('GET', 'customerQuestionQuery.jsp?' + new URLSearchParams(formData).toString(), true);
	    xhr.send();
	    var myText = "Your form has been submitted!";
	    alert (myText);
	};
  </script>
</div>
</body>
</html>