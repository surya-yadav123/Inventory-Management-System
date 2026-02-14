package servlet;

import java.io.IOException;

import dao.BillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewBillProducts")
public class ViewBillProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        int billId = Integer.parseInt(req.getParameter("billId"));

        BillDAO dao = new BillDAO();
        req.setAttribute("items", dao.getBillItemsWithProduct(billId));

        req.getRequestDispatcher("billProducts.jsp").forward(req, res);
    }
}

