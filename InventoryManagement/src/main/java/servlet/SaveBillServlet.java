package servlet;

import java.io.IOException;
import java.util.Map;

import dao.BillDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.Staff;

@WebServlet("/saveBill")
public class SaveBillServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession(false);
		Staff s = (Staff) session.getAttribute("staff");

		if (session == null || s == null) {
			res.sendRedirect("login.jsp");
			return;
		}

		BillDAO bill = new BillDAO();

		

		if (session == null || session.getAttribute("grandTotal") == null) {
		    res.sendRedirect("billing");
		    return;
		}

		double grandTotal = (double) session.getAttribute("grandTotal");

		Map<Integer, CartItem> cart =
            (Map<Integer, CartItem>) session.getAttribute("cart");

		int billId = bill.saveCompleteBill(grandTotal, "Cash", s.getStaffId(), cart);

	    session.setAttribute("billId", billId);
	    session.setAttribute("totalAmount", grandTotal);
	    res.sendRedirect("billSuccess.jsp");
	}
}
