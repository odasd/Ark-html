<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.* , java.sql.*"%>

<%
	String pname=request.getParameter("pname");
	String strprice=request.getParameter("price");
	int price=Integer.parseInt(strprice);
	
	ProductDAO dao=new ProductDAO();
	ProductVO vo=new ProductVO();
	
	vo.setPname(pname);
	vo.setPrice(price);
	dao.insert(vo);

%>

<script>
	alert("저장되었습니다.");
	location.href="list.jsp";
</script>