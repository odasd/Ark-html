<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project01.* ,java.util.* , java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>검색엔진ㅋㅋ</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		#tbl {border:1px solid black; width:1000px; border-collapse:collapse;}
		#content {border:1px solid black;}
		th {border:1px solid black;}
		td {border:1px solid black;}
	</style>
</head>
<body>
	<h1>검색엔진</h1>
	<div>
	<form action="insert.jsp">
		<input type="text" name="txtsearch">
		<input type="submit" id="btnsearch" value="검색">
		네이버<input type="radio" name="sp" value="네이버" id="네이버">
		다음<input type="radio" name="sp" value="다음" id="다음">
		구글<input type="radio" name="sp" value="구글" id="구글">
	</form>
	</div>
	<div>
		<br>
		<hr>
		<br>
		<table id="tbl">
			<tr class="content">
				<th>검색 포털</th>
				<th>저장된 검색어</th>
				<th width=100>삭제</th>
			</tr>
			
			<%
				SearchDAO dao=new SearchDAO();
				ArrayList<SearchVO>	list=dao.list();
				
				for(int i=0; i<list.size(); i++) {
					SearchVO vo=list.get(i);
					out.print("<tr><td>"+vo.getSp()+"</td>");
					out.print("<td>"+vo.getSname()+"</td>");
					out.print("<td><a href='delete.jsp?sno="+vo.getSno()+"'><input type='button' value='삭제'></a></td></tr>");
				}
				
				
			%>
			
	
		</table>
		
	</div>
</body>
</html>