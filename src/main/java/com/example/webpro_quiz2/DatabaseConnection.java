package com.example.webpro_quiz2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/iup_competition";
    private static final String dbUser = "root";
    private static final String dbPassword = "root";

    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL JDBC Driver 
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    }
}


