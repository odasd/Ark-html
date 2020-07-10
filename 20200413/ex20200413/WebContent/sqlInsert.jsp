<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.* " %>

<%
	String title=request.getParameter("title"); //괄호 안의 값은 form에서 준 값임
	String content=request.getParameter("content");
	
	out.println("<h1>" + title + "</h1>");
	out.println("<h1>" + content + "</h1>");

	BBSVO vo=new BBSVO();
	vo.setTitle(title);
	vo.setContent(content);
	
	BBSDAO dao=new BBSDAO();
	
	dao.insert(vo);

%>

<script>
	alert("저장되었습니다.");
	location.href="list.jsp";
</script>