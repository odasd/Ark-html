<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="ex01.*" %>

<%
	String query=request.getParameter("query");
	String display=request.getParameter("display");
	String start=request.getParameter("start");
	String result=NaverAPI.search(query, display, start); //스테틱 메서드는 클래스를 만들지않고 바로 출력가능
	out.println(result);
%>