package ex20200429;

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
	
	//Ư�� ������ ����ϴ� ���¸�� ���
	public ArrayList<EVO> list(String scode) throws Exception {
		 ArrayList<EVO> list=new ArrayList<EVO>();
		 String sql="select*from view_enroll where scode=?";
		 PreparedStatement ps=con().prepareStatement(sql);
		 ps.setString(1, scode);
		 ResultSet rs=ps.executeQuery();
		 
		 while(rs.next()) {
			 EVO vo=new EVO();
			 vo.setLcode(rs.getString("lcode"));
			 vo.setLname(rs.getString("lname"));
			 vo.setScode(rs.getString("scode"));
			 vo.setSname(rs.getString("sname"));
			 vo.setEdate(rs.getString("edate"));
			 vo.setGrade(rs.getInt("grade"));
			 list.add(vo);
		 }
		 con().close();
		 return list;
	 }
	
	//������û-������ ����� Ư���л��̽�û�� ������û ���
/*	public void insert(EVO vo) throws Exception {
		String sql="insert into enrollments(lcode, scode, edate) values(? , ?, sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getLcode());
		ps.setString(2, vo.getScode());
		ps.execute();
	}
	*/
	//������û 20200501 �п�����
	public void insert(String scode, String lcode) throws Exception {
		String sql="insert into enrollments(lcode, scode, edate) values(? , ?, sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, scode);
		ps.setString(2, lcode);
		ps.execute();
		con().close();
	}
		
	//���� ���
	public void delete(String lcode, String scode)  throws Exception {
		String sql="delete from enrollments where lcode=? and scode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ps.setString(2, scode);
		ps.execute();
		con().close();
	}
	//Ư�����¸� ��û�� �л� ���
	public ArrayList<EVO> clist(String lcode) throws Exception {
		 ArrayList<EVO> list=new ArrayList<EVO>();
		 String sql="select*from view_enroll where lcode=?";
		 PreparedStatement ps=con().prepareStatement(sql);
		 ps.setString(1, lcode);
		 ResultSet rs=ps.executeQuery();
		 
		 while(rs.next()) {
			 EVO vo=new EVO();
			 vo.setLcode(rs.getString("lcode"));
			 vo.setLname(rs.getString("lname"));
			 vo.setScode(rs.getString("scode"));
			 vo.setSname(rs.getString("sname"));
			 vo.setEdate(rs.getString("edate"));
			 vo.setGrade(rs.getInt("grade"));
			 list.add(vo);
		 }
		 con().close();
		 return list;
	}
	
	public void update(EVO vo) throws Exception {
		String sql="update enrollments set grade=? where scode=? and lcode=? ";
		PreparedStatement ps=con().prepareStatement(sql);
		
		ps.setInt(1, vo.getGrade());
		ps.setString(2, vo.getScode());
		ps.setString(3, vo.getLcode());
		ps.execute();
		con().close();
	}
}
