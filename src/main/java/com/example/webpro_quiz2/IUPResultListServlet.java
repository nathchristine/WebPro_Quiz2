package com.example.webpro_quiz2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Servlet for handling competition data
@WebServlet("/IUPResultListServlet")
public class IUPResultListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Competition> competitions = new ArrayList<>();
        List<Result> results = new ArrayList<>();
        Map<Integer, Participant> participants = new HashMap<>();

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

            // Fetch table count (Fixed SQL syntax)
            String sqlTableCount = "SELECT COUNT(*) AS table_count FROM information_schema.tables WHERE table_schema = 'iup_competitions'";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlTableCount)) {
                if (rs.next()) {
                    int tableCount = rs.getInt("table_count");
                    System.out.println("Number of tables in the database: " + tableCount);
                }
            }

            // Fetch results (Removed unnecessary semicolon)
            String sqlResult = "SELECT * FROM results";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlResult)) {
                while (rs.next()) {
                    results.add(new Result(
                            rs.getInt("id"),
                            rs.getInt("competition_id"),
                            rs.getInt("participant_id"),
                            rs.getInt("score")
                    ));
                }
            }

            // Fetch participants with LEFT JOIN (Handle potential nulls for competitionName)
            String sqlParticipant = "SELECT p.id, p.name, p.email, p.phone, p.competition_id, c.name AS competitionName " +
                    "FROM participants p " +
                    "LEFT JOIN competition c ON p.competition_id = c.id";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlParticipant)) {
                while (rs.next()) {
                    participants.put(rs.getInt("id"), new Participant(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("phone"),
                            rs.getInt("competition_id"),
                            rs.getString("competitionName") != null ? rs.getString("competitionName") : "Unknown"
                    ));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error during SQL execution:");
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        // Debugging: Print fetched data
        System.out.println("Competitions: " + competitions.size());
        System.out.println("Results: " + results.size());
        System.out.println("Participants: " + participants.size());

        // Set attributes for the JSP
        request.setAttribute("competitions", competitions);
        request.setAttribute("results", results);
        request.setAttribute("participants", participants);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("IUPResultList.jsp");
        dispatcher.forward(request, response);
    }
}
