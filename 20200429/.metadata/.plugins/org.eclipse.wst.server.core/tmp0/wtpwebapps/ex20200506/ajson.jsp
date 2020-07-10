<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex202005062.*,java.util.*,org.json.simple.*"%>

<%	
	String lcode=request.getParameter("lcode");
	
	AllDAO dao=new AllDAO();
	ArrayList<CPVO> list=dao.alist();
	ArrayList<SEVO> blist=dao.blist(lcode);
	SEVO vo=dao.avg(lcode);
	
	JSONObject jObject=new JSONObject();
	
	JSONArray jArray=new JSONArray();
	for(CPVO v:list) {
		JSONObject obj=new JSONObject();
		obj.put("lcode", v.getLcode());
		obj.put("lname", v.getLname());
		obj.put("pname", v.getPname());
		jArray.add(obj);
	}
	
	jObject.put("list", jArray);
	
	
	
	JSONArray jArray1=new JSONArray();
	for(SEVO v:blist) {
		JSONObject obj=new JSONObject();
		obj.put("scode", v.getScode());
		obj.put("sname", v.getSname());
		obj.put("grade", v.getGrade());
		jArray1.add(obj);
	}
	
	jObject.put("elist", jArray1);
	
	jObject.put("avg", vo.getAvg());
	jObject.put("cnt", vo.getCount());
	
	out.print(jObject);
%>