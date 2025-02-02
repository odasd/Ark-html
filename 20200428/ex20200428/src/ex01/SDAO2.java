package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SDAO2 {
	
	public Connection con() throws Exception {
         String driver = "oracle.jdbc.driver.OracleDriver";
     String url = "jdbc:oracle:thin:@localhost:1521:orcl";
     String user = "haksa";
     String password = "pass";

     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, password);
     return con;
     }
	    
	public ArrayList<SVO2> list(String lcode) throws Exception {
		ArrayList<SVO2> list=new ArrayList<SVO2>();
		String sql="select * from view_enrollments where lcode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			SVO2 vo=new SVO2();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setScode(rs.getString("scode"));
			vo.setSname(rs.getString("Sname"));
			vo.setEdate(rs.getString("edate"));
			vo.setGrade(rs.getString("grade"));
			list.add(vo);
		}
		return list;
	}
	public int count(String lcode) throws Exception {
		int count=0;
		String sql="select count(*) cnt from enrollments where lcode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt("cnt");
		}
		return count;
	}
	
}