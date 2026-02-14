package servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/resetCartAndGoBilling")
public class ResetCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        session.removeAttribute("cart");

        // Or reset it
        // session.setAttribute("cart", new HashMap<Integer, CartItem>());

        response.sendRedirect("billing");
    }
}
