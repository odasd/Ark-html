<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yesterday.*" %>
<%@ page import="java.util.* , java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>말콤의 은밀한 이중생활</title>
	<style>
		* {font-family:"배달의민족 주아"}
		#page {background:#6a6a6a; width:1000px; padding-top:10px; margin:auto;}
		table {background:white; margin:auto; border:2px solid black; border-radius:10px; width:700px;}
		table .title  {border:2px soild black;}
		
	</style>
</head>
<body>
	<div id="page">
		<h1>말콤파워!의 목록</h1>
		<br>
		<hr>
		<br>
		<a href="insert.jsp">뻐튼</a>
		<div id="content">
			<table>
				<tr class="title">
					<th>넘바</th>
					<th>제목</th>
					<th>내용</th>
				</tr>
				
<%			

				BlogDAO dao=new BlogDAO();
				ArrayList<BlogVO> list=dao.list();
				
				
				
				for(int i=0; i<list.size(); i++) {
				
				BlogVO vo=new BlogVO();
				vo=list.get(i);
				
				int bno=vo.getBno();
				String title=vo.getTitle();
				String content=vo.getContent();
				
				out.print("<tr class='td'>");
					out.print("<td>"+ vo.getBno() +"</td>");
					out.print("<td><a href='read.jsp?bno="+ bno + "'>" + vo.getTitle() + "</a></td>");
					out.print("<td>"+ vo.getContent() +"</td>");
				out.print("</tr>");
				
				}
%>
				
		
			</table>
		<br>
		<hr>
		<br>
		</div>
	</div>
</body>
</html>