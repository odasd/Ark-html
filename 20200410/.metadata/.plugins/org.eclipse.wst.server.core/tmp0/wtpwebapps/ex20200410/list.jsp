<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="home.css">
</head>
<body>
	<div id="page">
		<div id="content">
			<h3>게시판 목록</h3>
			<hr>
			<div id="menu">
				<a href="insert.html">입력</a>
			</div>
			<table class="tbl">
				<tr class="title">
					<td height=30>No.</td>
					<td width=150 height=30>Title</td>
					<td height=30>Date</td>
				</tr>
				<%
					BoardDAO dao=new BoardDAO();
					ArrayList<BoardVO> list=dao.list();
					
					for(int i=0; i<list.size(); i++) {
						
						BoardVO vo=new BoardVO();
						vo=list.get(i);
						int bno=vo.getBno();
						String title=vo.getTitle();
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						String date = sdf.format(vo.getWdate());
						out.println("<tr class='data'>");
						out.println("<td>" + bno + "</td>");
						out.println("<td><a href='read.jsp?bno=" + bno + "'>" + title + "</a></td>");
						out.println("<td>" + date + "</td>");
						out.println("</tr>");
					}
				
				
				%>
			</table>
		</div>
	</div>
</body>
</html>