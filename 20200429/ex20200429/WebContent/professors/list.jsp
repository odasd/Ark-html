<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200429.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교수목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		.title {text-align:center; background:gray; color:white;}
		.row:hover {background:orange; color:white; cursor:pointer;}
		#slist, #clist {display:none;}
	</style>
</head>
<body>
	<div id="menu">
		<a href="/ex20200429/professors/list.jsp">교수관리</a>
		<a href="/ex20200429/students/list2.jsp">학생관리</a>
		<a href="/ex20200429/courses/clist.jsp">강좌관리</a>
	</div>
	<h1>[교수목록]</h1>
	<table id="tbl" border=1 width=700>
		<tr class="title">
			<th>교수번호</th>
			<th>교수이름</th>
			<th>소속학과</th>
			<th>생년월일</th>
			<th>교수직급</th>
			<th>교수급여</th>
		</tr>
		<%
			PDAO dao=new PDAO();
			ArrayList<PVO> list=dao.list();
			for(PVO vo:list) {
				out.println("<tr class=row>");
				out.println("<td class=pcode>" + vo.getPcode() + "</td>");
				out.println("<td class=pname>" + vo.getPname() + "</td>");
				out.println("<td>" + vo.getPdept() + "</td>");
				out.println("<td>" + vo.getHiredate() + "</td>");
				out.println("<td>" + vo.getTitle() + "</td>");
				out.println("<td>" + vo.getSalary() + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<div id="slist">
		<h1>[학생목록]</h1>
		<div>담당교수 : <span class="pname"></span></div>
		<table id="stbl" border=1 width=700></table>
		<script id="stemp" type="text/x-handlebars-template">
			<tr class=title>
				<td>학생번호</td>
				<td>학생이름</td>
				<td>소속학과</td>
				<td>학생학년</td>
				<td>학생생일</td>
			</tr>
			{{#each slist}}
				<tr class=row>
					<td>{{scode}}</td>
					<td>{{sname}}</td>
					<td>{{sdept}}</td>
					<td>{{year}}</td>
					<td>{{birthday}}</td>
				</tr>
			{{/each}}
		</script>
	</div>
	<div id="clist">
		<h1>[강좌목록]</h1>
		<div>담당교수 : <span class="pname"></span></div>
		<table id="ctbl" border=1 width=700></table>
		<script id="ctemp" type="text/x-handlebars-template">
			<tr class=title>
				<td>강좌번호</td>
				<td>강좌이름</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td>최대수강인원</td>
				<td>수강신청인원</td>
			</tr>
			{{#each clist}}
				<tr class=row>
					<td>{{lcode}}</td>
					<td>{{lname}}</td>
					<td>{{hours}}</td>
					<td>{{room}}</td>
					<td>{{capacity}}</td>
					<td>{{persons}}</td>
				</tr>
			{{/each}}
		</script>
	</div>
</body>
<script>
	var pcode;	
		
	$("#tbl").on("click", ".row", function(){
		pcode=$(this).find(".pcode").html();
		var pname=$(this).find(".pname").html();
		$("#slist").show();
		$("#clist").show();
		$("#slist .pname").html(pname);
		$("#clist .pname").html(pname);
			
		getlist();
	});
	
	function getlist(){
	$.ajax({
		type:"get",
		url:"json.jsp",
		dataType:"json",
		data:{"pcode" : pcode},
		success:function(data){
			var temp=Handlebars.compile($("#stemp").html());
			$("#stbl").html(temp(data));
			var temp=Handlebars.compile($("#ctemp").html());
			$("#ctbl").html(temp(data));
		}
	});
	}
</script>
</html>