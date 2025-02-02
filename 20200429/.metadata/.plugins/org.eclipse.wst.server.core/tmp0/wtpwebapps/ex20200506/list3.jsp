<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex202005062.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>으악2</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
   <div id="student">
      <h1>[강좌목록]</h1>
      <table id="tbl" border=1 width=700></table>
      <script id="temp" type="text/x-handlebars-template">
         <tr>
            <td>강좌목록</td>
            <td>강좌명</td>
            <td>담당교수명</td>
         </tr>
      {{#each list}}
         <tr class=row>
            <td class=lcode>{{lcode}}</td>
            <td>{{lname}}</td>
            <td>{{pname}}</td>
         </tr>
      {{/each}}
      </script>
   </div>
   
   <div id="student">
      <h1>[수강신청목록]</h1>
      강좌번호:<span id="lcode"></span>
       수강신청과목수:<span id="cnt"></span>
       과목평균:<span id="avg"></span>
     
      <table id="etbl" border=1 width=700></table>
      <script id="etemp" type="text/x-handlebars-template">
         <tr>
            <td>학번</td>
            <td>학생명</td>
            <td>점수</td>
         </tr>
      {{#each elist}}
         <tr>
            <td>{{scode}}</td>
            <td>{{sname}}</td>
            <td>{{grade}}</td>
         </tr>
      {{/each}}
      </script>
   </div>
</body>
<script>
   var lcode;
   var avg;
   var cnt;
   
   getList();
   //수강신청 목록 출력
   function getList(){
      $.ajax({
         type:"get",
         url:"ajson.jsp",
         dataType:"json",
         data:{"lcode":lcode},
         success:function(data){
            var temp=Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
         }
      });
   }
   
   $("#tbl").on("click", ".row", function(){
      lcode=$(this).find(".lcode").html();
      $.ajax({
         type:"get",
         url:"ajson.jsp",
         dataType:"json",
         data:{"lcode":lcode},
         success:function(data){
            $("#lcode").html(lcode);
            $("#cnt").html(data.cnt);
            $("#avg").html(data.avg);
            var temp=Handlebars.compile($("#etemp").html());
            $("#etbl").html(temp(data));
         }
      });
   })
</script>
</html>