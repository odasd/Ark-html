<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.* , java.sql.*" %>

<%
	String aname=request.getParameter("aname"); //괄호 안의 값은 form에서 준 값임
	String tel=request.getParameter("tel");
	String address=request.getParameter("address");
	
	out.println("<h1>" + aname + "</h1>");
	out.println("<h1>" + tel + "</h1>");
	out.println("<h1>" + address + "</h1>");

	ADDVO vo=new ADDVO();
	vo.setAname(aname);
	vo.setTel(tel);
	vo.setAddress(address);
	
	ADDDAO dao=new ADDDAO();
	
	dao.insert(vo);

%>

<script>
	alert("저장되었습니다.");
	location.href="list.jsp";
</script>