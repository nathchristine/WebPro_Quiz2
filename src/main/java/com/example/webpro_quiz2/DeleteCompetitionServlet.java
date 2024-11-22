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

// Servlet to handle deleting a competition
@WebServlet("/IUPCompeList/Delete")
public class DeleteCompetitionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the competition ID from the request
        String id = request.getParameter("id");

        // Validate ID format
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Competition ID is missing.");
            return;
        }

        int competitionId;
        try {
            competitionId = Integer.parseInt(id); // Parse ID as an integer
        } catch (NumberFormatException e) {
            System.out.println("Invalid competition ID format: " + id);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid competition ID format.");
            return;
        }

        // Debugging: Print the ID to be deleted
        System.out.println("Competition ID to delete: " + competitionId);

        // Database deletion
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM competition WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, competitionId); // Set the integer ID
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Competition with ID " + competitionId + " deleted successfully.");
                } else {
                    System.out.println("No competition found with ID " + competitionId);
                }
            }

            // Redirect back to the competition list
            response.sendRedirect(request.getContextPath() + "/IUPCompeList");
        } catch (SQLException e) {
            System.out.println("Database error while deleting competition:");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to delete competition.");
        }
    }
}
