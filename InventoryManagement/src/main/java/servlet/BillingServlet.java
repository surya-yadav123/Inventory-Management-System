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

@WebServlet("/billing")
public class BillingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session=req.getSession(false);
		if(session.getAttribute("staff")==null ||session==null) {
			res.sendRedirect("login.jsp");
			return;
		}
		ProductDAO  p=new ProductDAO();
		List<Product> products=p.getAllProducts();
		req.setAttribute("products", products);	
		req.getRequestDispatcher("billing.jsp").forward(req, res);
		 
	}
}
