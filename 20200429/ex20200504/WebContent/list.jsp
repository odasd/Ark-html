<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강좌별 평균점수</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		#page {margin:auto; width:1000px; text-align:center; border:2px solid black; border-radius:10px;}
		#tbl, #ctbl {margin:auto; margin-bottom:30px;}
		th {background:gray; color:white;}
	</style>
</head>
<body>
	<div id=page>
	<h1>[평균점수]</h1>
	<h1>서블릿</h1>
	<table border=1 width=700 id="tbl">
	
		<tr class="title">
			<th>강좌코드</th>
			<th>강좌명</th>
			<th>교수명</th>
			<th>평균점수</th>
		</tr>
		<%	
			EnrollDAO dao=new EnrollDAO();
			ArrayList<EnrollVO> list=dao.clist();
			for(EnrollVO vo:list) {
				out.println("<tr class=title>");
				out.println("<td>" + vo.getLcode() + "</td>");
				out.println("<td>" + vo.getLname() + "</td>");
				out.println("<td>" + vo.getPname() + "</td>");
				out.println("<td>" + vo.getAvg() + "</td>");
				out.println("</tr>");
			}
			
		%>
	</table>
		<h1>핸들바</h1>
		<table id="ctbl" border=1 width=700></table>
		<script id="temp" type="text/x-handlebars-template">
				<tr class=title>
					<th>강좌코드</th>
					<th>강좌이름</th>
					<th>교수명</th>
					<th>평균점수</th>
				</tr>
			{{#each clist}}
				<tr class=row>
					<td class=lcode>{{lcode}}</td>
					<td>{{lname}}</td>
					<td>{{pname}}</td>
					<td>{{avg}}</td>
				</tr>
			{{/each}}
		</script>
	</div>
</body>
<script>
	$.ajax({
		type:"get",
		url:"json.jsp",
		dataType:"json",
		success:function(data){
			var temp=Handlebars.compile($("#temp").html());
			$("#ctbl").html(temp(data));	
		}
	});
</script>
</html>