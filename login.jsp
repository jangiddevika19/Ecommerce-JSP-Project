<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/register.css">

</head>
<body>

<div class="main-container">

    <div class="form-box">
        <h2>Welcome Back</h2>
        <p class="subtitle">Login to continue shopping</p>

        <!-- 🔴 ERROR MESSAGE -->
        <%
            String error = (String) request.getAttribute("error");
            if(error != null){
        %>
            <p class="error-msg"><%= error %></p>
        <%
            }
        %>

        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>

        <!-- Register link -->
        <p class="login-link">
            Don't have an account? <a href="register.jsp">Register</a>
        </p>
    </div>

</div>

</body>
</html>