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

<h3>Add Aircraft Information: </h3>
<form id="addaircraftForm" onsubmit="addaircraftSubmitForm(event);">
    <input type="text" name="aircraftID" placeholder="Aircraft ID">
    <input type="text" name="numSeats" placeholder="Number of Seats">
    <br>
    <input type="checkbox" id="monday" name="Operates Monday" value="true">
    <label for="Operates Monday">Operates Monday&nbsp;&nbsp;</label>
    <input type="checkbox" id="tuesday" name="Operates Tuesday" value="true">
    <label for="Operates Tuesday">Operates Tuesday&nbsp;&nbsp;</label>
    <input type="checkbox" id="wednesday" name="Operates Wednesday" value="true">
    <label for="Operates Wednesday">Operates Wednesday&nbsp;&nbsp;</label>
    <input type="checkbox" id="thursday" name="Operates Thursday" value="true">
    <label for="Operates Thursday">Operates Thursday&nbsp;&nbsp;</label>
    <input type="checkbox" id="friday" name="Operates Friday" value="true">
    <label for="Operates Friday">Operates Friday&nbsp;&nbsp;</label>
    <input type="checkbox" id="saturday" name="Operates Saturday" value="true">
    <label for="Operates Saturday">Operates Saturday&nbsp;&nbsp;</label>
    <input type="checkbox" id="sunday" name="Operates Sunday" value="true">
    <label for="Operates Sunday">Operates Sunday</label>
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="addaircraftResult"></div></center>
</div>

<br><br>
<h3>Add Airport Information: </h3>
<form id="addairportForm" onsubmit="addairportSubmitForm(event);">
    <input type="text" name="airportID" placeholder="Airport ID">
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="addairportResult"></div></center>
</div>

<br><br>

<h3>Add Flight Information: </h3>
<form id="addflightForm" onsubmit="addflightSubmitForm(event);">
    <input type="text" name="airlineid" placeholder="Airline ID">
    <input type="text" name="aircraftid" placeholder="Aircraft ID">
    <input type="text" name="flight_number" placeholder="Flight Number">
    <input type="text" name="departure_airport" placeholder="Departure Airport">
    <input type="text" name="destination_airport" placeholder="Destination Airport">
    <input type="text" name="domint" placeholder="Domestic or International">
    <label for="depdatetimeInput">Departure Date and Time:</label>
    <input type="datetime-local" id="depdatetimeInput" name="depdatetimeInput">
    <label for="arrdatetimeInput">Arrival Date and Time:</label>
    <input type="datetime-local" id="arrdatetimeInput" name="arrdatetimeInput">
    <input type="text" name="price" placeholder="Price">
    <input type="text" name="numstops" placeholder="Number of Stops">
    <input type="text" name="flight_duration" placeholder="Flight Duration (in minutes)">

    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="addflightResult"></div></center>
</div>

<br><br>

<h3>Edit Aircraft Information: </h3>
<form id="editaircraftForm" onsubmit="editaircraftSubmitForm(event);">
    <h5>Enter Aircraft ID of the Aircraft you wish to modify </h5>
    <input type="text" name="editaircraftID" placeholder="Aircraft ID">
    <br>
    <h5>Select new desired values for the Number of Seats and days of operation: </h5>
    <input type="text" name="editnumSeats" placeholder="Number of Seats">
    <input type="checkbox" id="editmonday" name="editmonday" value="true">
    <label for="Operates Monday">Operates Monday&nbsp;&nbsp;</label>
    <input type="checkbox" id="edittuesday" name="edittuesday" value="true">
    <label for="Operates Tuesday">Operates Tuesday&nbsp;&nbsp;</label>
    <input type="checkbox" id="editwednesday" name="editwednesday" value="true">
    <label for="Operates Wednesday">Operates Wednesday&nbsp;&nbsp;</label>
    <input type="checkbox" id="editthursday" name="editthursday" value="true">
    <label for="Operates Thursday">Operates Thursday&nbsp;&nbsp;</label>
    <input type="checkbox" id="editfriday" name="editfriday" value="true">
    <label for="Operates Friday">Operates Friday&nbsp;&nbsp;</label>
    <input type="checkbox" id="editsaturday" name="editsaturday" value="true">
    <label for="Operates Saturday">Operates Saturday&nbsp;&nbsp;</label>
    <input type="checkbox" id="editsunday" name="editsunday" value="true">
    <label for="Operates Sunday">Operates Sunday&nbsp;&nbsp;</label>
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="editaircraftResult"></div></center>
</div>

<br><br>

<h3>Edit Airport Information: </h3>
<form id="editairportForm" onsubmit="editairportSubmitForm(event);">
    <input type="text" name="oldairportID" placeholder="Original Airport ID">
    <input type="text" name="newairportID" placeholder="New Airport ID">
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="editairportResult"></div></center>
</div>

<br><br>

<h3>Edit Flight Information: </h3>
<form id="editflightForm" onsubmit="editflightSubmitForm(event);">
 	<h5>Enter Airline ID, Aircraft ID, and Flight Number of the Flight you wish to modify </h5>
    <input type="text" name="editfairlineid" placeholder="Airline ID">
    <input type="text" name="editfaircraftid" placeholder="Aircraft ID">
    <input type="text" name="editfflight_number" placeholder="Flight Number">
    <br>
    <h5>Select the following new desired values: </h5>
    <input type="text" name="editfdeparture_airport" placeholder="Departure Airport">
    <input type="text" name="editfdestination_airport" placeholder="Destination Airport">
    <input type="text" name="editfdomint" placeholder="Domestic or International">
    <label for="editfdepdatetimeInput">Departure Date and Time:</label>
    <input type="datetime-local" id="editfdepdatetimeInput" name="editfdepdatetimeInput">
    <label for="editfarrdatetimeInput">Arrival Date and Time:</label>
    <input type="datetime-local" id="editfarrdatetimeInput" name="editfarrdatetimeInput">
    <input type="text" name="editfprice" placeholder="Price">
    <input type="text" name="editfnumstops" placeholder="Number of Stops">
    <input type="text" name="editfflight_duration" placeholder="Flight Duration (in minutes)">

    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="editflightResult"></div></center>
</div>

<script>
    function addaircraftSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('addaircraftForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('addaircraftResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repaddAircraft_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    function addairportSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('addairportForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('addairportResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repaddAirport_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    
    function addflightSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('addflightForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('addflightResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repaddFlight_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    
    function editaircraftSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('editaircraftForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('editaircraftResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repeditAircraft_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    function editairportSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('editairportForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('editairportResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repeditAirport_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    
    function editflightSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('editflightForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('editflightResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'repeditFlight_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };

</script>

</body>
</html>
