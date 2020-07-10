<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.* , java.sql.* " %>

<%
	String strgno=request.getParameter("gno");
	int gno=Integer.parseInt(strgno);
	String strkor=request.getParameter("kor");
	int kor=Integer.parseInt(strkor);
	String streng=request.getParameter("eng");
	int eng=Integer.parseInt(streng);
	String strmat=request.getParameter("mat");
	int mat=Integer.parseInt(strmat);
	
	GradeDAO dao=new GradeDAO();
	GradeVO vo=new GradeVO();
	vo.setGno(gno);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	dao.update(vo);
	
	
	

%>

<script>
	alert("수정되었습니다.");
	location.href="list.jsp";
</script>