<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="model.CartItem" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billing</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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
  text-align: center;
}

.page-header h2 {
  font-size: 2.5rem;
  font-weight: 700;
  margin: 0;
}

.page-header p {
  margin: 0.5rem 0 0 0;
  opacity: 0.9;
  font-size: 1.1rem;
}

/* Section Headers */
.section-header {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 1.5rem;
  padding-bottom: 0.75rem;
  border-bottom: 3px solid var(--primary-color);
}

.section-header h4 {
  font-weight: 700;
  color: var(--dark-bg);
  margin: 0;
  font-size: 1.4rem;
}

.section-header i {
  font-size: 1.5rem;
  color: var(--primary-color);
}

/* Product Card */
.product-card {
  background: white;
  border: none;
  border-radius: 15px;
  padding: 1.5rem;
  box-shadow: var(--card-shadow);
  transition: all 0.3s ease;
  height: 100%;
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

.product-card h5 {
  font-weight: 700;
  color: var(--dark-bg);
  margin-bottom: 1rem;
  font-size: 1.2rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.product-info {
  margin-bottom: 1rem;
}

.product-info p {
  margin: 0.5rem 0;
  color: #475569;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.product-info .price {
  color: var(--success-color);
  font-weight: 700;
  font-size: 1.1rem;
}

.stock-badge {
  display: inline-block;
  padding: 0.25rem 0.75rem;
  border-radius: 50px;
  font-size: 0.85rem;
  font-weight: 600;
}

.stock-badge.in-stock {
  background: linear-gradient(135deg, var(--success-color) 0%, #059669 100%);
  color: white;
}

.stock-badge.low-stock {
  background: linear-gradient(135deg, var(--warning-color) 0%, #d97706 100%);
  color: white;
}

.stock-badge.out-of-stock {
  background: linear-gradient(135deg, var(--danger-color) 0%, #dc2626 100%);
  color: white;
}

.btn-add {
  background: linear-gradient(45deg, var(--primary-color), var(--primary-dark));
  color: white;
  border: none;
  border-radius: 10px;
  padding: 0.75rem;
  font-weight: 600;
  transition: all 0.3s ease;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
}

.btn-add:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
  color: white;
}

.btn-add:disabled {
  background: linear-gradient(45deg, #94a3b8, #64748b);
  cursor: not-allowed;
  opacity: 0.6;
}

/* Cart Box */
.cart-box {
  background: white;
  border-radius: 20px;
  box-shadow: var(--card-shadow-hover);
  padding: 2rem;
  position: sticky;
  top: 2rem;
}

.cart-table {
  margin-bottom: 1.5rem;
}

.cart-table table {
  border-radius: 12px;
  overflow: hidden;
}

.cart-table thead {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #1e293b 100%);
  color: white;
}

.cart-table thead th {
  border: none;
  padding: 1rem;
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.85rem;
  letter-spacing: 0.5px;
}

.cart-table tbody td {
  padding: 1rem;
  vertical-align: middle;
  border-color: #e2e8f0;
}

.cart-table tbody tr:hover {
  background: #f8fafc;
}

.btn-remove {
  background: linear-gradient(45deg, var(--danger-color), #dc2626);
  color: white;
  border: none;
  border-radius: 8px;
  padding: 0.4rem 1rem;
  font-weight: 600;
  font-size: 0.85rem;
  transition: all 0.3s ease;
}

.btn-remove:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 8px rgba(239, 68, 68, 0.3);
}

.empty-cart {
  text-align: center;
  padding: 3rem 1rem;
  color: #94a3b8;
}

.empty-cart i {
  font-size: 4rem;
  margin-bottom: 1rem;
  opacity: 0.5;
}

.grand-total {
  background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
  padding: 1.5rem;
  border-radius: 12px;
  margin-bottom: 1.5rem;
}

.grand-total h5 {
  margin: 0;
  font-weight: 700;
  color: var(--dark-bg);
  font-size: 1.5rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.grand-total .amount {
  color: var(--success-color);
}

.btn-generate {
  background: linear-gradient(45deg, var(--success-color), #059669);
  color: white;
  border: none;
  border-radius: 12px;
  padding: 1rem 2rem;
  font-weight: 700;
  font-size: 1.1rem;
  transition: all 0.3s ease;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.btn-generate:hover:not(:disabled) {
  transform: translateY(-3px);
  box-shadow: 0 8px 16px rgba(16, 185, 129, 0.4);
}

.btn-generate:disabled {
  background: linear-gradient(45deg, #94a3b8, #64748b);
  cursor: not-allowed;
  opacity: 0.6;
}

/* Animations */
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

/* Responsive */
@media (max-width: 768px) {
  .page-header h2 {
    font-size: 1.8rem;
  }
  
  .cart-box {
    position: static;
    margin-top: 2rem;
  }
  
  .cart-table {
    overflow-x: auto;
  }
  
  .cart-table table {
    font-size: 0.85rem;
  }
  
  .cart-table thead th,
  .cart-table tbody td {
    padding: 0.75rem 0.5rem;
  }
}
</style>

</head>

<body>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    int totalProducts = products != null ? products.size() : 0;
%>

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

<%
Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
%>

<div class="container">

<!-- Page Header -->
<div class="page-header">
  <h2><i class="bi bi-receipt me-3"></i>Billing System</h2>
  <p>Add products to cart and generate invoice</p>
  <div class="search-form">
      <input 
        type="text" 
        id="searchInput" 
        class="form-control" 
        placeholder="Search by name, category, barcode..."
        autocomplete="off"
      >
      
    </div>
</div>

<div class="row">
    <!-- Products Section -->
    <div class="col-lg-7 mb-4">
        <div class="section-header">
          <i class="bi bi-shop"></i>
          <h4>Available Products</h4>
        </div>

        <div class="row g-3">
            <%
               
                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
                        double availableStock = p.getQuantity();

                        if (cart != null && cart.containsKey(p.getProduct_id())) {
                            availableStock -= cart.get(p.getProduct_id()).getQuantity();
                        }
                        
                        String stockClass = "";
                        String stockText = "";
                        if (availableStock <= 0) {
                            stockClass = "out-of-stock";
                            stockText = "Out of Stock";
                        } else if (availableStock <= p.getMinStockLevel()) {
                            stockClass = "low-stock";
                            stockText = "Low: " + availableStock + " " + p.getUnit();
                        } else {
                            stockClass = "in-stock";
                            stockText = availableStock + " " + p.getUnit();
                        }
            %>
            <div class="col-md-6 product-item"
     data-name="<%= p.getName().toLowerCase() %>"
     data-category="<%= p.getCategory() %>"
     data-barcode="<%= p.getBarcode() %>"
     data-id="<%= p.getProduct_id() %>">

                <div class="card product-card">
                    <h5>
                        <i class="bi bi-box text-primary"></i>
                        <%= p.getName() %>
                    </h5>
                    
                    <div class="product-info">
                        <p class="price">
                            <i class="bi bi-currency-rupee"></i>
                            ₹ <%= p.getPrice() %> <small>per <%= p.getUnit() %></small>
                        </p>
                        <p>
                            <i class="bi bi-archive"></i>
                            <span class="stock-badge <%= stockClass %>"><%= stockText %></span>
                        </p>
                    </div>

                    <form action="addToCart" method="post">
                        <input type="hidden" name="productId" value="<%= p.getProduct_id() %>">
                        <input type="hidden" name="qty" value="1">
                        <button class="btn btn-add" <%= (availableStock <= 0) ? "disabled" : "" %>>
                            <i class="bi bi-cart-plus"></i>
                            <%= (availableStock <= 0) ? "Out of Stock" : "Add to Cart" %>
                        </button>
                    </form>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="col-12">
                <div class="empty-cart">
                    <i class="bi bi-inbox"></i>
                    <h5>No Products Available</h5>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- Cart Section -->
    <div class="col-lg-5">
        <div class="section-header">
          <i class="bi bi-cart3"></i>
          <h4>Shopping Cart</h4>
        </div>

        <div class="cart-box">
            <div class="cart-table">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Qty</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            double grandTotal = 0;

                            if (cart != null && !cart.isEmpty()) {
                                for (CartItem item : cart.values()) {
                                    grandTotal += item.getTotal();
                        %>
                        <tr>
                            <td><strong><%= item.getName() %></strong></td>
                            <td><%= item.getQuantity() %></td>
                            <td>₹ <%= item.getPrice() %></td>
                            <td><strong>₹ <%= item.getTotal() %></strong></td>
                            <td>
                                <form action="removeFromCart" method="post" style="display:inline;">
                                    <input type="hidden" name="productId" value="<%= item.getProductId() %>">
                                    <button class="btn btn-remove">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-4">
                                <div class="empty-cart">
                                    <i class="bi bi-cart-x"></i>
                                    <p class="mb-0">Your cart is empty</p>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <div class="grand-total">
                <h5>
                    <span>Grand Total:</span>
                    <span class="amount">₹ <%= String.format("%.2f", grandTotal) %></span>
                </h5>
            </div>

            <form action="generateBill">
                <button class="btn btn-generate" <%= (cart == null || cart.isEmpty()) ? "disabled" : "" %>>
                    <i class="bi bi-file-earmark-text"></i>
                    Generate Bill
                </button>
            </form>
        </div>
    </div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
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