package com.shop.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static void main(String[] args) {
	    getConnection();
	}

    public static Connection getConnection() {

        Connection con = null;

        try {
            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to Database
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/shopping_cart",
                    "root",
                    "Devikaa@@19_09_"); 

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}