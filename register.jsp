<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/register.css">

</head>
<body>

<div class="main-container">

    <div class="form-box">
        <h2>Create Account</h2>
        <p class="subtitle">Start your shopping journey</p>

        <!-- Registration Form -->
        <form action="RegisterServlet" method="post">

            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>

            <input type="submit" value="Register">
        </form>
        
        <!-- Login link -->
        <p class="login-link">Already have an account? 
            <a href="login.jsp">Login</a>
        </p>

    </div>

</div>

</body>
</html>