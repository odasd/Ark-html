<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200506.*, java.util.* , java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>점수 총계</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		#page {margin:auto; float:center; text-align:center;}
		#tbl,#ctbl {margin:auto; float:center; text-align:center;}
		th {background:gray; color:pink;}
		.row:hover{background:skyblue; color:white;}
	</style>
</head>
<body>
	<div id=page width=1000>
	<h1>[강좌별 평균점수]</h1>
	<table border=1 width=700 id=tbl>
		<tr>
			<th>강좌번호</th>
			<th>강좌명</th>
			<th>교수명</th>
			<th>강의실</th>
			<th>평균점수</th>
			<th>수강인원</th>
		</tr>
		<%
			EDAO edao=new EDAO();
			ArrayList<CVO> list=edao.clist();
			for(CVO vo:list) {
				out.println("<tr class=row>");
				out.println("<td>" + vo.getLcode() + "</td>");
				out.println("<td>" + vo.getLname() + "</td>");
				out.println("<td>" + vo.getPname() + "</td>");
				out.println("<td>" + vo.getRoom() + "</td>");
				DecimalFormat df=new DecimalFormat("##0.00");
				String strAvg=df.format(vo.getAvg());
				out.println("<td>" + strAvg + "</td>");
				out.println("<td>" + vo.getCount() + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<h1>학생별 평균점수</h1>
	<table border=1 width=700 id=tbl>
		<tr>
			<th>학번</th>
			<th>학생명</th>
			<th>학생학과</th>
			<th>평균점수</th>
			<th>수강과목수</th>
		</tr>
		<%
			SDAO sdao=new SDAO();
			ArrayList<SVO> list2=sdao.slist();
			for(SVO vo:list2) {
				out.println("<tr class=row>");
				out.println("<td>" + vo.getScode() + "</td>");
				out.println("<td>" + vo.getSname() + "</td>");
				out.println("<td>" + vo.getSdept() + "</td>");
				DecimalFormat df=new DecimalFormat("##0.00");
				String strAvg=df.format(vo.getAvg());
				out.println("<td>" + strAvg + "</td>");
				out.println("<td>" + vo.getCount() + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
		<h1>제이손~</h1>
		<table id="ctbl" border=1 width=700></table>
		<script id="ctemp" type="text/x-handlebars-template">
				<tr class=title>
					<th>강좌번호</th>
					<th>강좌명</th>
					<th>교수명</th>
					<th>강의실</th>
					<th>평균점수</th>
					<th>수강인원</th>
				</tr>
			{{#each elist}}
				<tr class=row>
					<td class=lcode>{{lcode}}</td>
					<td>{{lname}}</td>
					<td>{{pname}}</td>
					<td>{{room}}</td>
					<td>{{avg}}</td>
					<td>{{count}}</td>
				</tr>
			{{/each}}
		</script>
	</div>
</body>
<script>
$.ajax({
	type:"get",
	url:"ejson.jsp",
	dataType:"json",
	success:function(data){
		var temp=Handlebars.compile($("#ctemp").html());
		$("#ctbl").html(temp(data));	
	}
});
</script>
</html>