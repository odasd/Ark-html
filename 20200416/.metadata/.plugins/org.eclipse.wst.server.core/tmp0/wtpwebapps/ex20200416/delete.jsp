<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.* , java.sql.*" %>

<%

	String pno=request.getParameter("pno");

	ProductDAO dao= new ProductDAO();
	
	dao.delete(pno);


%>

<script>
	alert("삭제되었습니다.");
	location.href="list.jsp";
</script>