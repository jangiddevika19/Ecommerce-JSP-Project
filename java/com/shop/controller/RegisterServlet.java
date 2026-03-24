package com.shop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;

import com.shop.model.User;
import com.shop.dao.UserDAO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Model object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        // DAO call
        UserDAO dao = new UserDAO();
        boolean status = dao.registerUser(user);

        if (status) {
//            response.getWriter().println("Registered Successfully!");
        	response.sendRedirect("login.jsp?msg=registered");
        } else {
            response.getWriter().println("Error in Registration!");
        }
    }
}