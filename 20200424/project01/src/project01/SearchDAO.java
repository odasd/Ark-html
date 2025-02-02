package project01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SearchDAO {
	
	  public Connection con() throws Exception {
	         String driver = "oracle.jdbc.driver.OracleDriver";
	         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	         String user = "system";
	         String password = "159752s";

	         Class.forName(driver);
	         Connection con = DriverManager.getConnection(url, user, password);
	         return con;
	  }
	
	  public ArrayList<SearchVO> list() throws Exception{
		ArrayList<SearchVO> list=new ArrayList<SearchVO>();
		String sql="select*from portal";
		  PreparedStatement ps=con().prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  
		  while(rs.next()) {
			  SearchVO vo=new SearchVO();
		  vo.setSno(rs.getInt("sno"));
		  vo.setSname(rs.getString("sname"));
		  vo.setSp(rs.getString("sp"));
		  list.add(vo);
		  }
		  return list;
	  }
	  
	  public void insert(String sname, String sp) throws Exception{
		  String sql="insert into portal(sno, sname, sp) values(seq_search.nextval, ?, ?)";
		  PreparedStatement ps=con().prepareStatement(sql);
		  
		  ps.setString(1, sname);
		  ps.setString(2, sp);
		  ps.execute();  
	  }
	  
	  public void delete(int sno) throws Exception{
		  String sql="delete from portal where sno=?";
		  PreparedStatement ps=con().prepareStatement(sql);
		  
		  ps.setInt(1, sno);
		  ps.execute();
	  }
}
