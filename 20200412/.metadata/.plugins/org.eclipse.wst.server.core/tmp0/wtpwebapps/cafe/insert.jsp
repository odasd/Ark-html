<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cafe.*, java.util.*, java.sql.* "  %>




<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>말콩순이</title>
</head>
<body>
	<div id="page">
		<div id="content">
		<a href="list.jsp">목록으로~</a>
			<form action="sqlinsert.jsp">
				<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea cols=30 rows=50 name="content">내용을 입력하세요</textarea></td>
						</tr>
						<tr>
							<td colspan=2 style="text-align:center;">
								<input type=reset value="취소">
								<input type=submit value="저징">
							</td>
				
						</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>