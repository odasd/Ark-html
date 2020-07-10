<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex20200407.*" %>
<% 
	StudentVO vo = new StudentVO();
	vo.setSno(request.getParameter("sno")); //vo의 sno,  request.getParameter = 
	vo.setSname(request.getParameter("sname"));
	vo.setTel(request.getParameter("tel")); //parameter는 String형식을 get밖에 할수없음
	vo.setAddress(request.getParameter("address")); //address(웹에 저장된)라는 스트링 형식을 가진 데이터를 vo.setAddress에 저장하겠다. 
	
			
	StudentDAO dao=new StudentDAO();
	dao.insert(vo); //dao의 insert값을 vo에 저장하겠다
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입력완료</title>
</head>
<body>
	<h1>데이터가 입력되었습니다.</h1>
	<a href="ex03.html">계속 입력</a>
</body>
</html>