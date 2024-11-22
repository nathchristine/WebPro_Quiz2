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

@WebServlet("/IUPCompeList/AddComplete")
public class AddCompetitionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String date = request.getParameter("date");

        System.out.println("Received Data: ");
        System.out.println("Name: " + name);
        System.out.println("Description: " + description);
        System.out.println("Date: " + date);

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO competition (name, description, date) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setString(3, date);
                stmt.executeUpdate();
            }

            response.sendRedirect(request.getContextPath() + "/IUPCompeList");
        } catch (SQLException e) {
            System.out.println("Database error while adding competition:");
            e.printStackTrace();

            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to add competition.");
        }
    }
}
