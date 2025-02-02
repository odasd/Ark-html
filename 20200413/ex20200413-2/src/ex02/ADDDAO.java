package ex02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ADDDAO {
	
	  public Connection con() throws Exception {
	         String driver = "oracle.jdbc.driver.OracleDriver";
	         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	         String user = "system";
	         String password = "159752s";

	         Class.forName(driver);
	         Connection con = DriverManager.getConnection(url, user, password);
	         return con;
	         }
	    
	  
	  public ArrayList<ADDVO> list() throws Exception {
			ArrayList<ADDVO> list=new ArrayList<ADDVO>();
			String sql="select*from tbl_address order by ano desc";
			PreparedStatement ps=con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				ADDVO vo=new ADDVO();
				vo.setAno(rs.getInt("ano"));
				vo.setAname(rs.getString("aname"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				list.add(vo);
			}
			
			
			return list;
		}
	  
	  
	  
	    
	    public void insert (ADDVO vo) throws Exception {
	    	String sql="insert into tbl_address(ano, aname, tel, address) values(seq_add.nextval, ?, ?, ?)";
	    	PreparedStatement ps=con().prepareStatement(sql);
	    	
	    	ps.setString(1, vo.getAname());
	    	ps.setString(2, vo.getTel());
	    	ps.setString(3, vo.getAddress());
	    	ps.execute();
	    }
	    
	    
	    public ADDVO read(int ano) throws Exception{
	    	String sql="select*from tbl_address where ano=?";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setInt(1, ano);
			ResultSet rs=ps.executeQuery();
			ADDVO vo =new ADDVO();
			if(rs.next()==true) {
				vo.setAno(rs.getInt("ano"));
				vo.setAname(rs.getString("aname"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
			}
			return vo;
	    }
	    
	    public void delete(int ano) throws Exception {
			String sql="delete from tbl_address where ano=?";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setInt(1, ano);
			ps.execute();
		}
		
		public void update(ADDVO vo) throws Exception {
			String sql="update tbl_address set aname=? , tel=? , address=? where ano=?";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setString(1, vo.getAname());
			ps.setString(2, vo.getTel());
			ps.setString(3, vo.getAddress());
			ps.setInt(4, vo.getAno());
			ps.execute();
		}
	}

	

