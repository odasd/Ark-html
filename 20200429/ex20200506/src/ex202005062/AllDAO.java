package ex202005062;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class AllDAO {
	
	public Connection con() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "haksa";
        String password = "pass";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
        }
	
	public ArrayList<CPVO> alist() throws Exception {
 		ArrayList<CPVO> list=new ArrayList<CPVO>();
 		String sql="select*from coupro";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ResultSet rs=ps.executeQuery();
 		while(rs.next()) {
 			CPVO vo=new CPVO();
 			vo.setLcode(rs.getString("lcode"));
 			vo.setLname(rs.getString("lname"));
 			vo.setPname(rs.getString("pname"));
 			list.add(vo);
 			System.out.println(vo.toString());
 		}
 		
 		return list;
 	}
	//특정학생이 신청한 강좌 목록
	public ArrayList<SEVO> blist(String lcode) throws Exception {
 		ArrayList<SEVO> list=new ArrayList<SEVO>();
 		String sql="select*from stuenr where lcode=?";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ps.setString(1, lcode);
 		ResultSet rs=ps.executeQuery();
 		while(rs.next()) {
 			SEVO vo=new SEVO();
 			vo.setScode(rs.getString("scode"));
 			vo.setSname(rs.getString("sname"));
 			vo.setGrade(rs.getInt("grade"));
 			list.add(vo);
 		}
 		
 		return list;
	}
	
	//특정 학생의 평균점수,수강신청 과목수
	public SEVO avg (String lcode) throws Exception {

		SEVO vo=new SEVO();
 		String sql="select lcode, count(scode) cnt, avg(grade) avg from couenr where lcode=? group by lcode";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ps.setString(1, lcode);
 		ResultSet rs=ps.executeQuery();
 	
 		if(rs.next()) {
 			vo.setCount(rs.getInt("cnt"));
 			vo.setAvg(rs.getDouble("avg"));
 			
 		}
 		return vo;
	}

}
