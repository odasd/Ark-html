package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EnrollDAO {
	
	public Connection con() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "haksa";
        String password = "pass";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
        }
   
	public ArrayList<EnrollVO> clist() throws Exception {
		ArrayList<EnrollVO> list=new ArrayList<EnrollVO>();
		String sql="select lcode,lname,pname, avg(grade) a from enroll2 group by lcode, lname, pname";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			EnrollVO vo=new EnrollVO();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setPname(rs.getString("pname"));
			vo.setAvg(rs.getDouble("a"));
			list.add(vo);
			System.out.println(vo.toString());
		}
		return list;
		
	}
}
