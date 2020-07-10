<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cafe.* , java.util.*, java.sql.*" %>

<%
	
	String Title=request.getParameter("title");
	String Content=request.getParameter("content");
	
	
	BlogVO vo=new BlogVO();
	vo.setTitle(Title);
	vo.setContent(Content);
	
	BlogDAO dao=new BlogDAO();
	dao.insert(vo);





%>

<script>
	alert("입력되엇습니다.");
	location.href="list.jsp";
</script>