<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200508.*, org.json.simple.*"%>

<%
	String lcode=request.getParameter("lcode");
	
	DAO dao=new DAO();
	JSONObject jObject=dao.celist(lcode);
	out.println(jObject);
%>