<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.Staff"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/app.js" defer></script>

</head>
<body>
<%
Staff staff=(Staff) session.getAttribute("staff");
if(staff==null){
	response.sendRedirect("login.jsp");
	return;
}
%>
	<h1>!!!Welcome  (<%=staff.getName() %>)</h1>
	 <a href="register.jsp">Register a new staff</a><br>
	<a href="getBill">See Bills</a><br>
<a href="addProduct.jsp">Add Product</a> <br>
<a href="viewProducts">View Products</a> <br>
<a href="billing"> Billing</a><br>
<a href="logout">Logout</a><br>
</body>
</html>