<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.*, java.sql.* ,java.util.Date" %>

<% 
	String strrno=request.getParameter("rno");
	int rno=Integer.parseInt(strrno);
	
	
	ReplyDAO dao=new ReplyDAO();
	
	dao.delete(rno);
	
	
	

%>

<script>
	alert("삭제되었습니다.");
	location.href="list.jsp";
</script>