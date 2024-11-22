<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <title>Register Page</title>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #ffffff;
        }

        .login-container {
            max-width: 500px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Fredoka One', sans-serif;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-login {
            width: 100%;
            background-color: #A0C4FF;
            border-color: #A0C4FF;
            color: #fff;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 8px;
        }

        .btn-login:hover {
            background-color: #A0C4FF;
        }

        .form-label {
            font-weight: bold;
        }

        .mt-3 a {
            color: #9D8189;
            text-decoration: none;
        }

        .mt-3 a:hover {
            color: #8E9AAF;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h1>IUP COMPETITION</h1>
    <h2>Register</h2>
    <form action="<%= request.getContextPath() %>/register" method="POST">
        <!-- Name -->
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <!-- Email -->
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <!-- Password -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <!-- Confirm Password -->
        <div class="mb-3">
            <label for="password_confirmation" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" required>
        </div>
        <!-- Submit Button -->
        <button type="submit" class="btn btn-login">Register</button>
    </form>
    <div class="mt-3 text-center">
        <a href="<%= request.getContextPath() %>/login">Already have an account? Login here</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
