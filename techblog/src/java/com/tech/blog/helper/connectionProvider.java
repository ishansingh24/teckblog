/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author gauta
 */
public class connectionProvider {

    private static Connection con;

    private connectionProvider() {
    }

    public static Connection getConnection() {
        try {
            if (con == null) {
                // Load the JDBC driver class
                Class.forName("com.mysql.jdbc.Driver");

                // Establish connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "ishan@5701A@");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
