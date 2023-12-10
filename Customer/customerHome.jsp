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
	    <button id="logout-button" disabled style="margin:10px;">
		  Logout
		</button>
	</nav>
	<div style="justify-content: center">
		<h1>Welcome</h1>
    <form id="searchForm">
        <label for="searchInput">Search:</label>
        <input type="text" id="searchInput" name="searchInput" placeholder="Enter keywords">
        <button type="button" onclick="searchFAQ()">Search</button>
    </form>
	</div>
    <div id="searchResults">
    </div>

    <script>
        function searchFAQ() {
            var userInput = document.getElementById('searchInput').value;
            var faqData = [
                { question: "What is HTML?", answer: "HTML stands for HyperText Markup Language." },
                { question: "What is CSS?", answer: "CSS stands for Cascading Style Sheets." },
                { question: "What is JavaScript?", answer: "JavaScript is a programming language that enables interactive web pages." }
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
                    resultItem.innerHTML = '<strong>' + result.question + '</strong><br>' + result.answer + '<hr>';
                    resultsContainer.appendChild(resultItem);
                });
            }
        }
    </script>
	
    
</body>
</html>