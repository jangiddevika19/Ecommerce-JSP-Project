package com.shop.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/RemoveServlet")
public class RemoveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");

        if(cart != null){
            cart.remove(Integer.valueOf(productId));
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}