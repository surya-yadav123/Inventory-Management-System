<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    rel="stylesheet">

<meta charset="UTF-8">
<title>Bill Products</title>
</head>

<%@include file="/components/adminNavbar.jsp" %>

<body class="bg-light">

<%
    List<String> items = (List<String>) request.getAttribute("items");
%>

<div class="container mt-4">

    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"> Bill Products</h4>
        </div>

        <div class="card-body">

            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Sr. No</th>
                        <th>Product Details</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (items != null && !items.isEmpty()) {
                        int i = 1;
                        for (String s : items) {
                %>
                    <tr>
                        <td><%= i++ %></td>
                        <td class="text-start"><%= s %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="2" class="text-muted">
                            No products found for this bill
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>

            <div class="text-end">
                <a href="<%= request.getContextPath() %>/getBill" class="btn btn-primary">
                    <- Back to Bills
                </a>
            </div>

        </div>
    </div>

</div>

</body>
</html>
