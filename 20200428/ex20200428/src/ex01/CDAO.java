package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CDAO {
	
	public Connection con() throws Exception {
         String driver = "oracle.jdbc.driver.OracleDriver";
     String url = "jdbc:oracle:thin:@localhost:1521:orcl";
     String user = "haksa";
     String password = "pass";

     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, password);
     return con;
     }
	    
	public ArrayList<CVO> list(String type, String word) throws Exception {
		ArrayList<CVO> list=new ArrayList<CVO>();
		String sql="select * from view_courses where " + type + " like ? ";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, "%" + word + "%");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			CVO vo=new CVO();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setRoom(rs.getString("room"));
			vo.setPname(rs.getString("pname"));
			vo.setPdept(rs.getString("pdept"));
			list.add(vo);
		}
		return list;
	}

}
