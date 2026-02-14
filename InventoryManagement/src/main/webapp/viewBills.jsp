<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Bill,java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    rel="stylesheet">

<meta charset="UTF-8">
<title>Bills</title>
</head>

<%@include file="/components/adminNavbar.jsp" %>
<body class="bg-light">

<%
    List<Bill> bills = (List<Bill>) request.getAttribute("allBills");
%>

<div class="container mt-4">

    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">!! Bills !!</h4>
        </div>

        <div class="card-body">

            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Bill ID</th>
                        <th>Bill Date</th>
                        <th>Products</th>
                        <th>Total Amount</th>
                        <th>Payment Method</th>
                        <th>Staff ID</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (bills != null && !bills.isEmpty()) {
                        for (Bill bill : bills) {
                %>
                    <tr>
                        <td><%= bill.getBill_id() %></td>
                        <td><%= bill.getBill_date() %></td>
                        <td>
                            <a href="viewBillProducts?billId=<%= bill.getBill_id() %>"
                               class="btn btn-sm btn-outline-primary">
                               View Products
                            </a>
                        </td>
                        <td>₹ <%= bill.getTotal_amount() %></td>
                        <td><%= bill.getPayment_method() %></td>
                        <td><%= bill.getStaff_id() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-muted">
                            No bills available
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>

        </div>
    </div>

</div>

</body>
</html>
