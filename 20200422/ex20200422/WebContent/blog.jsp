<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="ex20200422.*" %>
<%
	String url="https://openapi.naver.com/v1/search/blog.json";
	String query=request.getParameter("query");
	String display=request.getParameter("display");
	String start=request.getParameter("start");
	String result=NaverAPI.search(url, query, display, start);
	out.println(result);
%>