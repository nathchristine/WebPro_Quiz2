<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://kit.fontawesome.com/b09fd6009e.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Fredoka One', sans-serif;
    }

    h1 {
      text-align: center;
      margin-top: 20px;
      color: #343a40;
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

    .btn-back i{
      margin-right: 10px;
    }

    .back-result-container {
      display: flex;
      justify-content: flex-start;
      max-width: 600px;
      margin: 20px auto 0 auto; 
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

    .form-control {
      font-size: 1.1rem;
      border-radius: 8px;
      border: 1px solid #ced4da;
      margin-bottom: 15px;
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

    .add-competition-container {
      display: flex;
      justify-content: flex-end; 
      margin-right: 30px;
    }
  </style>

  <title>Add New Competition</title>
</head>
<body>

<h1>ADD NEW COMPETITION</h1>
<div class="back-result-container">
  <a href="IUPCompeList.jsp" class="btn btn-back">
    <i class="fa-solid fa-arrow-left fa-fade"></i> Back
  </a>
</div>

<!-- Form Container -->
<div class="container form-container">
  <form action="AddCompetitionServlet" method="POST">

    <!-- Competition Name -->
    <div class="mb-3">
      <label for="name" class="form-label">Competition Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter Competition Name" required>
    </div>

    <!-- Description -->
    <div class="mb-3">
      <label for="description" class="form-label">Description</label>
      <textarea class="form-control" id="description" name="description" placeholder="Enter Description" rows="4" required></textarea>
    </div>

    <!-- Date -->
    <div class="mb-3">
      <label for="date" class="form-label">Competition Date</label>
      <input type="date" class="form-control" id="date" name="date" required>
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-submit">Add Competition</button>
  </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
