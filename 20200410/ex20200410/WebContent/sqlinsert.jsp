<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>


<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	

	
	out.print(title);
	out.print(content);
	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=new BoardVO();
	
	vo.setTitle(title);
	vo.setContent(content);
	dao.insert(vo);
%>

<script>
	
	alert("저장되었습니다.")
	location.href="list.jsp";

</script>