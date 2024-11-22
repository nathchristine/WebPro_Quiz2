<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      margin-right: 10px;
    }

    .back-result-container {
      display: flex;
      justify-content: flex-start;
      max-width: 600px;
      margin: 20px auto 0 auto;
    }
  </style>

  <title>Update Competition</title>
</head>
<body>

<h1>UPDATE COMPETITION</h1>

<div class="back-result-container">
  <a href="<%= request.getContextPath() %>/IUPResultList/" class="btn btn-back">
    <i class="fa-solid fa-arrow-left fa-fade"></i> Back
  </a>
</div>

<div class="container form-container">
  <%
    Competition competition = (Competition) request.getAttribute("competition");
  %>
  <form action="<%= request.getContextPath() %>/IUPCompeList/Update" method="POST">
    <input type="hidden" name="_method" value="PUT">

    <!-- Competition ID -->
    <div class="mb-3">
      <label for="competition_id" class="form-label">Competition ID</label>
      <input type="text" class="form-control" id="competition_id" name="id" value="<%= competition.getId() %>" required readonly>
    </div>

    <!-- Competition Name -->
    <div class="mb-3">
      <label for="name" class="form-label">Competition Name</label>
      <input type="text" class="form-control" id="name" name="name" value="<%= competition.getName() %>" required>
    </div>

    <!-- Competition Description -->
    <div class="mb-3">
      <label for="description" class="form-label">Competition Description</label>
      <textarea class="form-control" id="description" name="description" required><%= competition.getDescription() %></textarea>
    </div>

    <!-- Competition Date -->
    <div class="mb-3">
      <label for="date" class="form-label">Competition Date</label>
      <input type="date" class="form-control" id="date" name="date" value="<%= competition.getDate() %>" required>
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-submit">Update Competition</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
