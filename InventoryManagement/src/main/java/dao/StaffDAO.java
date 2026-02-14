package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Staff;
import util.DBConnection;

public class StaffDAO {

    public Staff login(String username, String password) {

        Staff staff = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "select * from staff where email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setUsername(rs.getString("email"));
                staff.setName(rs.getString("name"));
                staff.setRole(rs.getString("role"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return staff;
    }
    public boolean register(Staff s) {
    	Connection con=DBConnection.getConnection();
    	String username=s.getUsername();
    	String role="Staff";
    	String name=s.getName();
    	String password=s.getPassword();
    	String sql="insert into staff (name,email,password,role) values(?,?,?,?)";
    	try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,name );
			ps.setString(2,username );
			ps.setString(3,password );
			ps.setString(4,role );
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
    	
    }
}
