<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.*, java.sql.* ,java.util.Date" %>


<% 
	String content=request.getParameter("content");

	ReplyDAO dao=new ReplyDAO();

	dao.insert(content);
%>

<script>
	alert("등록되었습니다.");
	location.href="list.jsp";
</script>