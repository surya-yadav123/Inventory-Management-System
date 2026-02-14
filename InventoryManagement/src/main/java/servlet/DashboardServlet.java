package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.BillDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;
@WebServlet("/adminDashboard")
public class DashboardServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
        HttpSession session = req.getSession(false);
        Staff staff=(Staff) session.getAttribute("staff");
        if (session == null || staff == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        if(staff.getRole().equals("ADMIN")) {
	BillDAO dao = new BillDAO();
	ProductDAO pdao=new ProductDAO();
	double todaySales = dao.getTodaySales();
	int totalProducts= dao.getProductsSold();
	int lowStock=0;
	try {
		lowStock=pdao.getLowStockCount();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	double totalValue=0;
	try {
		totalValue = pdao.getValue();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	req.setAttribute("todaySales", todaySales);
	req.setAttribute("totalProducts", totalProducts);
	req.setAttribute("totalValue",totalValue);
	req.setAttribute("lowStockCount", lowStock);
	req.getRequestDispatcher("adminDash.jsp").forward(req,res);

	}
    	else {
    		res.sendRedirect("dashboard.jsp");
    	}
	}
}
