package com.shop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.shop.dao.UserDAO;
import com.shop.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, password);
        
        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);  
            session.setAttribute("username", user.getName());
            session.setAttribute("useremail", user.getEmail());

            response.sendRedirect("dashboard.jsp");

        } else {
        	request.setAttribute("error", "Invalid Email or Password!");
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        }


  }
}