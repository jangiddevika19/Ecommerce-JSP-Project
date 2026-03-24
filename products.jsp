<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.shop.dao.ProductDAO, com.shop.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Products</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/products.css?v=999">

</head>

<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">My Shop</div>

    <div class="nav-links">
    <a href="dashboard.jsp"><i class="fa fa-home"></i> Home</a>
    <a href="cart.jsp"><i class="fa fa-cart-shopping"></i> Cart</a>
    <a href="LogoutServlet"><i class="fa fa-sign-out-alt"></i> Logout</a>
</div>
</div>

<!-- MAIN -->
<div class="main-container">
    <div class="container">
        <h2>All Products</h2>

        <div class="products-grid">
            <%
                ProductDAO dao = new ProductDAO();
                List<Product> list = dao.getAllProducts();

                for(Product p : list){
            %>

            <div class="card">
                <img src="images/<%= p.getImage() %>">

                <h3><%= p.getName() %></h3>
                <p>₹ <%= p.getPrice() %></p>

                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= p.getId() %>">
                    <button type="submit" class="btn">Add to Cart</button>
                </form>
            </div>

            <%
                }
            %>
        </div>
    </div>
</div>

</body>
</html>