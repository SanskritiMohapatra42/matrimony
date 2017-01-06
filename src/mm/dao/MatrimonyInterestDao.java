package mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mm.db.MatrimonyInterest;
import mm.db.Provider;

public class MatrimonyInterestDao {
	public static int save(MatrimonyInterest mi) {
		int status = 0;
		try {
			Connection con = Provider.getConnection();
			String sql = "insert into matrimony_interest(sender,receiver) values(?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mi.getSender());
			ps.setString(2, mi.getReceiver());
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static ResultSet getInterests(String receiver) {
		ResultSet rs = null;
		Connection con = Provider.getConnection();
		String sql="select * from matrimony_interest where receiver=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, receiver);
			rs = pst.executeQuery();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int getRows(String receiver) {
		Connection con = Provider.getConnection();
		String sql="select * from matrimony_interest where receiver=?";
		int n = 0;
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, receiver);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				n++;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
}
