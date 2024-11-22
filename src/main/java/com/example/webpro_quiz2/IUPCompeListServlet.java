package com.example.webpro_quiz2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

// Servlet to handle competition-related operations
@WebServlet("/CompetitionServlet")
public class IUPCompeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Competition> competitions = new ArrayList<>();

        // Connect to the database and fetch competition data
        try (Connection conn = DatabaseConnection.getConnection()) {
            System.out.println("Database connection successful!");

            // Fetch competitions
            String sqlCompetition = "SELECT * FROM competition";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlCompetition)) {
                while (rs.next()) {
                    competitions.add(new Competition(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDate("date")
                    ));
                }
            }

        } catch (SQLException e) {
            System.out.println("Error fetching competitions from database:");
            e.printStackTrace();
        }

        // Debugging: Print fetched competitions
        System.out.println("Competitions fetched:");
        for (Competition c : competitions) {
            System.out.println("ID: " + c.getId() + ", Name: " + c.getName());
        }

        // Set competitions as request attribute and forward to JSP
        request.setAttribute("competitions", competitions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("IUPCompeList.jsp");
        dispatcher.forward(request, response);
    }
}
