package mm.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

import mm.db.Provider;
import mm.db.Users;
import mm.db.MatrimonyMail;

public class MatrimonyMailDao {

	public static int save(MatrimonyMail mail) {
		// TODO Auto-generated method stub
		int status = 0;
		String sql = "Insert into matrimony_mail (sender,receiver,subject,message,msgdate,name) values (?,?,?,?,?,?)";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, mail.getSender());
			pst.setString(2, mail.getReceiver());
			pst.setString(3, mail.getSubject());
			pst.setString(4, mail.getMessage());
			pst.setString(5, mail.getMsgDate());
			pst.setString(6, mail.getName());
			
			status = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static ResultSet getMessages(String receiver) {
		ResultSet rs = null;
		Connection con = Provider.getConnection();
		String sql="select * from matrimony_mail where receiver=?";
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
		String sql="select * from matrimony_mail where receiver=?";
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
