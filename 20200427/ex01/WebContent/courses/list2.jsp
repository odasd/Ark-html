<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강좌목록</title>
</head>
<body>
	<h1>[강좌목록]</h1>
	<form action="list2.jsp" method="get">
		<select name="type">
			<option value="lcode" selected>강좌코드</option>
			<option value="lname">강좌명</option>
			<option value="pname">지도교수</option>
		</select>
		<input type="text" name="word">
		<input type="submit" value="검색">
	</form>
	<table width=1000 border=1>
		<tr>
			<td>강좌코드</td>
			<td>강좌이름</td>
			<td>강의실</td>
			<td>지도교수명</td>
			<td>교수학과</td>
		</tr>
		<%	
			String type=request.getParameter("type")==null?"lcode":request.getParameter("type");
			String word=request.getParameter("word")==null?"":request.getParameter("word");
			CDAO dao=new CDAO();
			ArrayList<CVO> list= dao.list(type, word);
			for(CVO vo:list){
				out.print("<tr>");
				out.print("<td>" + vo.getLcode() + "</td>");
				out.print("<td>" + vo.getLname() + "</td>");
				out.print("<td>" + vo.getRoom() + "</td>");
				out.print("<td>" + vo.getPname() + "</td>");
				out.print("<td>" + vo.getDept() + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
</body>
</html>