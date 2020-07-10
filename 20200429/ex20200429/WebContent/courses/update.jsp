<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200429.*, java.util.*, org.json.simple.*"%>

<%
	String strgrade=request.getParameter("grade");
	int grade=Integer.parseInt(strgrade);
	String scode=request.getParameter("scode");
	String lcode=request.getParameter("lcode");
	
	EDAO edao=new EDAO();
	EVO vo=new EVO();
	
	vo.setGrade(grade);
	vo.setScode(scode);
	vo.setLcode(lcode);
	
	edao.update(vo);
%>