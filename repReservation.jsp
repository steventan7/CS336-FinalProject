<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
                    <a class="nav-link" href="repHome.jsp">Home <span class="sr-only">(current)</span></a>
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
    </nav>
    <br><br>
    <center><h1>Reserve for Customer:</h1>

    <!--  Sort flights by different criteria (price, take-off time, landing time, duration of flight)
    [] filter the list of flights by various criteria (price, number of stops, airline, take-off time,
    landing time) -->
    <div>
        <h3>Reserve your flight: </h3>
        <form id="repBooking" method="get" action="repBooking.jsp">
          <input type="text" name="fname" placeholder="First Name" required>
  			<input type="text" name="lname" placeholder="Last Name" required>
  			<input type="text" name="seatnumber" placeholder="Seat Number" required>
  			<br>
		    <input type="radio" name="type" id = "reserveone-way" value="one-way" onclick="disable2()" required> One Way
		    <input type="radio" name="type" id = "reserveround-trip"  value="round-trip" required> Round Trip
		    <input type="date" name="reservedate1" placeholder="Date1" required>
   		    <input type="date" name="reservedate2" placeholder="Date2" required> 
		    <input type="checkbox" id="flexible" name="flexible" value="true">
  			<label for="flexible">Flexible</label><br>
  			<input type="text" name="reserveairlineID" placeholder="Airlineid" required>
  			<input type="text" name="reserveaircraftID" placeholder="Aircraftid" required>
  			<input type="text" name="reserveprice" placeholder="Price" required>
  			<input type="text" name="reserveflightnumber" placeholder="Flight Number" required>
		    <input type="radio" name="reserveecon_rate" value="first_class" required> First Class
		    <input type="radio" name="reserveecon_rate" value="business" required> Business
		    <input type="radio" name="reserveecon_rate" value="economy" required> Economy
		    <input type="submit" value="Reserve">
        </form>
    </div>

    <script>
        function disable2() {
            var oneWayRadio = document.getElementById("reserveone-way");
            var roundTripRadio = document.getElementById("reserveround-trip");
            var date2Input = document.getElementsByName("reservedate2")[0];

            oneWayRadio.addEventListener("change", function () {
                date2Input.disabled = true;
            });

            roundTripRadio.addEventListener("change", function () {
                date2Input.disabled = false;
            });
        }
    </script>

    <br>
</body>
</html>
