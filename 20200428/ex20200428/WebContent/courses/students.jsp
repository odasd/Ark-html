<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*, java.text.*" %>

<%
	String lcode=request.getParameter("lcode");
	SDAO2 dao=new SDAO2();
	ArrayList<SVO2> list=dao.list(lcode);
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", dao.count(lcode));
	
	JSONArray array=new JSONArray();
	for(SVO2 vo:list) {
		JSONObject obj=new JSONObject();
		obj.put("scode", vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("edate", vo.getEdate());
		obj.put("grade", vo.getGrade());
		
		array.add(obj);
	}
	jObject.put("items2", array);
	out.println(jObject);
%>