<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.* , java.sql.*"%>

<%
	String strAno=request.getParameter("ano");
	int ano=Integer.parseInt(strAno);
	
	ADDDAO dao=new ADDDAO();
	
	dao.delete(ano);

%>
<script>
	alert("삭제되었습니다.");
	location.href="list.jsp";
</script>