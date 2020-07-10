package ex01;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Test {

	public static void main(String[] args) throws Exception{
		list();
		
		
	}
		
		
		
		public static void list() throws Exception {
		//list() 메서드 테스트
		GradeDAO dao= new GradeDAO();
		
		ArrayList<GradeVO> list=dao.list();
		for(int i=0; i<list.size(); i++) {
			GradeVO vo=list.get(i);
			
			System.out.println(vo.getGno() + vo.getGname() + vo.getKor() + vo.getEng() + vo.getMat());
			
			
			
		}
		}
		
		public static void insert() throws Exception {
		//insert 메서드 테스트
		GradeDAO dao= new GradeDAO();
		GradeVO vo=new GradeVO();
		
		vo.setGname("뭐시기");
		vo.setKor(88);
		vo.setEng(85);
		vo.setMat(75);
		dao.insert(vo);
		}
		
		public static void update() throws Exception {
		//update 메서드 테스트
		GradeDAO dao= new GradeDAO();
		GradeVO vo=new GradeVO();
		
		vo.setGno(1);
		vo.setKor(56);
		vo.setEng(89);
		vo.setMat(74);
		dao.update(vo);
		
		//delete 메서드 테스트
		dao.delete(6);
		}

}
