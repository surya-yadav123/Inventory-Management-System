package servlet;

import java.io.IOException;

import dao.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;

@WebServlet("/editProduct")
public class EditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("id"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        req.setAttribute("product", product);

        try {
            req.getRequestDispatcher("editProduct.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

