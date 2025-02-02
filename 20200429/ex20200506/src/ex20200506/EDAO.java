package ex20200506;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EDAO {
	
	 public Connection con() throws Exception {
         String driver = "oracle.jdbc.driver.OracleDriver";
         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
         String user = "haksa";
         String password = "pass";

         Class.forName(driver);
         Connection con = DriverManager.getConnection(url, user, password);
         return con;
         }
	 
	 	public ArrayList<CVO> clist() throws Exception {
	 		ArrayList<CVO> list=new ArrayList<CVO>();
	 		String sql="select clcode, lname, pname, room, avg(grade) a, count(clcode) c  from couenr group by clcode, lname, pname,room";
	 		PreparedStatement ps=con().prepareStatement(sql);
	 		ResultSet rs=ps.executeQuery();
	 		while(rs.next()) {
	 			CVO vo=new CVO();
	 			vo.setLcode(rs.getString("clcode"));
	 			vo.setLname(rs.getString("lname"));
	 			vo.setPname(rs.getString("pname"));
	 			vo.setRoom(rs.getString("room"));
	 			vo.setAvg(rs.getDouble("a"));
	 			vo.setCount(rs.getInt("c"));
	 			list.add(vo);
	 			System.out.println(vo.toString());
	 		}
	 		
	 		return list;
	 	}
	 	

}
