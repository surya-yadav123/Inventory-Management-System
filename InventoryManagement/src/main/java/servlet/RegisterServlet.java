package servlet;

import java.io.IOException;

import dao.StaffDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
		Staff staff=new Staff();
		StaffDAO s= new StaffDAO();
		String name= req.getParameter("name");
		String password=req.getParameter("password");
		String username=req.getParameter("username");
		staff.setName(name);
		staff.setPassword(password);
		staff.setRole("STAFF");
		staff.setUsername(username);
		if (s.register(staff)) {
		    req.getSession().setAttribute("SuccessMsg", "Staff Registered Successfully!!!");
		    res.sendRedirect("register.jsp");
		}

		}
}
