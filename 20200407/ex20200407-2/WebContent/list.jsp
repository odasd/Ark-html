<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>   
<%@ page import="java.util.*" %>
<%
	ProductDAO dao=new ProductDAO();
	ArrayList<ProductVO> array=dao.list();
	
%>    
    
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품목록]</title>
</head>
<body>
	<h1>[상품목록]</h1>
	<table border=1 width=500>
		<tr>
			<th width=100>상품번호</th>	
			<th width=300>상품명</th>
			<th width=100>가격</th>
		</tr>
		<!-- 데이터 읽어서 출력 -->
		<%
			for(int i=0; i<array.size(); i++) {
				ProductVO vo=array.get(i);
				
				out.println("<tr>");
				out.println("<td>" + vo.getPno() + "</td>"); //<td>는 칸을 나타냄 - 한줄에 3칸이 있다
				out.println("<td>" + vo.getPname() + "</td>");
				out.println("<td>" + vo.getPrice() + "</td>");
				out.println("</tr>");
			}		// 한줄에 존재하는 3칸에 vo.getPno, vo.getPname, vo.getPrice를 출력한다
		// 이 안에는 자바 문법만 사용 가능
		%>
	</table>
	<a href="ex01.html">상품등록</a>
</body>
</html>