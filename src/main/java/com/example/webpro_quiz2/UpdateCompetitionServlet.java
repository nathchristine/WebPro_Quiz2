package com.example.webpro_quiz2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Servlet for updating competition details
@WebServlet("/IUPCompeList/Update")
public class UpdateCompetitionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch competition details by ID
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Competition ID is missing.");
            return;
        }

        Competition competition = null;

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM competition WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(id));
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        competition = new Competition(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("description"),
                                rs.getDate("date")
                        );
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error fetching competition details: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching the competition details.");
            return;
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid competition ID.");
            return;
        }

        // Check if competition was found
        if (competition == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Competition not found.");
            return;
        }

        // Set competition as request attribute and forward to JSP
        request.setAttribute("competition", competition);
        request.getRequestDispatcher("/updateCompetition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String date = request.getParameter("date");

        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Competition ID is missing.");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE competition SET name = ?, description = ?, date = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setDate(3, java.sql.Date.valueOf(date));
                stmt.setInt(4, Integer.parseInt(id));

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    // Redirect to the competition list after successful update
                    response.sendRedirect(request.getContextPath() + "/IUPCompeList");
                    return;
                } else {
                    // If no rows were updated, competition ID doesn't exist
                    request.setAttribute("error", "Failed to update competition. Competition not found.");
                    request.getRequestDispatcher("/updateCompetition.jsp").forward(request, response);
                    return;
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error updating competition: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the competition.");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid competition ID.");
        }
    }

}
