<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="eee.*, java.text.*" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Blog</title>
	<link rel="stylesheet" href="home.css"/>
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>콩순이의 블로그입니다.</h1>
			<hr>
		</div>
	<div id="menu">
		<div class="item"><a href="insert.jsp">글쓰기</a></div>
	</div>
	<div id="content">
			<%
				BlogDAO dao=new BlogDAO();
				ArrayList<BlogVO> list=dao.list();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:dd");
				DecimalFormat df=new DecimalFormat("#, ###,00");
				
				for(int i=0; i<list.size(); i++) {
					BlogVO vo=list.get(i);
					String strDate=sdf.format(vo.getWdate());
					out.println("<div class='box'>");
						out.println("<h1 class='title'>" + vo.getBno() +". "+ vo.getTitle() + "</h1>");
						out.println("<h3 class='date'>" + strDate + "</h3>");
						out.println("<img src='pt.png'/width='240' height='180'>");
						out.println("<img src='pt2.png'/width='240' height='180'>");
						out.println("<img src='pt3.png'/width='240' height='180'>");
						out.println("<h3 class='article'>" + vo.getArticle() + "</h3>");
						out.println("<a href='sqlDelete.jsp?bno=" + vo.getBno() + "'>삭제</a>"); //""에 들어가는건 ''로 해줘야함
						//out.println("<a href='#' title='삭제'><img class='del.png' src=")
					out.println("</div>");
				}	

			%>
	</div>
		<div id="footer">
			<hr>
			<h3>작성자 : 노안 콩순이</h3>
		</div>
	</div>
</body>
</html>