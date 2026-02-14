<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<script src="js/app.js" defer></script>

<meta charset="UTF-8">
<title>Edit Product</title>
</head>
<%@include file="/components/adminNavbar.jsp"%>
<body>

<p style="color:green">${successMsg}</p>

<%
    Product product = (Product) request.getAttribute("product");
%>

<div class="register-container">
<form method="post" action="update" class="register-form">
   <h2>Edit Product Form</h2>

   <input type="hidden" name="id" value="<%= product.getProduct_id() %>">

   <label>Name:</label>
   <input type="text" name="name" value="<%= product.getName() %>" required>

   <label>Quantity:</label>
   <input type="number" step="0.01" name="quantity"
          value="<%= product.getQuantity() %>" required>

   <label>Unit:</label>
   <input type="text" name="unit"
          value="<%= product.getUnit() %>" required>

   <label>Price:</label>
   <input type="number" step="0.01" name="price"
          value="<%= product.getPrice() %>" required>

   <label>Category:</label>
   <input type="text" name="category"
          value="<%= product.getCategory() %>" required>

   <label>Description:</label>
   <textarea name="description"><%= product.getDescription() %></textarea>

   <label>Minimum Stock Level:</label>
   <input type="number" step="0.01" name="minStockLevel"
          value="<%= product.getMinStockLevel() %>" required>
          <label>Barcode:</label>
   <input type="text" name="barcode"
          value="<%= product.getBarcode() %>" required>

   <br>
   <input type="submit" value="Update" class="btn-register">
</form>
</div>

</body>
</html>
