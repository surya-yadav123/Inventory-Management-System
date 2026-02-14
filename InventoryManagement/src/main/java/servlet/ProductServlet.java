package servlet;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
@WebServlet("/viewProducts")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProducts();

        req.setAttribute("products", products);
        session.setAttribute("products", products);
        req.getRequestDispatcher("viewProducts.jsp").forward(req, res);
    }
}
