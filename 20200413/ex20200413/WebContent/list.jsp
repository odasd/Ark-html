<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.*" %>
<%

	BBSDAO dao=new BBSDAO();
	ArrayList<BBSVO> array=dao.list();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<style>
		div {background:gray; color:white; font-size:30px;}
	</style>
</head>
<body>
	<h1>[게시판 목록]</h1>
	<a href="insert.jsp">글쓰기</a>
	<%
		for(int i=0; i<array.size(); i++) {
			BBSVO vo=array.get(i);
			out.print("<div>");
				out.print(vo.getBno());
				out.print("<a href='read.jsp?bno=" + vo.getBno() + "'>" + vo.getTitle() + "</a>");
				out.print(vo.getContent());
			out.print("</div>");
		}
	%>
</body>
</html>