package servlet;

import java.awt.Color;
import java.io.IOException;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet("/billPdf")
public class BillPdfServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("billId") == null) {
            res.sendRedirect("billing");
            return;
        }

        int billId = (int) session.getAttribute("billId");
        double totalAmount = (double) session.getAttribute("grandTotal");

        Map<Integer, CartItem> cart =
            (Map<Integer, CartItem>) session.getAttribute("cart");

        res.setContentType("application/pdf");
        res.setHeader("Content-Disposition", "attachment; filename=bill_" + billId + ".pdf");

        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, res.getOutputStream());
        document.open();

        Font shopFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14);
        Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 11);
        Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 11);

        Paragraph shopName = new Paragraph("ABC INVENTORY STORE", shopFont);
        shopName.setAlignment(Element.ALIGN_CENTER);
        document.add(shopName);

        Paragraph shopDetails = new Paragraph("Main Road, City | Phone: 9876543210", normalFont);
        shopDetails.setAlignment(Element.ALIGN_CENTER);
        document.add(shopDetails);

        document.add(new Paragraph("--------------------------------------------------------"));

        // Bill Info
        String dateStr = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());
        document.add(new Paragraph("Invoice No: " + billId));
        document.add(new Paragraph("Date: " + dateStr));
        document.add(new Paragraph(" "));

        // Table
        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{4f, 2f, 2f, 2f});

        PdfPCell cell;

        cell = new PdfPCell(new Phrase("Product", headerFont));
        cell.setBackgroundColor(Color.LIGHT_GRAY);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Quantity", headerFont));
        cell.setBackgroundColor(Color.LIGHT_GRAY);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Rate", headerFont));
        cell.setBackgroundColor(Color.LIGHT_GRAY);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Amount", headerFont));
        cell.setBackgroundColor(Color.LIGHT_GRAY);
        table.addCell(cell);

        if (cart != null) {
            for (CartItem item : cart.values()) {
                table.addCell(new Phrase(item.getName(), normalFont));
                table.addCell(new Phrase(String.valueOf(item.getQuantity()), normalFont));
                table.addCell(new Phrase("₹ " + item.getPrice(), normalFont));
                table.addCell(new Phrase("₹ " + item.getTotal(), normalFont));
            }
        }

        document.add(table);

        document.add(new Paragraph(" "));
        Paragraph totalPara = new Paragraph("Grand Total: ₹ " + totalAmount, titleFont);
        totalPara.setAlignment(Element.ALIGN_RIGHT);
        document.add(totalPara);

        document.add(new Paragraph(" "));
        Paragraph thanks = new Paragraph("Thank you for shopping with us!", normalFont);
        thanks.setAlignment(Element.ALIGN_CENTER);
        document.add(thanks);

        document.close();

        session.removeAttribute("cart");
    }
}
