<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생목록</title>
</head>
<body>
	<h1>[학생목록]</h1>
	<form action="list.jsp" method="get">
		<select name="type">
			<option value="sname" selected>학생명</option>
			<option value="sdept">학생학과</option>
			<option value="pname">지도교수</option>
		</select>
		<input type="text" name="word">
		<input type="submit" value="검색">
	</form>
	<table width=1000 border=1>
		<tr>
			<td>학번</td>
			<td>학생명</td>
			<td>학생학과</td>
			<td>생년월일</td>
			<td>지도교수명</td>
			<td>교수학과</td>
		</tr>
		<%	
			String type=request.getParameter("type")==null?"scode":request.getParameter("type");
			String word=request.getParameter("word")==null?"":request.getParameter("word");
			SDAO dao=new SDAO();
			ArrayList<SVO> list= dao.list(type, word);
			for(SVO vo:list){
				out.print("<tr>");
				out.print("<td>" + vo.getScode() + "</td>");
				out.print("<td>" + vo.getSname() + "</td>");
				out.print("<td>" + vo.getSdept() + "</td>");
				out.print("<td>" + vo.getBirthday() + "</td>");
				out.print("<td>" + vo.getPname() + "</td>");
				out.print("<td>" + vo.getDept() + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
</body>
</html>