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

// Servlet to handle participant-related operations
@WebServlet("/IUPParticipantList")
public class IUPParticipantListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Participant> participants = new ArrayList<>();

        // Database connection and query execution
        try (Connection conn = DatabaseConnection.getConnection()) {
            System.out.println("Database connection successful!");

            String sqlQuery = "SELECT p.id AS participant_id, p.name AS participant_name, p.email, p.phone, " +
                    "c.id AS competition_id, c.name AS competition_name " +
                    "FROM participants p " +
                    "LEFT JOIN competition c ON p.competition_id = c.id";

            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlQuery)) {
                while (rs.next()) {
                    participants.add(new Participant(
                            rs.getInt("participant_id"),      // Participant ID
                            rs.getString("participant_name"), // Participant Name
                            rs.getString("email"),            // Email
                            rs.getString("phone"),            // Phone
                            rs.getInt("competition_id"),      // Competition ID
                            rs.getString("competition_name")  // Competition Name
                    ));
                }
            }

        } catch (SQLException e) {
            System.out.println("Error fetching participants from database:");
            e.printStackTrace();
        }

        // Debugging: Print fetched participants
        System.out.println("Participants fetched:");
        for (Participant p : participants) {
            System.out.printf("ID: %d, Name: %s, Email: %s, Competition: %s%n",
                    p.getId(), p.getName(), p.getEmail(), p.getCompetitionName());
        }

        // Set participants as a request attribute and forward to JSP
        request.setAttribute("participants", participants);
        RequestDispatcher dispatcher = request.getRequestDispatcher("IUPParticipantList.jsp");
        dispatcher.forward(request, response);
    }
}
