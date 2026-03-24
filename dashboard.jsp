<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
    }
    com.shop.model.User user = (com.shop.model.User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
   <link rel="stylesheet" href="css/dashboard.css?v=1">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="main-container">

    <!-- HEADER -->
    <div class="header">
        <div class="logo">MyShop</div>
        <div class="nav-links">
            <a href="dashboard.jsp" class="active">Home</a>
            <a href="products.jsp">Products</a>
            <a href="cart.jsp">Cart</a>
            <a href="LogoutServlet" class="btn logout-btn">Logout</a>
        </div>
    </div>

    <!-- DASHBOARD WELCOME -->
    <div class="container">
        <h1 class="welcome">Welcome, <span><%= user.getName() %></span> 👋</h1>
        <p class="subtitle">Explore your Dashboard and manage your shopping easily</p>

        <div class="card-container">

            <!-- SHOP CARD -->
            <div class="card">
                <h3>🛒 Shop Products</h3>
                <p>Explore and buy amazing products with exciting offers.</p>
                <a href="products.jsp" class="btn">View Products</a>
            </div>

            <!-- CART CARD -->
            <div class="card">
                <h3>📦 Your Cart</h3>
                <p>Check items in your cart and proceed to checkout.</p>
                <a href="cart.jsp" class="btn">Go to Cart</a>
            </div>

            <!-- PROFILE CARD -->
            <div class="card">
                <h3>👤 Profile</h3>
                <p>Manage your account details and settings.</p>
                <a href="profile.jsp" class="btn">View Profile</a>
            </div>

        </div>
    </div>

</div>

</body>
</html>