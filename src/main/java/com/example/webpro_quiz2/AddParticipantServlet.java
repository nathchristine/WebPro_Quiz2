package com.example.webpro_quiz2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/IUPParticipantList/AddComplete")
public class AddParticipantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String competitionId = request.getParameter("competition_id");

        // Validate inputs (add more validation as needed)
        if (id == null || name == null || email == null || phone == null || competitionId == null ||
                id.isEmpty() || name.isEmpty() || email.isEmpty() || phone.isEmpty() || competitionId.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/addParticipant.jsp").forward(request, response);
            return;
        }

        // Save the participant in the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO participants (id, name, email, phone, competition_id) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, id);
                stmt.setString(2, name);
                stmt.setString(3, email);
                stmt.setString(4, phone);
                stmt.setInt(5, Integer.parseInt(competitionId));

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    // Redirect to the participant list with a success message
                    request.getSession().setAttribute("success", "Participant added successfully.");
                    response.sendRedirect(request.getContextPath() + "/IUPParticipantList");
                } else {
                    // Forward back with an error message
                    request.setAttribute("error", "Failed to add participant. Please try again.");
                    request.getRequestDispatcher("/addParticipant.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred. Please try again.");
            request.getRequestDispatcher("/addParticipant.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid competition ID.");
            request.getRequestDispatcher("/addParticipant.jsp").forward(request, response);
        }
    }
}
