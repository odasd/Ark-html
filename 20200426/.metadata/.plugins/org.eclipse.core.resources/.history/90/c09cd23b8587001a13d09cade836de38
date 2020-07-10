<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project01.* ,java.util.* , java.sql.*" %>

<%
    String strsno=request.getParameter("sno");
	int sno=Integer.parseInt(strsno);
	
	SearchDAO dao=new SearchDAO();
	
	dao.delete(sno);
%>

<script>
	location.href="search.jsp";
</script>