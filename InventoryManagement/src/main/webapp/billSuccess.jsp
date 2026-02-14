<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="model.Staff" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Generated</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">


<style>
    body {
        background-color: #f4f6f9;
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

<div class="success-card">

    <div class="success-icon">
        <i class="bi bi-check-circle-fill"></i>
    </div>

    <h2>Bill Generated Successfully</h2>

    <p class="info-text"><strong>Bill ID:</strong> ${billId}</p>
    <p class="info-text"><strong>Total Amount:</strong> ₹ ${totalAmount}</p>

    <div class="action-buttons mt-4">
        <a href="billPdf" class="btn btn-primary">
            <i class="bi bi-file-earmark-pdf"></i> Download PDF
        </a>

        <a href="newBill" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Create New Bill
        </a>
    </div>

    <hr>

<%

if (s != null) {
    if ("ADMIN".equals(s.getRole())) {
%>
        <a href="adminDashboard" class="btn btn-outline-secondary mt-2">
            <i class="bi bi-speedometer2"></i> Back to Dashboard
        </a>
<%
    } else {
%>
        <a href="dashboard.jsp" class="btn btn-outline-secondary mt-2">
            <i class="bi bi-speedometer2"></i> Back to Dashboard
        </a>
<%
    }
}
%>

</div>

</body>
</html>
