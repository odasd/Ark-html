<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강의목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		.row {cursor:pointer;}
	</style>
</head>
<body>
	<h1>[강의목록]</h1>
	<form action="list2.jsp">
		<select name=type>
			<option value="lname">강좌명</option>
			<option value="lcode">강좌코드</option>
			<option value="pname">교수명</option>
			<option value="pdept">교수학과</option>
		</select>
		<input type="text" name="word">
		<input type="submit" value="검색">
	</form>
	<table width=700 border=1 id="tbl">
		<tr>
			<td>강좌코드</td>
			<td>강좌명</td>
			<td>강의실</td>
			<td>교수명</td>
			<td>교수학과</td>
		</tr>
		<%	//:은 아니면 이라는뜻
			String type=request.getParameter("type")==null?"lcode":request.getParameter("type");
			String word=request.getParameter("word")==null?"":request.getParameter("word");
		
			CDAO dao=new CDAO();
			ArrayList<CVO> list=dao.list(type, word);
			for(CVO vo:list) {
				out.println("<tr class=row>");
				out.println("<td class=lcode>" + vo.getLcode() + "</td>");
				out.println("<td class=lname>" + vo.getLname() + "</td>");
				out.println("<td>" + vo.getRoom() + "</td>");
				out.println("<td>" + vo.getPname() + "</td>");
				out.println("<td>" + vo.getPdept() + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
		<div id="students">
			<h3><span id="lname"></span></h3>
			<table id="tbl1" border=1 width=700></table>
			<script id="temp" type="text/x-handlebars-template">
					<tr>
						<td>학생번호</td>
						<td>학생명</td>
						<td>수강신청일</td>
						<td>성적</td>
					</tr>
				{{#each items2}}
					<tr>
						<td>{{scode}}</td>
						<td>{{sname}}</td>
						<td>{{edate}}</td>
						<td>{{grade}}</td>
					</tr>
				{{/each}}
			</script>
		</div>	
</body>
<script>


	//테이블의 각 행을 클릭할때 
	$("#tbl").on("click", ".row", function(){
		var lname=$(this).find(".lname").html();
		$("#lname").html(lname + "을(를) 수강하는 학생 목록");
		
		var lcode=$(this).find(".lcode").html();
		$.ajax({
			type:"get",
			url:"students.jsp",
			dataType:"json",
			data:{"lcode" : lcode},
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl1").html(temp(data));
			}
		});
	});
	
</script>
</html>