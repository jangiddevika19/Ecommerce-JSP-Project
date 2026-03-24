<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>

    <!-- CSS link -->
    <link rel="stylesheet" href="css/profile.css">
</head>

<body>

<div class="main-container">
    <div class="profile-box">

        <h2>👤 User Profile</h2>

        <p><strong>Name:</strong> <%= session.getAttribute("username") %></p>
        <p><strong>Email:</strong> <%= session.getAttribute("useremail") %></p>

        <a href="dashboard.jsp" class="btn">⬅ Back to Dashboard</a>

    </div>
</div>

</body>
</html>