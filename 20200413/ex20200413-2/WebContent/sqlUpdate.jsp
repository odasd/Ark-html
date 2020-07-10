<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.* , java.sql.* "%>

<%

	String strAno=request.getParameter("ano");
	int ano=Integer.parseInt(strAno);
	
	String aname=request.getParameter("aname");
	String tel=request.getParameter("tel");
	String address=request.getParameter("address");
	
	ADDVO vo=new ADDVO();
	vo.setAno(ano);
	vo.setAname(aname);
	vo.setTel(tel);
	vo.setAddress(address);
	
	ADDDAO dao=new ADDDAO();
	dao.update(vo);
%>

<script>
	alert("수정되었습니다.");
	location.href="list.jsp";
</script>