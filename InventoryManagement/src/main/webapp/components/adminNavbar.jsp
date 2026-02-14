<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.Staff" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Staff staff=(Staff)session.getAttribute("staff"); %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <i class="bi bi-shop me-2"></i>
      Inventory
    </a>

    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="adminDashboard">Dashboard</a>
        </li>
                <li class="nav-item">
          <a class="nav-link active" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="viewProducts">Products</a>
        </li>

      </ul>

<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
  <li class="nav-item d-flex align-items-center me-3 text-white">
    Welcome, <strong class="ms-1"><%= staff.getName() %></strong>
  </li>
  <li class="nav-item">
    <a class="btn btn-danger" href="<%= request.getContextPath() %>/logout">
      Logout
    </a>
  </li>
</ul>


     
    </div>
  </div>
</nav>
</body>
</html>