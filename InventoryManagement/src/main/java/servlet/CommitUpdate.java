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
@WebServlet("/update")
public class CommitUpdate extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        ProductDAO p = new ProductDAO();
        Product product = new Product();

        product.setProduct_id(Integer.parseInt(req.getParameter("id")));
        product.setName(req.getParameter("name"));
        product.setQuantity(Double.parseDouble(req.getParameter("quantity")));
        product.setUnit(req.getParameter("unit"));
        product.setPrice(Double.parseDouble(req.getParameter("price")));
        product.setCategory(req.getParameter("category"));
        product.setDescription(req.getParameter("description"));
        product.setMinStockLevel(Double.parseDouble(req.getParameter("minStockLevel")));
        product.setBarcode(req.getParameter("barcode"));
        p.updateProduct(product);
        res.sendRedirect("viewProducts");
    }
}
