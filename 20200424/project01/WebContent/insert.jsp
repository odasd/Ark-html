<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="project01.* ,java.util.* , java.sql.*" %>

<%
	String sname=request.getParameter("txtsearch");
    String sp=request.getParameter("sp");
	
    SearchDAO dao=new SearchDAO();
    
    dao.insert(sname, sp);

%>

<script>

 var text="<%= sp%>";
 var text2="<%= sname%>";
 

	if(text=="네이버") {
		window.open('https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query='+text2);
	}
	
	if(text=="다음") {
		window.open('https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q='+text2);
	}
	
	if(text=="구글") {
		window.open('https://www.google.com/search?q='+text2);
	}
	location.href="search.jsp";
</script>
