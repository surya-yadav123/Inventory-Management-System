package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import util.DBConnection;

public class ProductDAO {

    public boolean addProduct(Product product) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO product (name, quantity,barcode, unit, price, category, description, min_stock_level, expiry_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getName());
            ps.setDouble(2, product.getQuantity());
            ps.setString(4, product.getUnit());
            ps.setString(3, product.getBarcode());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getCategory());
            ps.setString(7, product.getDescription());
            ps.setDouble(8, product.getMinStockLevel());
            ps.setDate(9, product.getDate());

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Product> getAllProducts() {

        List<Product> productList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "select * from product";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getDouble("quantity"));
                p.setUnit(rs.getString("unit"));
                p.setPrice(rs.getDouble("price"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setMinStockLevel(rs.getDouble("min_stock_level"));
                p.setDate(rs.getDate("expiry_date"));
                p.setBarcode(rs.getString("barcode"));

                productList.add(p);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }

    public Product getProductById(int productId) {

        Product product = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "select * from product where product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProduct_id(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setQuantity(rs.getDouble("quantity"));
                product.setUnit(rs.getString("unit"));
                product.setPrice(rs.getDouble("price"));
                product.setCategory(rs.getString("category"));
                product.setDescription(rs.getString("description"));
                product.setMinStockLevel(rs.getDouble("min_stock_level"));
                product.setDate(rs.getDate("expiry_date"));
                product.setBarcode(rs.getString("barcode"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }

    public boolean updateProduct(Product product) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE product SET name = ?, quantity = ?,barcode=? ,unit = ?, price = ?, category = ?, description = ?, min_stock_level = ? WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getName());
            ps.setDouble(2, product.getQuantity());
            ps.setString(3, product.getBarcode());
            ps.setString(4, product.getUnit());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getCategory());
            ps.setString(7, product.getDescription());
            ps.setDouble(8, product.getMinStockLevel());
            ps.setInt(9, product.getProduct_id());
            
            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean deleteProduct(int productId) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM product WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public void updateQuantityAfterSale(int productId, double soldQty) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update product set quantity = quantity - ? where product_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, soldQty);
            ps.setInt(2, productId);

            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double getValue() throws SQLException {
        double total = 0;
        Connection con = DBConnection.getConnection();
        String sql = "select sum(price*quantity) from product";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            total = rs.getDouble(1);
        }
        rs.close();
        ps.close();
        con.close();
        return total;
    }

    public int getLowStockCount() throws SQLException {
        int count = 0;
        Connection con = DBConnection.getConnection();
        String sql = "select count(*) from product where quantity < min_stock_level";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt(1);
        }
        rs.close();
        ps.close();
        con.close();
        return count;
    }
}
