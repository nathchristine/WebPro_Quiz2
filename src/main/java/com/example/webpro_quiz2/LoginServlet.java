package com.example.webpro_quiz2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get email and password from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Email and password are required.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Check credentials in the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT id, name FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Login successful
                        int userId = rs.getInt("id");
                        String userName = rs.getString("name");

                        // Create a session and set user attributes
                        HttpSession session = request.getSession();
                        session.setAttribute("userId", userId);
                        session.setAttribute("userName", userName);

                        // Redirect to the dashboard or home page
                        response.sendRedirect(request.getContextPath() + "/dashboard");
                    } else {
                        // Login failed
                        request.setAttribute("error", "Invalid email or password.");
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request. Please try again.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
