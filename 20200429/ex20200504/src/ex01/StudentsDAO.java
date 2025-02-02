package ex01;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentsDAO {

	public Connection con() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "haksa";
        String password = "pass";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        return con;
        }
   
	public ArrayList<StudentsVO> slist() throws Exception {
		ArrayList<StudentsVO> list=new ArrayList<StudentsVO>();
		String sql="select s.sdept, s.scode, s.sname, avg(e.grade) a from enroll2 e right join students s on s.scode=e.scode group by s.scode, s.sname, s.sdept";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			StudentsVO vo=new StudentsVO();
			vo.setSdept(rs.getString("sdept"));
			vo.setScode(rs.getString("scode"));
			vo.setSname(rs.getString("sname"));
			vo.setAvg(rs.getDouble("a"));
			list.add(vo);
		}
		return list;
	}
		/*
		public int insert(String scode, String sname, String year) throws Exception {
			String sql="{call add_students(?,?,?,?)}";
			CallableStatement cs=con().prepareCall(sql);
			cs.setString(1, scode);
			cs.setString(2, sname);
			cs.setString(3, year);
		}
	*/
}
