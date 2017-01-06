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

public class UsersDao {

	public static int save(Users user) {
		// TODO Auto-generated method stub
		int status = 0;
		String sql = "Insert into users (Name,Gender,Date_of_birth,religion,mother_tongue,cast,mobile,emailid,password) values (?,?,?,?,?,?,?,?,?)";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2,user.getGender());
			pst.setString(3, user.getDateofbirth());
			pst.setString(4, user.getReligion());
			pst.setString(5, user.getMothertongue());
			pst.setString(6, user.getCast());
			pst.setString(7, user.getMobile());
			pst.setString(8, user.getEmail());
			pst.setString(9, user.getPassword());
			//pst.setString(10,"profile-default.jpg");
			
			status = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}

	public static boolean vaidate(Users user) {
		// TODO Auto-generated method stub
		boolean status = false;
		String sql = "select emailid , password from users where emailid=? and password=?";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user.getEmail());
			pst.setString(2, user.getPassword());
			//System.out.println(user.getEmail() +"\t"+ user.getPassword());
			ResultSet rs = pst.executeQuery();
			if(rs.next())
				status=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public static String getPassword(String to) {
		// TODO Auto-generated method stub
		String pass=null;
		String sql = "select password from users where emailid = ?";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, to);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
				pass=rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pass;
	}

	public static int updatePassword(Users u) {
		// TODO Auto-generated method stub
		int status = 0 ; 
		String sql = "Update users set password=? where emailid=? ";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, u.getPassword());
			pst.setString(2, u.getEmail());
			status = pst.executeUpdate();
		}
		catch(Exception e)
		{
			
		}
		return status;
	}
	public static Users getDetails(String emailid)
	{
		Users user = new Users();
		String sql = "select * from users where emailid = ?";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, emailid);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				user.setEmail(rs.getString("emailid"));
				user.setCast(rs.getString("cast"));
				user.setDateofbirth(rs.getString("Date_of_birth"));
				user.setGender(rs.getString("gender"));
				user.setMobile(rs.getString("mobile"));
				user.setReligion(rs.getString("religion"));
				user.setMothertongue(rs.getString("mother_tongue"));
				user.setName(rs.getString("name"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public static int updateDetails(Users user) {
		int status = 0 ; 
		String sql = "update users set name=?,gender=?,date_of_birth=?,religion=?,mother_tongue=?,cast=?,mobile=? where emailid=?";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2,user.getGender());
			pst.setString(3, user.getDateofbirth());
			pst.setString(4, user.getReligion());
			pst.setString(5, user.getMothertongue());
			pst.setString(6, user.getCast());
			pst.setString(7, user.getMobile());
			pst.setString(8, user.getEmail());
			
			status = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status ;		
	}
	
	public static int updatePhoto(Users user, String file_name) {
		int status = 0;
		String sql = "Update users set photo=? where emailid=? ";
		Connection con = Provider.getConnection();
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			System.out.println(file_name);
			FileInputStream fis=new FileInputStream(file_name);
			
			pst.setBinaryStream(1, fis, fis.available());
			pst.setString(2, user.getEmail());
			
			status = pst.executeUpdate();
			if(status > 0)
				System.out.println("Record Updated ");
			else
				System.out.println("Not Updated ...");
		}
		catch(Exception e)
		{
			
		}
		return status;
	}
	public static boolean checkPhoto(String emailid , String filePath)
	{
		boolean status = false;
		try
		{
			Connection con = Provider.getConnection();
			String sql = "select photo from users where emailid=? and length(photo) > 0 ";
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, emailid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				System.out.println ("*************Already available");
				String sql1="select photo from users where emailid=?";
				PreparedStatement pst1=con.prepareStatement(sql1);
				pst1.setString(1,emailid);
				ResultSet rs1 =pst1.executeQuery();
				if(rs1.next())
				{
					InputStream fis=rs1.getBinaryStream(1);
					//getting path
					System.out.println("******************"+filePath);
					File file = new File(filePath);
					FileOutputStream fos=new FileOutputStream(file);
					int c=0;
					while((c=fis.read())> -1)
					{
						status = true;
						fos.write(c);
					}	
					System.out.println ("Write data into file completed ");
					fos.close();
					fis.close();	
					con.close();
				}
			}
			else
			{
				System.out.println ("Not available");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
}
