package ex20200429;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PDAO {
	
	 public Connection con() throws Exception {
         String driver = "oracle.jdbc.driver.OracleDriver";
         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
         String user = "haksa";
         String password = "pass";

         Class.forName(driver);
         Connection con = DriverManager.getConnection(url, user, password);
         return con;
         }
	 
	 //교수목록 출력
	 public ArrayList<PVO> list() throws Exception {
		 ArrayList<PVO> list=new ArrayList<PVO>();
		 String sql="select*from professors";
		 PreparedStatement ps=con().prepareStatement(sql);
		 ResultSet rs=ps.executeQuery();
		 
		 while(rs.next()) {
			 PVO vo=new PVO();
			 vo.setPcode(rs.getString("pcode"));
			 vo.setPname(rs.getString("pname"));
			 vo.setPdept(rs.getString("pdept"));
			 vo.setHiredate(rs.getString("hiredate"));
			 vo.setTitle(rs.getString("title"));
			 vo.setSalary(rs.getInt("salary"));
			 list.add(vo);
		 }
		 return list;
	 }
}
