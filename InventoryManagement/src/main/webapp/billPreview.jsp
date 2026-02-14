<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Preview</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

<style>
    body {
        background-color: #f4f6f9;
    }

   

    table th {
        background-color: #0d6efd;
        color: #fff;
        text-align: center;
    }

    table td {
        vertical-align: middle;
    }

    .total-box {
        text-align: right;
        margin-top: 20px;
        font-size: 18px;
        font-weight: 600;
    }

    .action-buttons {
        margin-top: 30px;
        display: flex;
        justify-content: space-between;
    }
</style>
</head>
<%
Staff s = (Staff) session.getAttribute("staff");
%>
<%

if (s != null) {
    if ("ADMIN".equals(s.getRole())) {
%>
       <%@ include file="/components/adminNavbar.jsp" %>
<%
    } else {
%>
        <%@ include file="/components/navbar.jsp" %>
<%
    }
}
%>
<body>

<div class="invoice-card">

    <div class="invoice-header">
        <h2>INVOICE</h2>
        <p>Inventory Management System</p>
    </div>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price (₹)</th>
                <th>Total (₹)</th>
            </tr>
        </thead>
        <tbody>

<%
Map<Integer, CartItem> cart =
    (Map<Integer, CartItem>) session.getAttribute("cart");

Double grandTotalObj =
    (Double) session.getAttribute("grandTotal");

double grandTotal = (grandTotalObj != null) ? grandTotalObj : 0;

for (CartItem item : cart.values()) {
%>
            <tr>
                <td><%= item.getName() %></td>
                <td class="text-center"><%= item.getQuantity() %></td>
                <td class="text-end"><%= item.getPrice() %></td>
                <td class="text-end"><%= item.getTotal() %></td>
            </tr>
<%
}
%>
        </tbody>
    </table>

    <div class="total-box">
        Grand Total: ₹ <%= grandTotal %>
    </div>

    <hr>

    <div class="action-buttons">
        <form action="newBill">
            <button type="submit" class="btn btn-secondary">
                ⬅ Back to Billing
            </button>
        </form>

        <form action="saveBill">
            <button type="submit" class="btn btn-success">
                Save & Print Bill
            </button>
        </form>
    </div>

</div>

</body>
</html>
