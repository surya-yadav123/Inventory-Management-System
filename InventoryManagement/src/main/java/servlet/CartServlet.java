package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.Product;

@WebServlet("/addToCart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));

        int qty = 1;

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        if (product == null) {
            res.sendRedirect("billing");
            return;
        }

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        if (cart.containsKey(productId)) {
            CartItem item = cart.get(productId);

            if (item.getQuantity() + 1 > product.getQuantity()) {
                res.sendRedirect("billing");
                return;
            }

            item.setQuantity(item.getQuantity() + 1);

        } else {

            if (product.getQuantity() < 1) {
                res.sendRedirect("billing");
                return;
            }

            CartItem item = new CartItem();
            item.setProductId(productId);
            item.setName(product.getName());
            item.setPrice(product.getPrice());
            item.setQuantity(1);
            

            cart.put(productId, item);
        }

        session.setAttribute("cart", cart);
        res.sendRedirect("billing");
    }
}
