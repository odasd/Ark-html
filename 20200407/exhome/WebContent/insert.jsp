<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="exhome.*" %>
<% 
	
request.setCharacterEncoding("UTF-8"); /* 한글 깨져서 이걸로 고침  리퀘스트라는 웹의 영역이 있음, 리퀘스트의 인코딩 방식은 Utf-8이다*/ 
String month=request.getParameter("month"); 
String manager=request.getParameter("manager");
String tel=request.getParameter("tel");
String strMmoney=request.getParameter("mmoney"); /* 리퀘스트에 저장된 프라이스 값을 가져오라는 뜻  parameter로 가져오는거임 */
int mmoney= Integer.parseInt(strMmoney);	/* 파라미터로 가져온 값은 무조건 스트링 값임 , 스트링값인  프라이스를 인트값으로 변경해준 것  */
					/* pares=문자를 숫자로 바꿔주는 것*/ /*request에 대한 Parameter값을 get(가져온다)한다?*/



DataVO vo=new DataVO();
vo.setMonth(request.getParameter("month"));
vo.setManager(manager);
vo.setMmoney(mmoney);
vo.setTel(tel);

DataDAO dao = new DataDAO();
dao.insert(vo);	/*dao의 insert값을 vo에 넣어주는 것*/






%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 입력 완료</title>
</head>
<body>
	<h1>데이터 입력 완료</h1>
	<a href="pthome.html">계속 입력하기</a>
</body>
</html>