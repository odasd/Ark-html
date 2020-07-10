package ex02;

import java.sql.*;
import java.util.ArrayList;



public class ReplyDAO {
		   
	   public Connection con() throws Exception {
	        String driver = "oracle.jdbc.driver.OracleDriver";
	        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	        String user = "system";
	        String password = "159752s";

	        Class.forName(driver);
	        Connection con = DriverManager.getConnection(url, user, password);
	        return con;
	        }
	    
	    
	 //목록출력 메서드
	      public ArrayList<ReplyVO> list()throws Exception{
	            ArrayList<ReplyVO> list=new ArrayList<ReplyVO>();
	            String sql="select * from tbl_reply order by rno desc";
	            PreparedStatement ps=con().prepareStatement(sql);
	            ResultSet rs=ps.executeQuery();
	            while(rs.next()) {
	               ReplyVO vo=new ReplyVO();
	               vo.setRno(rs.getInt("rno"));
	               vo.setContent(rs.getString("content"));
	               vo.setWdate(rs.getTimestamp("wdate"));
	               vo.setCnt(rs.getInt("cnt"));
	               list.add(vo);
	            }
	            return list;
	         
	    }
	      public void insert(String content) throws Exception{
	  		String sql="insert into tbl_reply(rno, content, wdate) values (seq_rno.nextval, ?, sysdate)";
	  		PreparedStatement ps=con().prepareStatement(sql);
	  		
	  		ps.setString(1, content);
	  		ps.execute();
	  	}
	  	
	  	public void delete(int rno) throws Exception{
	  		String sql="delete from tbl_reply where rno=?";
	  		PreparedStatement ps=con().prepareStatement(sql);
	  		
	  		ps.setInt(1, rno);
	  		ps.execute();
	  		
	  	}	
	  	
	  	public void update(int rno) throws Exception{
	  		String sql="update tbl_reply set cnt=cnt+1 where rno=?";
	  		PreparedStatement ps=con().prepareStatement(sql);
	  		
	  		ps.setInt(1, rno);
	  		ps.execute();
	  	}
	  

}