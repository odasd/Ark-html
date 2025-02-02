<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.* , java.sql.* , java.text.*" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품목록</title>
	<link rel="stylesheet" href="home.css">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>.del {cursor:pointer;}</style>
</head>
<body>
	<h1>[상품목록]</h1>
	<div id="content">
	<div id="menu">
			<button class="btn">1</button>
			<button class="btn">2</button>
			<button class="btn">3</button>
			<button class="btn">4</button>
			<button class="btn">5</button>
			<button class="btn">6</button>
			<a href="insert.html">[상품등록]</a>
		</div>
		<%
			ProductDAO dao=new ProductDAO();
			ArrayList<ProductVO> list=dao.list();
			
			for(int i=0; i<list.size(); i++) {
				
				ProductVO vo=list.get(i);
				DecimalFormat df=new DecimalFormat("#,###원");
				String strPrice=df.format(vo.getPrice());
				out.print("<div class='box'> ");
				out.print("<img src='http://www.placehold.it/150x150'>");
				out.print("<div class='pname'>" + vo.getPname() + "</div>");
				out.print("<div class='price'>" + strPrice + "</div>");
				out.print("<div class='del' pno=" + vo.getPno()+">삭제</div>");
				out.print("</div>");
			}
		%>
	</div>
	<div id="darken-background">
		 <div id="lightbox">
			 <img src="http://placehold.it/500x500"/>
			 <button id="btnclose">닫기</button>
			 <div id="txtname">상품명 : </div>
			 <div id="txtprice">가격 : </div>
		 </div>
	 </div>
</body>
<script>

	$(".box").on("click" , ".del" , function(){
		var pno=$(this).attr("pno");
		if(confirm(pno + "을(를) 삭제하시겠습니까?")==false) return;
		location.href="delete.jsp?pno="+pno;
	});

	$("#menu").on("click" , ".btn", function(){
		var num=$(this).html();
		$("#content").css("width" , num*190);
	});
	
	$(".box").on("click" , "img" , function(){
		var box=$(this).parent();
		
		var pname=box.find(".pname").html();
		var price=box.find(".price").html();
		
		$("#txtname").html("상품명 : " + pname);
		$("#txtprice").html("가격 : " + price);
		
		$("#darken-background").show();
	});
	
	$("#btnclose").on("click" , function(){
		$("#darken-background").hide();
	});
</script>
</html>