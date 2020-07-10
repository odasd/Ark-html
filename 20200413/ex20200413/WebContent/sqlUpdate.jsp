<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.* , java.util.* , java.sql.* "%>

<%

	String strBno=request.getParameter("bno"); //리쿼스트에 저장된 bno값을 파라미터로 가져오는데 변수가 스트링 변수인 이유는 파라미터가 문자형밖에 못불러와서 그럼
	int bno=Integer.parseInt(strBno);	//VO클래스에 setBno메서드는 애초에 인트값을 받는걸로 만들어서 타입변환을 해야만 메서드를 사용 가능함
	
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	BBSVO vo=new BBSVO();	//vo 클래스에 set메서드를 불러와야 함으로 클래스를 불러옴
	vo.setBno(bno);		//vo에 set메서드를 실행시키는데 들어갈 값은 리퀘스트에서 받아온 bno값이다
	vo.setTitle(title);
	vo.setContent(content);
	
	BBSDAO dao=new BBSDAO();	//dao클래스의 update메서드를 사용하기위해 클래스를 연결함
	dao.update(vo);			//dao에 있는 업데이트 메서드를 실행시키는데 그 값은 위에서 입력한 vo값이다.
%>

<script>
	alert("수정되었습니다.");
	location.href="list.jsp";
</script>