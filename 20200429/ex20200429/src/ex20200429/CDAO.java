package ex20200429;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CDAO {
	
	public Connection con() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "haksa";
        String password = "pass";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
        }
	
	//특정 교수가 담당하는 강좌목록 출력
	public ArrayList<CVO> list(String pcode) throws Exception {
		 ArrayList<CVO> list=new ArrayList<CVO>();
		 String sql="select*from courses where instructor like ?";
		 PreparedStatement ps=con().prepareStatement(sql);
		 ps.setString(1, pcode);
		 ResultSet rs=ps.executeQuery();
		 
		 while(rs.next()) {
			 CVO vo=new CVO();
			 vo.setLcode(rs.getString("lcode"));
			 vo.setLname(rs.getString("lname"));
			 vo.setHours(rs.getInt("hours"));
			 vo.setRoom(rs.getString("room"));
			 vo.setInstructor(rs.getString("instructor"));
			 vo.setCapacity(rs.getInt("capacity"));
			 vo.setPersons(rs.getInt("persons"));
			 list.add(vo);
		 }
		 return list;
	 }
}
