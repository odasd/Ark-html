<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
	<style>
		*{font-family:"배달의민족 주아";}
		h1,h3 {text-align:center;}
		#content {width:700px; background:#9aa6a2; color:white; margin:auto; padding:10px;}
		#tbl {margin:auto;}
		td{text-align:center;}
		.kor, .eng, .mat {text-align:right;}
		.row {color:black;}
		body {background:#fffff3;}
	</style>
</head>
<body>
	<h1>[성적처리]</h1>
	<div id="content">
		이름 : <input type="text" id="txtname">
		<hr>
		국어 : <input type="text" id="txtkor">
		<hr>
		영어 : <input type="text" id="txteng">
		<hr>
		수학 : <input type="text" id="txtmat">
		<hr>
		<input type="button" value="등록" id="btninsert">
		<h3>[성적목록]</h3>
		<table border=1 width=650 id="tbl">
			<tr class="title">
				<th>NO.</th>
				<th>name</th>
				<th>국어점수</th>
				<th>영어점수</th>
				<th>수학점수</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				GradeDAO dao=new GradeDAO();
				ArrayList<GradeVO> list=dao.list();
				for(int i=0; i<list.size(); i++) {
					GradeVO vo=list.get(i);
					int gno=vo.getGno();
					String gname=vo.getGname();
					int kor=vo.getKor();
					int eng=vo.getEng();
					int mat=vo.getMat();
					out.print("<tr class=row>");
					out.print("<td class=gno>" + gno + "</td>");
					out.print("<td class=gname>" + gname + "</td>");
					out.print("<td><input type=text class=kor size=4 value=" + kor + "></td>");
					out.print("<td><input type=text class=eng size=4 value=" + eng + "></td>");
					out.print("<td><input type=text class=mat size=4 value=" + mat + "></td>");
					out.print("<td><button class='update'>수정</button></td>");
					out.print("<td><button class='delete'>삭제</button></td>");
					out.print("</tr>");
				}
			%>
		</table>
	</div>
</body>
<script>
	$("#btninsert").on("click", function(){
		if(confirm("등록하시겠습니까?")==false) return;
		var gname=$("#txtname").val();
		var kor=$("#txtkor").val();
		var eng=$("#txteng").val();
		var mat=$("#txtmat").val();
		
		if(gname==""){
            alert("이름을 입력하세요!");
            $("#txtname").val("");
            $("#txtname").focus();
         }else if(kor==""|| kor.replace(/[0-9]/g,'')){
            alert("국어점수를 숫자로 입력하세요!");
            $("#txtkor").val("");
            $("#txtkor").focus();
         }else if(eng==""|| eng.replace(/[0-9]/g,'')){
            alert("영어점수를 숫자로 입력하세요!");
            $("#txteng").val("");
            $("#txteng").focus();
         }else if(mat==""    ||   mat.replace(/[0-9]/g,'')){
            alert("수학점수를 숫자로 입력하세요!");
            $("#txtmat").val("");
            $("#txtmat").focus();
         }else{
            location.href="sqlinsert.jsp?gname="+gname+"&kor="+kor+"&eng="+eng+"&mat="+mat;
         }
	});
	
	$("#tbl").on("click", ".row .delete", function(){
		var row=$(this).parent().parent();
		var gno=row.find(".gno").html();
	
		if(confirm(gno+"번을 삭제하시겠습니까?")==false) return;
			location.href="sqldelete.jsp?gno="+gno;
	});
	
	$("#tbl").on("click", ".row .update", function(){
		var row=$(this).parent().parent();
		var gno=row.find(".gno").html();
		var kor=row.find(".kor").val();
		var eng=row.find(".eng").val();
		var mat=row.find(".mat").val();
	
		if(confirm(gno+"번을 수정하시겠습니까?")==false) return;
		location.href="sqlupdate.jsp?gno="+gno+"&kor="+kor+"&eng="+eng+"&mat="+mat;
		
	});
</script>
</html>