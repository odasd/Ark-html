package ex01;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) throws Exception {
		//������
		ProductDAO dao=new ProductDAO();
		ArrayList<ProductVO> list=dao.list();
		
		for(int i=0; i<list.size(); i++) {
			ProductVO vo=list.get(i);
			System.out.println(vo.getPno() + vo.getPname() + vo.getPrice());
		}
	}

}
