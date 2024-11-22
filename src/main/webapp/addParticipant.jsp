<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webpro_quiz2.Competition" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b09fd6009e.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-confetti@latest/dist/js-confetti.browser.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Fredoka One', sans-serif;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            font-family: 'Poppins', sans-serif;
        }

        .form-label {
            font-weight: bold;
            color: #343a40;
        }

        .form-control, .form-select {
            font-size: 1.1rem;
            border-radius: 8px;
            border: 1px solid #ced4da;
        }

        .btn-submit {
            width: 100%;
            background-color: #90BE6D;
            border-color: #90BE6D;
            color: #fff;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #4cae4c;
        }

        .btn-back {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            background-color: #A8DADC;
            border-color: #A8DADC;
            color: #fff;
            font-weight: bold;
            border-radius: 10px;
            padding: 10px 20px;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .btn-back i {
            margin-right: 10px; /* Add space between the icon and text */
        }

        /* Center align the Back button */
        .back-result-container {
            display: flex;
            justify-content: flex-start;
            max-width: 600px;
            margin: 20px auto 0 auto; /* Center it horizontally and add margin-top */
        }
    </style>

    <title>Add New Participant</title>
</head>
<body>

<h1>ADD NEW PARTICIPANT</h1>

<div class="back-result-container">
    <a href="<%= request.getContextPath() %>/IUPParticipantList" class="btn btn-back">
        <i class="fa-solid fa-arrow-left fa-fade"></i> Back
    </a>
</div>

<!-- Form Container -->
<div class="container form-container">
    <form action="<%= request.getContextPath() %>/IUPParticipantList/AddComplete" method="POST">
        <!-- Participant NRP -->
        <div class="mb-3">
            <label for="id" class="form-label">Participant NRP</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="Enter Participant NRP" required>
        </div>

        <!-- Participant Name -->
        <div class="mb-3">
            <label for="name" class="form-label">Participant Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Participant Name" required>
        </div>

        <!-- Participant Email -->
        <div class="mb-3">
            <label for="email" class="form-label">Participant Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Participant Email" required>
        </div>

        <!-- Participant Phone -->
        <div class="mb-3">
            <label for="phone" class="form-label">Participant Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter Participant Phone" required>
        </div>

        <!-- Select Competition -->
        <div class="mb-3">
            <label for="competition_id" class="form-label">Select Competition</label>
            <select class="form-select" id="competition_id" name="competition_id" required>
                <option value="" disabled selected>Select Competition</option>
                <%
                    List<Competition> competitions = (List<Competition>) request.getAttribute("competitions");
                    if (competitions != null) {
                        for (Competition c : competitions) {
                %>
                <option value="<%= c.getId() %>"><%= c.getId() %>. <%= c.getName() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-submit">Add Participant</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
