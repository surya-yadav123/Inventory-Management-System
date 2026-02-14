package servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;

@WebServlet("/profile")
public class profileServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session=req.getSession();
		Staff staff=(Staff) session.getAttribute("staff");
		if(session==null ||session.getAttribute("staff")==null) {
			res.sendRedirect("login.jsp");
			return;
		}
		res.sendRedirect("profile.jsp");
	}
}
