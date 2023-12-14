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
                <a class="nav-link" href="adminHome.jsp">Home</a>
            </li>        
            <li class="nav-item">
                <a class="nav-link" href="adminStats.jsp">Statistics</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admineditInfo.jsp">Edit Information</a>
            </li>
        </ul>
    </div>
    <button id="logout-button" disabled style="margin:10px;">
        Logout
    </button>
</nav>

<br><br>

<h3>Add Customer or Rep Information </h3>
<form id="adduserForm" onsubmit="adduserSubmitForm(event);">
    <input type="text" name="ausername" placeholder="Username">
    <input type="text" name="apassword" placeholder="Password">
    <input type="radio" name="atype" value="customer" > Customer
    <input type="radio" name="atype" value="representative" > Representative
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="adduserResult"></div></center>
</div>


<br><br>


<br><br>

<h3>Edit User Information: </h3>
<form id="edituserForm" onsubmit="edituserSubmitForm(event);">
    <input type="text" name="eusername" placeholder="Username">
    <input type="text" name="epassword" placeholder="Password">
    <input type="radio" name="etype" value="customer" > Customer
	<input type="radio" name="etype" value="representative" > Representative
    <p>what would you like to change?</p>
    <input type="text" name="changeusername" placeholder="Username to Change">
    <input type="text" name="changepassword" placeholder="Password to Change">
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="edituserResult"></div></center>
</div>

<br><br>


<h3>Delete User: </h3>
<form id="deleteuserForm" onsubmit="deleteuserSubmitForm(event);">
    <p>what would you like to delete?</p>
    <input type="text" name="dusername" placeholder="Username">
    <input type="text" name="dpassword" placeholder="Password">
    <br>
    </select>
    <br>
    <button type="submit">Submit</button>
</form>

<div style="text-align: center; padding:20px;">
    <center><div id="deleteuserResult"></div></center>
</div>



<script>
    function adduserSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('adduserForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('adduserResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'adminadd.query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    
    
    
    
    function edituserSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('edituserForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('edituserResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'admineditquery.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };
    
    
    function deleteuserSubmitForm(event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        var formData = new FormData(document.getElementById('deleteuserForm'));

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('deleteuserResult').innerHTML = xhr.responseText;
                } else {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            }
        };

        xhr.open('GET', 'admindelete_query.jsp?' + new URLSearchParams(formData).toString(), true);
        xhr.send();
    };

</script>

</body>
</html>
