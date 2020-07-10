package chuchu;

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
    	ArrayList<BlogVO> list=new ArrayList<BlogVO>();
    	String sql="select*from blog2 order by desc";
    	PreparedStatement ps=con().prepareStatement(sql);
    	ResultSet rs=ps.executeQuery();
    	BlogVO vo=new BlogVO();
    	
    	while(rs.next()) {
    		
    		vo.setBno(rs.getInt("bno"));
    		vo.setTitle(rs.getString("title"));
    		vo.setContent(rs.getNString("content"));
    		vo.setWdate(rs.getDate("wdate"));
    		list.add(vo);
    	}
    	
    	return list;
    }
   
}
	
