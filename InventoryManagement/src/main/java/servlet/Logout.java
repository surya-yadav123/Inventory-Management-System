package servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session=req.getSession();
		Staff staff=(Staff) session.getAttribute("staff");
		if(staff==null || session==null) {
		req.getRequestDispatcher("login.jsp");
		return;
		}
		session.invalidate();
		res.sendRedirect("login.jsp");
	}
	
}
