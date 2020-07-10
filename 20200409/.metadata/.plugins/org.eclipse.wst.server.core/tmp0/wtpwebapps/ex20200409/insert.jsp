<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>블로그 글 쓰기</title>
	<link rel="stylesheet" href="home.css"/>
	<style>
	.tbl {border:3px soild black; border-collapse:collapse; margin:20px auto; width:700px;}
	.tbl td,tr {padding:10px; text-align:center; border:2px soild black;}
	.tbl th {margin:20px auto;}
	.insert {text-align:center; padding:5px;}
	.box {width:800px; height:300px;}
	</style>
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>콩순이의 블로그다!</h1>
		</div>
		<div id="content">
			<div id="menu">
				<div class="item"><a href="list.jsp">목록으로</a></div>
			</div>
			<div class="box">
				<form action="sqlinsert.jsp">
					<table class="tbl" border=1 width=700>
						<tr>
							<th width=120>제목</th>
							<td><input type="text" size=80 name="title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="80" name="article"></textarea></td>
						</tr>	
					</table>
						<div class="insert">
							<input type="submit" value="저장">&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소">
						</div>
				</form>
			</div>
		</div>
		<div id="footer">
			<h3>작성자 : 콩순이</h3>
		</div>
	</div>
</body>
</html>