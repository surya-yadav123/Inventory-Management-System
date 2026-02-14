package servlet;

import java.io.IOException;
import java.util.Map;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BillItem;
import model.CartItem;

@WebServlet("/generateBill")
public class BillServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        Map<Integer, CartItem> cart =
            (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            res.sendRedirect("billing");
            return;
        }

        double grandTotal = 0;
        for (CartItem item : cart.values()) {
            grandTotal += item.getTotal();
        }

        session.setAttribute("cart", cart);
        session.setAttribute("grandTotal", grandTotal);    
        res.sendRedirect("billPreview.jsp");
        
    }
}

	
