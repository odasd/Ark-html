<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	String strAno=request.getParameter("ano");
	int ano=Integer.parseInt(strAno);
	
	out.print("<h1>" + ano + "를 삭제했습니다." + "</h1>");



%>