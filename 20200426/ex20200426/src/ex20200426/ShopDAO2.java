package ex20200426;

import java.sql.Connection;
import java.sql.DriverManager;

public class ShopDAO2 {
	
	   public Connection con() throws Exception {
	         String driver = "oracle.jdbc.driver.OracleDriver";
	         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	         String user = "system";
	         String password = "159752s";

	         Class.forName(driver);
	         Connection con = DriverManager.getConnection(url, user, password);
	         return con;
	         }
	    
	
	   
}
