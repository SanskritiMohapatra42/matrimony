package mm.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Provider {

	public static Connection getConnection() {
		// TODO Auto-generated method stub
		Connection con = null;
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username="system";
		String password="4243";
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url,username,password);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

}
