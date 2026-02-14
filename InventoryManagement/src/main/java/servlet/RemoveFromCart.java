package servlet;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet("/removeFromCart")
public class RemoveFromCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart =
            (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.remove(productId);
        }

        response.sendRedirect("billing"); 
    }
}