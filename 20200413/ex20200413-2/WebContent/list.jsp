<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.* , java.sql.* " %>
<%

ADDDAO dao=new ADDDAO();
ArrayList<ADDVO> array=dao.list();


%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소록 목록</title>
	<style>
		div {background:gray; color:white; font-size:30px;}
	</style>
</head>
<body>
	<h1>[주소록 목록]</h1>
	<a href="insert.jsp">주소록 추가</a>
	<%
		for(int i=0; i<array.size(); i++) {
			ADDVO vo=array.get(i);
			out.print("<div>");
				out.print(vo.getAno());
				out.print("<a href='read.jsp?ano=" + vo.getAno() + "'>" + vo.getAname() + "</a>");
				out.print(vo.getAddress());
			out.print("</div>");
		}
	%>
</body>
</html>