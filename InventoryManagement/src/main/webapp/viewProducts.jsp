<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Product" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory</title>

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
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 1rem;
}

.page-header h2 {
  font-size: 2rem;
  font-weight: 700;
  margin: 0;
}

.page-header .header-info {
  display: flex;
  gap: 2rem;
  align-items: center;
}

.page-header .stat-badge {
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(10px);
  padding: 0.5rem 1.2rem;
  border-radius: 50px;
  font-weight: 600;
}

/* Search Form Styling */
.search-form {
  position: relative;
  min-width: 300px;
}

.search-form input {
  border-radius: 50px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  color: white;
  padding: 0.75rem 1.5rem;
  padding-right: 3rem;
}

.search-form input::placeholder {
  color: rgba(255, 255, 255, 0.7);
}

.search-form input:focus {
  background: rgba(255, 255, 255, 0.2);
  border-color: var(--primary-color);
  box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
  color: white;
  outline: none;
}

.search-form .search-icon {
  position: absolute;
  right: 1.2rem;
  top: 50%;
  transform: translateY(-50%);
  color: rgba(255, 255, 255, 0.7);
  pointer-events: none;
}

/* No Results Message */
.no-results {
  text-align: center;
  padding: 3rem 2rem;
  background: white;
  border-radius: 20px;
  box-shadow: var(--card-shadow);
  display: none;
}

.no-results i {
  font-size: 4rem;
  color: #cbd5e1;
  margin-bottom: 1rem;
}

.no-results h4 {
  color: var(--dark-bg);
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.no-results p {
  color: #64748b;
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

/* Product Card */
.product-card {
  background: white;
  border: none;
  border-radius: 15px;
  padding: 1.5rem;
  margin-bottom: 1rem;
  box-shadow: var(--card-shadow);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.product-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 4px;
  height: 100%;
  background: linear-gradient(180deg, var(--primary-color) 0%, var(--success-color) 100%);
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: var(--card-shadow-hover);
}

.product-card .card-body {
  padding: 0;
}

.product-header {
  display: flex;
  justify-content: space-between;
  align-items: start;
  margin-bottom: 1rem;
  padding-bottom: 1rem;
  border-bottom: 2px solid #f1f5f9;
}

.product-title {
  font-size: 1.3rem;
  font-weight: 700;
  color: var(--dark-bg);
  margin: 0;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.product-id-badge {
  background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
  color: white;
  padding: 0.25rem 0.75rem;
  border-radius: 50px;
  font-size: 0.75rem;
  font-weight: 600;
}

.product-info {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.info-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem;
  background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
  border-radius: 10px;
}

.info-item i {
  color: var(--primary-color);
  font-size: 1.1rem;
}

.info-item .label {
  font-weight: 600;
  color: var(--dark-bg);
  font-size: 0.85rem;
}

.info-item .value {
  color: #475569;
  font-weight: 500;
}

/* Stock Status Badge */
.stock-status {
  position: absolute;
  top: 1rem;
  right: 1rem;
  padding: 0.4rem 1rem;
  border-radius: 50px;
  font-size: 0.75rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.stock-status.low {
  background: linear-gradient(135deg, var(--danger-color) 0%, #dc2626 100%);
  color: white;
}

.stock-status.normal {
  background: linear-gradient(135deg, var(--success-color) 0%, #059669 100%);
  color: white;
}

/* Action Buttons */
.action-buttons {
  display: flex;
  gap: 0.75rem;
  margin-top: 1rem;
}

.btn-action {
  border-radius: 10px;
  padding: 0.6rem 1.5rem;
  font-weight: 600;
  font-size: 0.9rem;
  border: none;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.btn-action:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.btn-edit {
  background: linear-gradient(45deg, var(--warning-color), #d97706);
  color: white;
}

.btn-delete {
  background: linear-gradient(45deg, var(--danger-color), #dc2626);
  color: white;
}

/* Empty State */
.empty-state {
  text-align: center;
  padding: 4rem 2rem;
  background: white;
  border-radius: 20px;
  box-shadow: var(--card-shadow);
}

.empty-state i {
  font-size: 5rem;
  color: #cbd5e1;
  margin-bottom: 1.5rem;
}

.empty-state h4 {
  color: var(--dark-bg);
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.empty-state p {
  color: #64748b;
  margin-bottom: 2rem;
}

.btn-add-product {
  background: linear-gradient(45deg, var(--primary-color), var(--primary-dark));
  color: white;
  border: none;
  padding: 0.9rem 2rem;
  border-radius: 12px;
  font-weight: 600;
  transition: all 0.3s ease;
  text-decoration: none;
  display: inline-block;
}

.btn-add-product:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 12px rgba(37, 99, 235, 0.4);
  color: white;
}

/* Responsive */
@media (max-width: 768px) {
  .page-header {
    text-align: center;
  }
  
  .page-header h2 {
    font-size: 1.5rem;
  }
  
  .search-form {
    min-width: 100%;
  }
  
  .product-info {
    grid-template-columns: 1fr;
  }
  
  .action-buttons {
    flex-direction: column;
  }
  
  .btn-action {
    width: 100%;
    justify-content: center;
  }
}

/* Animation */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.product-card {
  animation: fadeInUp 0.4s ease-out;
}
</style>

</head>

<body>

<%@include file="/components/adminNavbar.jsp" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    int totalProducts = products != null ? products.size() : 0;
%>

<div class="container mt-4">

<!-- Page Header -->
<div class="page-header">
  <div>
    <h2><i class="bi bi-box-seam me-2"></i>Inventory List</h2>
  </div>
  <div class="header-info">
    <div class="stat-badge">
      <i class="bi bi-boxes me-2"></i><span id="productCount"><%= totalProducts %></span> Products
    </div>
    <div class="search-form">
      <input 
        type="text" 
        id="searchInput" 
        class="form-control" 
        placeholder="Search by name, category, barcode..."
        autocomplete="off"
      >
      <i class="bi bi-search search-icon"></i>
    </div>
  </div>
</div>

<!-- Success Messages -->
<%
    String successMsg1 = (String) request.getAttribute("SuccessMsg");
    String successMsg2 = (String) request.getAttribute("successMsg");
    if (successMsg1 != null || successMsg2 != null) {
%>
    <div class="success-alert">
      <i class="bi bi-check-circle-fill"></i>
      <span><%= successMsg1 != null ? successMsg1 : successMsg2 %></span>
    </div>
<%
    }
%>

<!-- No Results Message -->
<div class="no-results" id="noResults">
  <i class="bi bi-search"></i>
  <h4>No Products Found</h4>
  <p>No products match your search criteria. Try a different keyword.</p>
</div>

<!-- Products Grid -->
<div class="row" id="productsContainer">

<%
    if (products != null && !products.isEmpty()) {
        for (Product p : products) {
            boolean isLowStock = p.getQuantity() <= p.getMinStockLevel();
%>

<div class="col-12 product-item" 
     data-name="<%= p.getName() != null ? p.getName().toLowerCase() : "" %>"
     data-category="<%= p.getCategory() != null ? p.getCategory().toLowerCase() : "" %>"
     data-barcode="<%= p.getBarcode() != null ? p.getBarcode().toLowerCase() : "" %>"
     data-id="<%= p.getProduct_id() %>">
  <div class="product-card">
    
    <!-- Stock Status Badge -->
    <span class="stock-status <%= isLowStock ? "low" : "normal" %>">
      <%= isLowStock ? "Low Stock" : "In Stock" %>
    </span>
    
    <div class="card-body">
      
      <!-- Product Header -->
      <div class="product-header">
        <div>
          <h3 class="product-title">
            <i class="bi bi-box text-primary"></i>
            <%= p.getName() %>
          </h3>
          <span class="product-id-badge">ID: <%= p.getProduct_id() %></span>
        </div>
      </div>

      <!-- Product Info Grid -->
      <div class="product-info">
        
        <div class="info-item">
          <i class="bi bi-hash"></i>
          <div>
            <div class="label">Quantity</div>
            <div class="value"><%= p.getQuantity() %> <%= p.getUnit() %></div>
          </div>
        </div>

        <div class="info-item">
          <i class="bi bi-currency-rupee"></i>
          <div>
            <div class="label">Price</div>
            <div class="value">₹<%= p.getPrice() %> per <%= p.getUnit() %></div>
          </div>
        </div>

        <div class="info-item">
          <i class="bi bi-folder"></i>
          <div>
            <div class="label">Category</div>
            <div class="value"><%= p.getCategory() != null ? p.getCategory() : "N/A" %></div>
          </div>
        </div>

        <div class="info-item">
          <i class="bi bi-exclamation-triangle"></i>
          <div>
            <div class="label">Min Stock</div>
            <div class="value"><%= p.getMinStockLevel() %> <%= p.getUnit() %></div>
          </div>
        </div>

        <div class="info-item">
          <i class="bi bi-upc-scan"></i>
          <div>
            <div class="label">Barcode</div>
            <div class="value"><%= p.getBarcode() != null ? p.getBarcode() : "N/A" %></div>
          </div>
        </div>

      </div>

      <% if(staff.getRole().equals("ADMIN")) {%>
      <div class="action-buttons">
        <a href="editProduct?id=<%=p.getProduct_id()%>" class="btn btn-action btn-edit">
          <i class="bi bi-pencil-square"></i>Edit Product
        </a>

        <a href="deleteProduct?id=<%=p.getProduct_id()%>" 
           class="btn btn-action btn-delete"
           onclick="return confirm('Are you sure you want to delete this product?');">
          <i class="bi bi-trash"></i>Delete Product
        </a>
      </div>
      <%} %>

    </div>
  </div>
</div>

<%
        }
    } else {
%>

<!-- Empty State -->
<div class="col-12">
  <div class="empty-state">
    <i class="bi bi-inbox"></i>
    <h4>No Products Found</h4>
    <p>Your inventory is empty. Start by adding your first product.</p>
    <a href="addProduct.jsp" class="btn-add-product">
      <i class="bi bi-plus-circle me-2"></i>Add Product
    </a>
  </div>
</div>

<%
    }
%>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Product Search Functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const productItems = document.querySelectorAll('.product-item');
    const noResults = document.getElementById('noResults');
    const productCount = document.getElementById('productCount');
    const totalProducts = <%= totalProducts %>;

    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase().trim();
            let visibleCount = 0;

            productItems.forEach(item => {
                const name = item.getAttribute('data-name');
                const category = item.getAttribute('data-category');
                const barcode = item.getAttribute('data-barcode');
                const id = item.getAttribute('data-id');

                // Check if search term matches any field
                const matches = name.includes(searchTerm) || 
                               category.includes(searchTerm) || 
                               barcode.includes(searchTerm) ||
                               id.includes(searchTerm);

                if (matches) {
                    item.style.display = 'block';
                    visibleCount++;
                } else {
                    item.style.display = 'none';
                }
            });

            // Update product count
            productCount.textContent = visibleCount;

            // Show/hide no results message
            if (visibleCount === 0 && searchTerm !== '') {
                noResults.style.display = 'block';
            } else {
                noResults.style.display = 'none';
            }
        });

        // Clear search on Escape key
        searchInput.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                this.value = '';
                this.dispatchEvent(new Event('input'));
                this.blur();
            }
        });
    }
});
</script>

</body>
</html>
