<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200429.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		.title {text-align:center; background:gray; color:white;}
		.row {text-align:center;}
		.row:hover {background:skyblue; color:white; cursor:pointer;}
		#slist, #clist {display:none;}
		button {cursor:pointer;}
		#students {width:680px; background:gray; color:white; padding:10px; display:none;}
		#courses {width:680px; background:gray; color:white; padding:10px; margin-top:10px;display:none;}
	</style>
</head>
<body>
	<h1>[학생목록]</h1>
	<table border=1 width=700 id="tbl">
		<tr class="title">
			<td>학번</td>
			<td>학생명</td>
			<td>학과</td>
			<td>생년월일</td>
			<td>지도교수</td>
			<td>수강신청</td>
		</tr>
		<%	
			SDAO sdao=new SDAO();
			ArrayList<SVO> list=sdao.list("%%");
			for(SVO vo:list) {
				out.println("<tr class=row>");
				out.println("<td class=scode>" + vo.getScode() + "</td>");
				out.println("<td class=sname>" + vo.getSname() + "</td>");
				out.println("<td>" + vo.getSdept() + "</td>");	
				out.println("<td>" + vo.getBirthday() + "</td>");
				out.println("<td>" + vo.getAdvisor() + "</td>");
				out.println("<td><button>수강신청</button></td>");
				out.println("</tr>");
			}
		%>
	</table>
	<div id="enroll">
		<h1>수강신청목록</h1>
		<div id=students>
			학번 : <span id="scode"></span>
			성명 : <span id="sname"></span>
		</div>
		<div id="courses">
			강좌명 : 
			<select id="lcode"></select>
			<script id="temp" type="text/x-handlebars-template">
			{{#each clist}}
				<option value={{lcode}}>{{lcode}}:{{lname}}</option>
			{{/each}}
			</script>
			<input type="button" value="신청" id="btnEnroll">
		</div>
		<table id="etbl" border=1 width=700></table>
		<script id="temp2" type="text/x-handlebars-template">
				<tr class=title>
					<td>강좌코드</td>
					<td>강좌이름</td>
					<td>수강신청일</td>
					<td>점수</td>
					<td>수강취소</td>
				</tr>
			{{#each elist}}
				<tr class=row>
					<td class=lcode>{{lcode}}</td>
					<td>{{lname}}</td>
					<td>{{edate}}</td>
					<td>{{grade}}</td>
					<td><button>수강취소</button</td>
				</tr>
			{{/each}}
		</script>
	</div>
</body>
<script>
	var scode;
	
	$("#tbl").on("click", ".row button", function(){
		var row=$(this).parent().parent();
		scode=row.find(".scode").html();
		var sname=row.find(".sname").html();
		$("#scode").html(scode);
		$("#sname").html(sname);
		$("#students").show();
		$("#courses").show();
		
		getlist();
	});
	
	$.ajax({
		type:"get",
		url:"cjson.jsp",
		dataType:"json",
		success:function(data){
			var temp=Handlebars.compile($("#temp").html());
			$("#lcode").html(temp(data));
			
		}
	});
	
	function getlist(){
		$.ajax({
			type:"get",
			url:"ejson.jsp",
			data:{"scode" : scode},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp2").html());
				$("#etbl").html(temp(data));
			}
		});
	}
	
	$("#enroll").on("click", "#btnEnroll" ,function(){
		var row=$(this).parent().parent();
		var select = document.getElementById("lcode");
		var option_value = select.options[select.selectedIndex].value;
		scode=row.find("#scode").html();
		//alert(scode);
		//alert(option_value);
		$("#scode").html(scode);
		//$("#lcode").html(option_value);
		if(confirm("수강신청하시겠습니까?")==false) return;
		$.ajax({
			type:"get",
			url:"insert.jsp",
			data:{"lcode": option_value,"scode":scode},
			dataType:"json"
			//success:function(){
				//getlist();
			//} 
		
		});
		getlist();
	});
	
	$("#etbl").on("click", ".row button", function(){
		var row=$(this).parent().parent();
		var row2=$(this).parent().parent().parent().parent();
		scode=row2.find("#scode").html();
		var lcode=row.find(".lcode").html();
		if(confirm("수강취소하시겠습니까?")==false) return;
		$.ajax({
			type:"get",
			url:"delete.jsp",
			data:{"scode":scode,"lcode":lcode},
			dataType:"json"
			
		});
		getlist();
	});
</script>
</html>