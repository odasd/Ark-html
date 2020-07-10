<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strBno=request.getParameter("bno"); //몇번째 프라이머리 키의 다른 스키마 튜플들을 불러올지 알아야함으로 bno를 리쿼스트를 함
	int bno=Integer.parseInt(strBno);	//VO클래스에 getBno메서드는 애초에 인트값을 받는걸로 만들어서 타입변환을 해야만 메서드를 사용 가능함
	BBSDAO dao=new BBSDAO(); //dao클래스 연결
	BBSVO vo=dao.read(bno); //vo클래스에 dao클래스의 리드 메서드로 치환하는데 그 값은 리퀘스트에서 가져온 bno값임
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
</head>
<body>
	<h1>글읽기</h1>
	<a href="list.jsp">목록</a>
	<form action="sqlUpdate.jsp">
		<input type="hidden" name="bno" value="<%=bno%>"> <!-- 삭제버튼을 눌렀을때 실행될 jsp에서 몇번째 프라이머리 키의 값을 삭제할지 알아야해서 불러오긴 하나 보여줄 필요가 없음으로 출력방식이 히든이다, 그러므로 bno값은 리퀘스트에서 온 값이다 -->
		제목: <input type="text" name="title" value="<%= vo.getTitle() %>"> <!-- vo에 저장된 dao.read(bno)에 저장된 값을 불러오기위해 사용함 -->
		<hr>
		내용: <textarea rows="5" cols="50" name="content"><%= vo.getContent() %></textarea> <!-- vo에 저장된 dao.read(bno)에 저장된 값을 불러오기위해 사용함 -->
		<hr>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" value="삭제" onClick="location.href='sqlDelete.jsp?bno=<%= vo.getBno() %>'"> <!-- =은 프린트와 같다는 뜻임 , 삭제할 글 번호에 맞는 값을 불러오기 위함임 -->
		<input type="button" value="목록" onClick="location.href='list.jsp'">
	</form>
</body>
</html>