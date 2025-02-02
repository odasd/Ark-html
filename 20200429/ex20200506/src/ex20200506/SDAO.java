package ex20200506;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SDAO {
	
	public Connection con() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "haksa";
        String password = "pass";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
        }
	
	public ArrayList<SVO> slist() throws Exception {
 		ArrayList<SVO> list=new ArrayList<SVO>();
 		String sql="select scode, sname, sdept,  avg(grade) a, count(lcode) c from stuenr group by scode ,sname, sdept";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ResultSet rs=ps.executeQuery();
 		while(rs.next()) {
 			SVO vo=new SVO();
 			vo.setScode(rs.getString("scode"));
 			vo.setSname(rs.getString("sname"));
 			vo.setSdept(rs.getString("sdept"));
 			vo.setAvg(rs.getDouble("a"));
 			vo.setCount(rs.getInt("c"));
 			list.add(vo);
 			System.out.println(vo.toString());
 		}
 		
 		return list;
 	}
	
	public ArrayList<SVO> list() throws Exception {
 		ArrayList<SVO> list=new ArrayList<SVO>();
 		String sql="select*from stupro";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ResultSet rs=ps.executeQuery();
 		while(rs.next()) {
 			SVO vo=new SVO();
 			vo.setScode(rs.getString("scode"));
 			vo.setSname(rs.getString("sname"));
 			vo.setSdept(rs.getString("sdept"));
 			vo.setPname(rs.getString("pname"));
 			list.add(vo);
 			System.out.println(vo.toString());
 		}
 		
 		return list;
 	}
	//특정학생이 신청한 강좌 목록
	public ArrayList<CVO> elist(String scode) throws Exception {
 		ArrayList<CVO> list=new ArrayList<CVO>();
 		String sql="select*from couenr where scode=?";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ps.setString(1, scode);
 		ResultSet rs=ps.executeQuery();
 		while(rs.next()) {
 			CVO vo=new CVO();
 			vo.setLcode(rs.getString("lcode"));
 			vo.setLname(rs.getString("lname"));
 			vo.setCount(rs.getInt("grade"));
 			list.add(vo);
 		}
 		
 		return list;
	}
	
	//특정 학생의 평균점수,수강신청 과목수
	public CVO avg (String scode) throws Exception {

		CVO vo=new CVO();
 		String sql="select scode, avg(grade) avg, count(lcode) cnt from couenr where scode=? group by scode";
 		PreparedStatement ps=con().prepareStatement(sql);
 		ps.setString(1, scode);
 		ResultSet rs=ps.executeQuery();
 	
 		if(rs.next()) {
 			vo.setAvg(rs.getDouble("avg"));
 			vo.setCount(rs.getInt("cnt"));
 		}
 		return vo;
	}
}
