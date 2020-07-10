<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String sid=request.getParameter("sid");

	String title=request.getParameter("title");
	
	String strlprice=request.getParameter("lprice");
	int lprice=Integer.parseInt(strlprice);
	
	String strhprice=request.getParameter("hprice");
	int hprice=Integer.parseInt(strhprice);
	
	String img=request.getParameter("img");
	
	ShopVO vo=new ShopVO();
	vo.setSid(sid);
	vo.setTitle(title);
	vo.setLprice(lprice);
	vo.setHprice(hprice);
	vo.setImg(img);
	
	ShopDAO dao=new ShopDAO();
	dao.insert(vo);
%>