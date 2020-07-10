<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 추가</title>
</head>
<body>
	<h1>주소 추가</h1>
	<form action="sqlInsert.jsp">
		이름: <input type="text" name="aname">
		<hr>
		전화번호: <input type="text" name="tel">
		<hr>
		주소 : <textarea rows="5" cols="50" name="address"></textarea>
		<hr>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
</body>
</html>