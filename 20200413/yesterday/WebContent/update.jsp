<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yesterday.*, java.util.*, java.sql.*"%>

<%
	String strbno=request.getParameter("bno");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	int bno=Integer.parseInt(strbno);
	
	out.println(title);
    out.println(content);

	BlogVO vo=new BlogVO();
	BlogDAO dao= new BlogDAO();
	
	
	vo.setTitle(title);
	vo.setContent(content);
	vo.setBno(bno);
	
	dao.update(vo);
%>
<script>
	alert("수정되었습니다.");
	
	<%
	out.println("location.href='read.jsp?bno=" + bno +"'");
	%>
</script>



