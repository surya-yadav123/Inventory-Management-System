<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

<script src="js/app.js" defer></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="/components/adminNavbar.jsp" %>
<body>

<%
    String msg = (String) session.getAttribute("SuccessMsg");
    if (msg != null) {
%>
    <p class="success-msg"><%= msg %></p>
<%
        session.removeAttribute("SuccessMsg");
    }
%>

<div class="register-container">
    <h2>Register Here</h2>

    <form action="register" method="post" class="register-form">
        <label>Name</label>
        <input type="text" name="name">

        <label>Email</label>
        <input type="text" name="username">

        <label>Password</label>
        <input type="password" name="password">

        <input type="submit" value="Register" class="btn-register">
    </form><br><br>
    <a  class ="login-links" href="adminDashboard">Back to Dashboard</a>
</div>

</body>

</html>