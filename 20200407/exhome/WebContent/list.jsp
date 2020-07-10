<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="exhome.*" %>
<%@ page import="java.util.*" %>

<%

DataDAO dao=new DataDAO();
ArrayList<DataVO> array=dao.list();

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록출력</title>
</head>
<body>
	<h1>목록출력 </h1>
		<table border=1 width=500>
			<tr>
				<th width=100>월</th>
				<th width=100>매니저 이름</th>
				<th width=100>매출액</th>
				<th width=200>연락처</th>
			</tr>
			<% 
				for(int i=0; i<array.size(); i++) {
			
					DataVO vo=array.get(i);
					
					
				out.println("<tr>");
				out.println("<td>" + vo.getMonth() + "</td>");
				out.println("<td>" + vo.getManager() + "</td>");
				out.println("<td>" + vo.getMmoney() + "</td>");
				out.println("<td>" + vo.getTel() + "</td>");
				out.println("</tr>");
				}
			%>
		</table>
		<a href="pthome.html">데이터 입력하자</a>
		
</body>
</html>