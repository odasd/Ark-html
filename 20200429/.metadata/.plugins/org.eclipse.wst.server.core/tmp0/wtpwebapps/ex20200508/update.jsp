<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200508.*" %>

<%
	String lcode=request.getParameter("lcode");
	String scode=request.getParameter("scode");
	String strgra=request.getParameter("grade");
	int grade=Integer.parseInt(strgra);
	
	DAO dao=new DAO();
	UVO vo=new UVO();
	
	vo.setLcode(lcode);
	vo.setScode(scode);
	vo.setGrade(grade);
	
	dao.update(vo);
%>
