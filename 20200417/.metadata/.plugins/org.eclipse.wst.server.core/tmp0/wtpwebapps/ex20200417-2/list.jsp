<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.*, java.sql.* ,java.util.Date" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>댓글관리</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		#page {background:gray; width:1000px; margin:auto; padding:10px; text-align:center;}
		h1 {text-align:center;}
		.box{width:700px; border:1px solid black; padding:10px; text-align:center; margin:auto;}
		.date {width:300px; font-size:20px; color:black; text-align:left;}
		#heart {float:right;}
		.content{padding:10px; font-size:15px; background:white;}
		.cnt {font-size:12px; color:red; text-align:right;}
		.title {overflow:hidden;}
		#btninsert {float:center;}
		.like {text-align:right;}
	</style>
</head>
<body>
	<div id="page">
	<h1>[댓글관리]</h1>
		<div>
			<input type="text" id=content size=90>
			<input type="button" value="저장" id=btninsert>
			<hr>
		</div>
		

	<%
	ReplyDAO dao=new ReplyDAO();
	ArrayList<ReplyVO> list=dao.list();
	for(int i=0; i<list.size(); i++) {
		ReplyVO vo=list.get(i);
		
		int rno=vo.getRno();
		String content=vo.getContent();
		Date wdate=vo.getWdate();
		int cnt=vo.getCnt();
		
		out.println("<div class=box>");
        out.println("<div class=title>");
        out.println("<div class=like rno=" + rno + ">");
        out.println("<button class=delete style=color:red>X</button>");
        out.println("<button class=update style=color:red>♥</button>");
        out.println("<span class='cnt'>" + cnt + "</span>");
        out.println("</div>");
        out.println("<div class=date>" + wdate + "</div>");
        out.println("</div>");
        out.println("<div class=content>");
        out.println(content);
        out.println("</div>");
        out.println("</div>");
		
	}
	
	%>
		</div>
</body>
<script>
	$(".box").on("click" , ".delete", function(){
		var rno=$(this).parent().attr("rno");
		if(confirm(rno + "번을 삭제하시겠습니까?")==false) return;
		location.href="sqldelete.jsp?rno="+rno;
	});
	
	$(".box").on("click" , ".update" , function(){
		var rno=$(this).parent().attr("rno");
		if(confirm(rno+"번을 좋아요! 하실래요?")==false) return;
		location.href="sqlupdate.jsp?rno="+rno;
	});
	
	$("#btninsert").on("click" , function(){
		if(confirm("댓글을 저장하시겠습니까?")==false) return;
		var content=$("#content").val();
		if(content==""){
			alert("내용을 입력하세요.")
		} else {
			location.href="sqlinsert.jsp?content="+content;
		}
	});
</script>
</html>