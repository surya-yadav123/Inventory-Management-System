package servlet;

import java.io.IOException;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.Staff;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Staff staff = (Staff) session.getAttribute("staff");

        String name = request.getParameter("name");
        double quantity = Double.parseDouble(request.getParameter("quantity"));
        String unit = request.getParameter("unit");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double minStockLevel = Double.parseDouble(request.getParameter("minStockLevel"));
        java.sql.Date date = java.sql.Date.valueOf(request.getParameter("date"));
        String barcode=request.getParameter("barcode");

        Product product = new Product();
        product.setName(name);
        product.setQuantity(quantity);
        product.setUnit(unit);
        product.setPrice(price);
        product.setCategory(category);
        product.setDescription(description);
        product.setMinStockLevel(minStockLevel);
        product.setDate(date);
        product.setBarcode(barcode);

        ProductDAO dao = new ProductDAO();
        if (dao.addProduct(product)) {
            request.setAttribute("SuccessMsg", "Product Added Successfully");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } else {
            request.setAttribute("ErrorMsg", "Product not added!!!!");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
