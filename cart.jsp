<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.shop.dao.ProductDAO, com.shop.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cart</title>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/cart.css?v=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">My Shop</div>
    <div class="nav-links">
        <a href="products.jsp"><i class="fa fa-box"></i> Products</a>
        <a href="cart.jsp" class="active"><i class="fa fa-cart-shopping"></i> Cart</a>
        <a href="LogoutServlet"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

<div class="main-container">
    <div class="container">
        <h2>My Cart 🛒</h2>

        <div class="cart-container">
        <%
            List<Integer> cart = (List<Integer>) session.getAttribute("cart");

            if(cart == null || cart.isEmpty()){
        %>
            <p class="empty-msg">Your cart is empty 😢</p>
        <%
            } else {
                ProductDAO dao = new ProductDAO();
                double total = 0;

                for(int id : cart){
                    Product p = dao.getAllProducts().stream()
                        .filter(prod -> prod.getId() == id)
                        .findFirst()
                        .orElse(null);

                    if(p != null){
                        total += p.getPrice();
        %>

            <div class="card">
                <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
                <h3><%= p.getName() %></h3>
                <p>₹ <%= p.getPrice() %></p>

                <form action="RemoveServlet" method="post">
                <input type="hidden" name="productId" value="<%= p.getId() %>">
                <button type="submit" class="btn">Remove ❌</button>
             </form>
            </div>

        <%
                    }
                }
        %>
        </div> <!-- cart-container -->

        <div class="total-box">
            <h3>Total: ₹ <%= total %></h3>
            <form action="checkout.jsp">
                <button type="submit" class="btn">Proceed to Checkout 💳</button>
            </form>
        </div>

        <%
            }
        %>

    </div> <!-- container -->
</div> <!-- main-container -->

</body>
</html>