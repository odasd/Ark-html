package cafe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BlogDAO {
	
		   
	public Connection con() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	    String user = "system";
	    String password = "159752s";

	    Class.forName(driver);
	    Connection con = DriverManager.getConnection(url, user, password);
	    return con;
	    
	    }
	    
	   public ArrayList<BlogVO> list() throws Exception {
	    ArrayList<BlogVO> list = new ArrayList<BlogVO>();
	    String sql="select*from blog3";
	    PreparedStatement ps=con().prepareStatement(sql);
	    ResultSet rs=ps.executeQuery();
	    
	    while(rs.next()) {
	    	BlogVO vo=new BlogVO();
	    	
	    	vo.setBno(rs.getInt("bno"));
	    	vo.setTitle(rs.getString("title"));
	    	vo.setContent(rs.getString("content"));
	    	vo.setWdate(rs.getDate("wdate"));
	    	list.add(vo);
	    	
	    }	
	    	return list;
	    }
	
	   
	   public void insert (BlogVO vo) throws Exception {
		   String sql="insert into blog3(bno, title, content, wdate) values(seq_blog3.nextval, ?, ?, sysdate)";
		   PreparedStatement ps=con().prepareStatement(sql);
		   
		   
		   ps.setString(1, vo.getTitle());
		   ps.setString(2, vo.getContent());
		   ps.execute();

	   }
	   
	   public BlogVO read(int bno) throws Exception {
		   String sql="select* from blog3 where bno=?";
		   PreparedStatement ps=con().prepareStatement(sql);
		   ps.setInt(1, bno);
		   ResultSet rs=ps.executeQuery();
		   BlogVO vo=new BlogVO();
		   
		   if(rs.next()) {
			    vo.setBno(rs.getInt("bno"));
			    vo.setTitle(rs.getString("title"));
			    vo.setContent(rs.getString("content"));
			    
			    
		   }
		   return vo;
	   }
	   
	   
	   public void update (BlogVO vo) throws Exception {
		   String sql="update blog3 set title=?, content=? where bno=?";
		   PreparedStatement ps=con().prepareStatement(sql);
		   ps.setString(1, vo.getTitle());
		   ps.setString(2, vo.getContent());
		   ps.setInt(3, vo.getBno());
		   ps.executeQuery();
		     
	   }
	   
	   
	   public void delete (int bno) throws Exception {
		   String sql="delete from blog3 where bno=?";
		   PreparedStatement ps=con().prepareStatement(sql);
		   
		   ps.setInt(1, bno);
		   ps.executeQuery();
	   }
}
