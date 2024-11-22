<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/b09fd6009e.js" crossorigin="anonymous"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/js-confetti@latest/dist/js-confetti.browser.js"></script>

    <style>
        body {
            font-family: 'Fredoka One', sans-serif;
        }
        .navbar-nav .nav-link {
            font-family: 'Fredoka One', sans-serif;
            text-transform: uppercase;
        }
        .navbar-brand {
            text-transform: uppercase;
            font-size: 1.5rem;
        }
        .login-btn {
            background-color: #A8DADC;
            border-color: #A8DADC;
            text-transform: uppercase;
            padding: 10px 20px;
            color: #000;
            border-radius: 10px;
            font-size: 1.1rem;
        }
        .register-btn {
            background-color: #F4A3A8;
            border-color: #F4A3A8;
            text-transform: uppercase;
            padding: 10px 20px;
            color: #000;
            border-radius: 10px;
            font-size: 1.1rem;
        }
        .navbar {
            background-color: #FAEDCB;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 25px;
            font-size: 1.2rem;
            margin-left: 30px;
            margin-right: 30px;
            margin-top: 20px;
        }
        .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }
        .score-trash {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .score {
            font-size: 1.2rem;
            color: white;
            background-color: #7776BC;
            padding: 5px 10px;
            border-radius: 50px;
        }
        .btn-delete {
            background-color: #FF6F6F;
            border-color: #FF6F6F;
            color: #fff;
            border-radius: 10px;
            padding: 10px;
        }
        .btn-add {
            display: inline-flex;
            align-items: center;
            background-color: #A8DADC;
            color: #fff;
            border-radius: 10px;
            padding: 10px 20px;
            margin-right: 45px;
        }
        h1 {
            text-align: center;
            margin-top: 40px;
        }
        .add-result-container {
            display: flex;
            justify-content: flex-end;
            margin-right: 30px;
            margin-top: 10px;
        }
    </style>
    <title>Result List</title>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">IUP Competition</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse align-right" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="IUPParticipantList.jsp">Participant</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="IUPCompeList.jsp">Competition</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="IUPResultList.jsp">Result</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container text-center">
    <h1>RESULT LIST</h1>
</div>

<div class="container">
    <% String successMessage = (String) request.getAttribute("success"); %>
    <% if (successMessage != null) { %>
    <div id="success-message" class="alert alert-success text-center">
        <%= successMessage %>
    </div>
    <% } %>
</div>

<div class="add-result-container">
    <a href="addResult.jsp" class="btn btn-add">
        Add Result <i class="fa-solid fa-user-plus"></i>
    </a>
</div>

<div class="container">
    <div class="row">
        <div class="col-4">
            <div class="list-group">
                <% for (Competition c : competitions) { %>
                <a class="list-group-item list-group-item-action" href="#list-item-<%= c.getId() %>"><%= c.getName() %></a>
                <% } %>
            </div>
        </div>

        <div class="col-8">
            <div class="scrollspy-example">
                <% for (Competition c : competitions) { %>
                <h4 id="list-item-<%= c.getId() %>"><%= c.getName() %></h4>
                <ul class="list-group mb-3">
                    <%
                        for (Result r : results) {
                            if (r.getCompetitionId() == c.getId()) {
                    %>
                    <li class="list-group-item">
                        <span><%= participants.get(r.getParticipantId()).getName() %></span>
                        <div class="score-trash">
                            <span class="score"><%= r.getScore() %></span>
                            <form action="deleteResultServlet" method="POST">
                                <input type="hidden" name="id" value="<%= r.getId() %>">
                                <button type="submit" class="btn-delete">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </li>
                    <% } } %>
                    <% if (results.stream().noneMatch(r -> r.getCompetitionId() == c.getId())) { %>
                    <li class="list-group-item text-muted">No participants found for this competition</li>
                    <% } %>
                </ul>
                <% } %>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
