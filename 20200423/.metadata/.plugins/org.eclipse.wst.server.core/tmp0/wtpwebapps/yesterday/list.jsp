<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200422.* , java.util.* , org.json.simple.*" %>

<%
	MovieDAO dao=new MovieDAO();
	ArrayList<MovieVO> list=dao.list();
	//어레이 리스트를 제이손데이터로 변환함, 제이손 심플 라이브러리가 필요함
	JSONArray jArray=new JSONArray();
	
	for(MovieVO vo:list) {
	
		
		JSONObject obj=new JSONObject();
		obj.put("mno",vo.getMno());
		obj.put("title",vo.getTitle());
		obj.put("actor",vo.getActor());
		jArray.add(obj);
	}
	out.println(jArray);
%>
