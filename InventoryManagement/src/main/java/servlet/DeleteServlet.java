package servlet;

import java.io.IOException;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteProduct")
public class DeleteServlet extends HttpServlet {

	protected void doGet (HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        int p_id=Integer.parseInt(req.getParameter("id"));
        ProductDAO p=new ProductDAO();
        p.deleteProduct(p_id);
        req.setAttribute("successMsg","Product Deleted Successfully");
       res.sendRedirect("viewProducts");
	}
}
