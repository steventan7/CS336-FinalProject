<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
             <li class="nav-item">
                <a class="nav-link" href="repHome.jsp">Home</a>
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

<h3>Lookup Waiting List: </h3>
<form id="waitForm" onsubmit="waitSubmitForm(event);">
    <input type="text" name="airlineID" placeholder="Airline ID">
    <input type="text" name="Aircraft ID" placeholder="Aircraft ID">
    <input type="text" name="flightNumber" placeholder="Flight Number">
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="waitResult"></div></center>
</div>


<br><br>
<h3>Lookup Flights per Airport </h3>
<form id="flightsForm" onsubmit="flightsSubmitForm(event);">
    <input type="text" name="airportID" placeholder="Airport ID">
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="flightsResult"></div></center>
</div>


<script>
    function waitSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('waitForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('waitResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repWaitList_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };

    function flightsSubmitForm(event) {
        event.preventDefault();
        console.log('flightsSubmitForm called'); // Add this line
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('flightsForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('flightsResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repFlightsList_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
</script>

</body>
</html>
