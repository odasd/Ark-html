<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200429.*, java.util.*" %>

<%
	String lcode=request.getParameter("lcode");
	String scode=request.getParameter("scode");
	
	EDAO edao=new EDAO();
	
	edao.delete(lcode, scode);
%>