<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200506.*,java.util.*,org.json.simple.*, java.text.*" %>
    <%
	DecimalFormat df=new DecimalFormat("##0.00");
	EDAO dao=new EDAO();
	ArrayList<CVO> list=dao.clist();
	
	JSONObject jObject=new JSONObject();
	JSONArray array=new JSONArray();
	for(CVO vo:list) {
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("pname", vo.getPname());
		obj.put("room", vo.getRoom());
		String avg=df.format(vo.getAvg());
		obj.put("avg", avg);
		obj.put("count", vo.getCount());
		array.add(obj);
		
	}
	
	jObject.put("elist", array);
	out.println(jObject);
%>