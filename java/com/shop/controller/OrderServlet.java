package com.shop.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import com.shop.util.DBConnection;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");

       
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        try {
            // ✅ DB Connection (IMPORTANT)
            Connection con = DBConnection.getConnection();

            double totalAmount = 0;

            // ✅ 1. Total calculate 
            PreparedStatement ps1 = con.prepareStatement(
                    "SELECT price FROM products WHERE id=?");

            for (int productId : cart) {
                ps1.setInt(1, productId);
                ResultSet rs = ps1.executeQuery();

                if (rs.next()) {
                    totalAmount += rs.getDouble("price");
                }
            }

            // ✅ 2. orders table में insert
            PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO orders(user_id, total_amount) VALUES (?, ?)",
                    Statement.RETURN_GENERATED_KEYS);

            ps2.setInt(1, 1); //
            ps2.setDouble(2, totalAmount);

            ps2.executeUpdate();

            // ✅ 3. orderId 
            ResultSet rs2 = ps2.getGeneratedKeys();
            int orderId = 0;

            if (rs2.next()) {
                orderId = rs2.getInt(1);
            }

            // ✅ 4. order_items में insert
            PreparedStatement ps3 = con.prepareStatement(
                    "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)");

            for (int productId : cart) {

                ps1.setInt(1, productId);
                ResultSet rs = ps1.executeQuery();

                if (rs.next()) {
                    double price = rs.getDouble("price");

                    ps3.setInt(1, orderId);
                    ps3.setInt(2, productId);
                    ps3.setInt(3, 1); // quantity = 1
                    ps3.setDouble(4, price);

                    ps3.executeUpdate();
                }
            }

            // ✅ 5. Cart clear
            session.removeAttribute("cart");

            // ✅ 6. Success page
            System.out.println("Redirecting to success page...");
            response.sendRedirect(request.getContextPath() + "/orderSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
         
        }
    }
}