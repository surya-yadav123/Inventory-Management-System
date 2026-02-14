package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Bill;
import model.CartItem;
import util.DBConnection;

public class BillDAO {

    public int saveCompleteBill(double d,
                                String paymentMethod,
                                int staffId,
                                Map<Integer, CartItem> cart) {

        int billId = 0;

        try {
            Connection con = DBConnection.getConnection();
            con.setAutoCommit(false); 

            String billSql =
                "insert into bill (total_amount, payment_method, staff_id) values (?,?,?)";

            PreparedStatement billPs =
                con.prepareStatement(billSql, Statement.RETURN_GENERATED_KEYS);

            billPs.setDouble(1, d);
            billPs.setString(2, paymentMethod);
            billPs.setInt(3, staffId);
            billPs.executeUpdate();

            ResultSet rs = billPs.getGeneratedKeys();
            if (rs.next()) {
                billId = rs.getInt(1);
            }

            String itemSql =
                "insert into bill_item (bill_id, product_id, quantity, price) VALUES (?,?,?,?)";

            PreparedStatement itemPs = con.prepareStatement(itemSql);

            String stockSql =
                "update product set quantity = quantity - ? where product_id = ?";
            PreparedStatement stockPs = con.prepareStatement(stockSql);

            for (CartItem item : cart.values()) {

                itemPs.setInt(1, billId);
                itemPs.setInt(2, item.getProductId());
                itemPs.setInt(3, item.getQuantity());
                itemPs.setFloat(4, (float) item.getPrice());
                itemPs.addBatch();

                stockPs.setInt(1, item.getQuantity());
                stockPs.setInt(2, item.getProductId());
                stockPs.addBatch();
            }

            itemPs.executeBatch();
            stockPs.executeBatch();

            con.commit();
            con.setAutoCommit(true);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return billId;
    }
 public List<Bill> getBills(){
	 List<Bill> list=new ArrayList<>();
	 Connection con=DBConnection.getConnection();
	 String sql="select * from bill ";
	 try {
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Bill bill=new Bill();
			bill.setBill_id(rs.getInt("bill_id"));
			bill.setBill_date(rs.getDate("bill_date"));
			bill.setPayment_method(rs.getString("payment_method"));
			bill.setStaff_id(rs.getInt("staff_id"));
			bill.setTotal_amount(rs.getFloat("total_amount"));
			
			list.add(bill);

		}
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	 return list;
 }
 public List<String> getBillItemsWithProduct(int billId) {

	    List<String> list = new ArrayList<>();

	    String sql = """
	        SELECT p.name, bi.quantity, bi.price
	        FROM bill_item bi
	        JOIN product p ON bi.product_id = p.product_id
	        WHERE bi.bill_id = ?
	    """;

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, billId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            list.add(
	                rs.getString("name") +
	                " (Qty: " + rs.getInt("quantity") +
	                ", ₹" + rs.getFloat("price") + ")"
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
 public double getTodaySales() {
	    double total = 0;

	    String sql = "select sum(total_amount) from bill where DATE(bill_date) = CURDATE()";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        if (rs.next()) {
	            total = rs.getDouble(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return total;
	}
 public int getProductsSold() {
	    int total = 0;

	    String sql = """
	        SELECT COALESCE(SUM(bi.quantity), 0)
	        FROM bill_item bi
	        JOIN bill b ON bi.bill_id = b.bill_id
	        WHERE DATE(b.bill_date) = CURDATE()
	    """;

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        if (rs.next()) {
	            total = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return total;
	}



}
