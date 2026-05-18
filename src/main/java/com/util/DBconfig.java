package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Utility class to configure database connection
 * Uses jdbc driver to make the connection with mySQL
 * **/
public class DBconfig {
    private static final String URL = "jdbc:mysql://localhost:3306/mmp_db";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    /**
     * Establishes a connection to the database.
     *
     * Loads the MySQL JDBC driver and tries to connect using the defined
     * URL, username, and password.
     *
     * @return Connection object and connected if successful, null and failed message if unsuccessful
     * */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println(" Connected to DB");
        } catch (Exception e) {
            System.out.println(" DB Connection Failed");
            e.printStackTrace();
        }
        return conn;
        }
}
