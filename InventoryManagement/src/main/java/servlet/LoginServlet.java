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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    request.getRequestDispatcher("login.jsp").forward(request, response);
	}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.login(username, password);

        if (staff != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("staff", staff);
            if ("ADMIN".equals(staff.getRole())) {
                response.sendRedirect("adminDashboard");
                return;
            } else {
                response.sendRedirect("dashboard.jsp");
            }

        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
    }
}
