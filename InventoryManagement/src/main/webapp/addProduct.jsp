<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<script src="js/app.js" defer></script>

<style>
:root {
  --primary-color: #2563eb;
  --primary-dark: #1d4ed8;
  --success-color: #10b981;
  --danger-color: #ef4444;
  --warning-color: #f59e0b;
  --dark-bg: #0f172a;
  --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  --card-shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

body {
  font-family: 'Inter', sans-serif;
  background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
  min-height: 100vh;
  padding-top: 2rem;
  padding-bottom: 3rem;
}

/* Page Header */
.page-header {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #1e293b 100%);
  color: white;
  padding: 2rem;
  border-radius: 20px;
  margin-bottom: 2rem;
  box-shadow: var(--card-shadow-hover);
}

.page-header h2 {
  font-size: 2rem;
  font-weight: 700;
  margin: 0;
}

.page-header p {
  margin: 0.5rem 0 0 0;
  opacity: 0.9;
}

/* Success Message */
.success-alert {
  background: linear-gradient(135deg, var(--success-color) 0%, #059669 100%);
  color: white;
  padding: 1.2rem 1.5rem;
  border-radius: 15px;
  margin-bottom: 2rem;
  box-shadow: var(--card-shadow);
  display: flex;
  align-items: center;
  animation: slideDown 0.4s ease-out;
}

.success-alert i {
  font-size: 1.5rem;
  margin-right: 1rem;
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Form Container */
.form-container {
  background: white;
  border-radius: 20px;
  padding: 2.5rem;
  box-shadow: var(--card-shadow);
  max-width: 800px;
  margin: 0 auto;
}

.product-form .form-label {
  font-weight: 600;
  color: var(--dark-bg);
  margin-bottom: 0.5rem;
  font-size: 0.95rem;
}

.product-form .form-control,
.product-form .form-select {
  border-radius: 10px;
  border: 2px solid #e2e8f0;
  padding: 0.75rem 1rem;
  transition: all 0.3s ease;
  font-size: 0.95rem;
}

.product-form .form-control:focus,
.product-form .form-select:focus {
  border-color: var(--primary-color);
  box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.1);
}

.product-form textarea.form-control {
  min-height: 100px;
  resize: vertical;
}

.input-group-text {
  background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
  border: 2px solid #e2e8f0;
  border-right: none;
  border-radius: 10px 0 0 10px;
  color: var(--primary-color);
}

.input-group .form-control,
.input-group .form-select {
  border-left: none;
  border-radius: 0 10px 10px 0;
}

.input-group .form-control:focus,
.input-group .form-select:focus {
  border-left: 2px solid var(--primary-color);
}

.btn-submit {
  background: linear-gradient(45deg, var(--primary-color), var(--primary-dark));
  color: white;
  border: none;
  border-radius: 12px;
  padding: 0.9rem 2.5rem;
  font-weight: 600;
  font-size: 1rem;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(37, 99, 235, 0.3);
  position: relative;
  overflow: hidden;
}

.btn-submit::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.2);
  transition: left 0.5s ease;
}

.btn-submit:hover::before {
  left: 100%;
}

.btn-submit:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 12px rgba(37, 99, 235, 0.4);
}

.btn-view {
  color: var(--primary-color);
  text-decoration: none;
  font-weight: 600;
  padding: 0.9rem 2rem;
  border: 2px solid var(--primary-color);
  border-radius: 12px;
  display: inline-block;
  transition: all 0.3s ease;
}

.btn-view:hover {
  background: var(--primary-color);
  color: white;
  transform: translateY(-2px);
}

.form-row {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin-bottom: 1.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
}

/* Responsive */
@media (max-width: 768px) {
  .form-container {
    padding: 1.5rem;
  }
  
  .page-header h2 {
    font-size: 1.5rem;
  }
  
  .form-row {
    grid-template-columns: 1fr;
  }
}
</style>

</head>

<body>

<%@include file="/components/adminNavbar.jsp" %>

<div class="container">

<div class="page-header">
  <h2><i class="bi bi-plus-circle-fill me-2"></i>Add New Product</h2>
  <p>Enter product details to add to your inventory</p>
</div>

<%
    String msg = (String) request.getAttribute("SuccessMsg");
    if (msg != null) {
%>
    <div class="success-alert">
      <i class="bi bi-check-circle-fill"></i>
      <span><%= msg %></span>
    </div>
<%
    }
%>

<!-- Form Container -->
<div class="form-container">

<form action="addProduct" method="post" class="product-form">

   <!-- Product Name & Barcode -->
   <div class="form-row">
     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-tag-fill text-primary me-1"></i>Product Name
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-box"></i></span>
         <input type="text" name="name" class="form-control" placeholder="Enter product name" required>
       </div>
     </div>

     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-upc-scan text-primary me-1"></i>Barcode
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-upc"></i></span>
         <input type="text" name="barcode" class="form-control" placeholder="Enter barcode" required>
       </div>
     </div>
   </div>

   <!-- Quantity & Unit -->
   <div class="form-row">
     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-123 text-primary me-1"></i>Quantity
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-hash"></i></span>
         <input type="number" step="0.01" name="quantity" class="form-control" placeholder="Enter quantity" required>
       </div>
     </div>

     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-rulers text-primary me-1"></i>Unit
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-list-ul"></i></span>
         <select name="unit" class="form-select" required>
           <option value="">Select unit</option>
           <option value="pcs">Pieces</option>
           <option value="kg">Kg</option>
           <option value="liter">Liter</option>
           <option value="meter">Meter</option>
           <option value="box">Box</option>
         </select>
       </div>
     </div>
   </div>

   <!-- Price & Category -->
   <div class="form-row">
     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-currency-rupee text-primary me-1"></i>Price (per unit)
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-cash"></i></span>
         <input type="number" step="0.01" name="price" class="form-control" placeholder="Enter price" required>
       </div>
     </div>

     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-grid-3x3-gap-fill text-primary me-1"></i>Category
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-folder"></i></span>
         <input type="text" name="category" class="form-control" placeholder="Enter category" required>
       </div>
     </div>
   </div>

   <!-- Minimum Stock & Expiry Date -->
   <div class="form-row">
     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-exclamation-triangle text-primary me-1"></i>Minimum Stock Level
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-clipboard-data"></i></span>
         <input type="number" step="0.01" name="minStockLevel" class="form-control" placeholder="Enter minimum stock" required>
       </div>
     </div>

     <div class="form-group">
       <label class="form-label">
         <i class="bi bi-calendar-event text-primary me-1"></i>Expiry Date
       </label>
       <div class="input-group">
         <span class="input-group-text"><i class="bi bi-calendar"></i></span>
         <input type="date" name="date" class="form-control" required>
       </div>
     </div>
   </div>

   <div class="form-group">
     <label class="form-label">
       <i class="bi bi-card-text text-primary me-1"></i>Description
     </label>
     <textarea name="description" class="form-control" placeholder="Enter product description (optional)" rows="4"></textarea>
   </div>

   <div class="d-flex gap-3 justify-content-between align-items-center flex-wrap mt-4">
     <a href="viewProducts" class="btn-view">
       <i class="bi bi-eye me-2"></i>View Products
     </a>
     <button type="submit" class="btn-submit">
       <i class="bi bi-check-lg me-2"></i>Save Product
     </button>
   </div>

</form>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>