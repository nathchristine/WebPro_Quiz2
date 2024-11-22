<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Fredoka One', sans-serif;
        }
        .navbar-nav .nav-link {
            font-family: 'Fredoka One', sans-serif;
            text-transform: uppercase; /* Make navbar links uppercase */
        }
        .navbar-brand {
            text-transform: uppercase; /* Make navbar brand uppercase */
            font-size: 1.5rem; /* Adjust brand text size */
        }
        .login-btn {
            background-color: #A8DADC; /* Pastel teal color for login */
            border-color: #A8DADC;
            text-transform: uppercase; /* Make Login button text uppercase */
            padding: 10px 20px;
            color: #000; /* Make text black */
            border-radius: 10px; /* Rounded button */
            font-size: 1.1rem;
        }
        .register-btn {
            background-color: #F4A3A8; /* Pastel pink color for register */
            border-color: #F4A3A8;
            text-transform: uppercase; /* Make Register button text uppercase */
            padding: 10px 20px;
            color: #000; /* Make text black */
            border-radius: 10px; /* Rounded button */
            font-size: 1.1rem;
        }
        .navbar {
            background-color: #FAEDCB; /* Light yellow background */
            padding: 20px;
            /* Removed border */
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Add shadow */
            border-radius: 25px; /* Rounded corners for navbar */
            font-size: 1.2rem;
            margin-left: 30px;  /* Add left margin */
            margin-right: 30px; /* Add right margin */
            margin-top: 20px;  /* Add top margin */
        }

        .navbar-nav {
            align-items: center; /* Align navbar items vertically */
        }
        .nav-item-gap {
            margin-right: 20px; /* Add a gap between Result and Login */
        }
        h1 {
            text-align: center;
            font-size: 3rem;
            font-family: 'Fredoka One', sans-serif;
            margin-top: 225px;
            margin-bottom: 25px;
            display: flex;
            justify-content: center; /* Horizontally center */
            align-items: center; /* Vertically center */
        }
        .button-container {
            display: flex;
            gap: 20px; /* Space between buttons */
        }
        .welcome-button {
            justify-content: center; /* Center buttons */
        }
        .login2{
            background-color: #DBCDF0;
            border-color: #DBCDF0;
        }
        .reg2{
            background-color: #F7D9C4;
            border-color: #F7D9C4;
        }
    </style>
    <title>IUP Competition</title>
</head>
<body>
<!-- Navbar with rounded corners and pastel buttons -->
<nav class="navbar navbar-expand-lg navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">IUP Competition</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse align-right" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="IUPParticipantList">Participant</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="IUPCompeList">Competition</a>
                </li>
                <li class="nav-item nav-item-gap">
                    <a class="nav-link" href="IUPResultList">Result</a>
                </li>

                <li class="nav-item">
                    <a href="login.jsp" class="btn login-btn me-2" role="button">Login</a>
                </li>
                <li class="nav-item">
                    <a href="register.jsp" class="btn register-btn" role="button">Register</a>
                </li>
            </ul>
        </div>

    </div>
</nav>

<h1>WELCOME TO IUP COMPETITION</h1>

<!-- Button container to center and align buttons side by side -->
<div class="button-container welcome-button">
    <a href="IUPResultList.jsp" class="btn login-btn reg2" role="button">VIEW RESULTS</a>
</div>
</body>
</html>
