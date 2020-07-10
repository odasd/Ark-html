<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>

<%
	String sid= request.getParameter("sid");
	
	String strlprice=request.getParameter("lprice");
	int lprice = Integer.parseInt(strlprice);
	
	String strhprice=request.getParameter("hprice");
	int hprice = Integer.parseInt(strhprice);
	
	ShopVO vo= new ShopVO();
	vo.setSid(sid);
	vo.setLprice(lprice);
	vo.setHprice(hprice);
	ShopDAO dao = new ShopDAO();
	dao.update(vo);
%>