package servlet;

import java.io.IOException;
import java.util.List;

import dao.BillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bill;

@WebServlet("/getBill")
public class GetAllBills extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session=req.getSession();
		if(session==null||session.getAttribute("staff")==null) {
			res.sendRedirect("login.jsp");
			return;
		}
		BillDAO bill=new BillDAO();
		List<Bill> list=bill.getBills();
		req.setAttribute("allBills", list);
		req.getRequestDispatcher("viewBills.jsp").forward(req, res);
		
	}
}
