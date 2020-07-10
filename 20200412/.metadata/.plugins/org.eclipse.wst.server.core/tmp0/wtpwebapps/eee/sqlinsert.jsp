<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="eee.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<% 
	String title=request.getParameter("title");
	String article=request.getParameter("article");
	
	out.println(title);
	out.println(article);
	
	BlogVO vo=new BlogVO();
	vo.setTitle(title);
	vo.setArticle(article);
	
	BlogDAO dao=new BlogDAO();
	dao.insert(vo);
	
	out.println("저장되었습니다.");
	
	
 %>
<script>
	alert("저장되었씁니다.")
	location.href="list.jsp";

</script>
<!--

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>저장</title>
</head>
<body>
	<h3>저장되었습니다.</h3>
	
</body>
</html>

-->