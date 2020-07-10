package exhome;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DataDAO {
	
	

	public Connection con() throws Exception {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "system";
		String password = "159752s";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		
		
		return con;
	}
	
	public void insert(DataVO vo) throws Exception {
		
		String sql="insert into pt(month, manager, mmoney, tel) values(?, ?, ?, ?)";
		PreparedStatement ps= con().prepareStatement(sql);
		ps.setString(1, vo.getMonth());
		ps.setString(2, vo.getManager());
		ps.setInt(3, vo.getMmoney());
		ps.setString(4, vo.getTel());
		ps.execute();
	}
	
	public ArrayList<DataVO> list() throws Exception {
		ArrayList<DataVO> array = new ArrayList<DataVO>();
		String sql="select*from pt";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
			while(rs.next()) {
				DataVO vo=new DataVO();
				vo.setMonth(rs.getString("month"));
				vo.setManager(rs.getString("manager"));
				vo.setMmoney(rs.getInt("mmoney"));
				vo.setTel(rs.getString("tel"));
				array.add(vo);
			}
		
		
		
		return array;
	}
}
