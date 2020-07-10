<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yesterday.* , java.util.* , java.sql.*" %>
<%

 	String strbno=request.getParameter("bno");
	int bno=Integer.parseInt(strbno);
	
	BlogDAO dao=new BlogDAO();
	BlogVO vo=dao.read(bno);
%>



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
			<form action="update.jsp">
				<table>
					<tr>
						<td>글 번호</td>
						<td><input type="text" name="bno" value="<%= vo.getBno() %>"></td>
					</tr>
				
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="<%= vo.getTitle() %>"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea cols=30 rows=50 name="content"><%= vo.getContent() %></textarea></td>
						</tr>
						<tr>
							<td colspan=2 style="text-align:center;">
								<input type=reset value="취소">
								<input type=submit value="수정">
								<%out.print("<a href='delete.jsp?bno="+bno+"'><input type=button  value='삭제'></a>"); %>
							</td>
				
						</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>