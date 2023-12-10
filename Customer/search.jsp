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
	<div id="searchResults">   </div>
	<script>
        function searchFAQ() {
            // Fetch the user input
            var userInput = document.getElementById('searchInput').value;

            // Perform the search (you may use AJAX to fetch results from the server)
            // For simplicity, this example uses a hardcoded list
            var faqData = [
                { question: "cat", answer: "HTML stands for HyperText Markup Language." },
                { question: "What is CSS?", answer: "CSS stands for Cascading Style Sheets." },
                { question: "What is JavaScript?", answer: "JavaScript is a programming language that enables interactive web pages." }
                // Add more FAQ entries as needed
            ];

            // Filter the FAQ data based on user input
            var searchResults = faqData.filter(function (faq) {
                return faq.question.toLowerCase().includes(userInput.toLowerCase()) ||
                       faq.answer.toLowerCase().includes(userInput.toLowerCase());
            });

            // Display search results
            displayResults(searchResults);
        }

        function displayResults(results) {
            var resultsContainer = document.getElementById('searchResults');
            resultsContainer.innerHTML = ''; // Clear previous results

            if (results.length === 0) {
                resultsContainer.innerHTML = '<p>No results found.</p>';
            } else {
                // Display each result
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