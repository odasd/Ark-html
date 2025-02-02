<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex20200506.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>으악</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
   <div id="student">
      <h1>[학생목록]</h1>
      <table id="tbl" border=1 width=700></table>
      <script id="temp" type="text/x-handlebars-template">
         <tr>
            <td>학번</td>
            <td>학생명</td>
            <td>학과</td>
            <td>지도교수명</td>
         </tr>
      {{#each list}}
         <tr class=row>
            <td class=scode>{{scode}}</td>
            <td>{{sname}}</td>
            <td>{{sdept}}</td>
            <td>{{pname}}</td>
         </tr>
      {{/each}}
      </script>
   </div>
   
   <div id="student">
      <h1>[수강신청목록]</h1>
      학번:<span id="scode"></span>
      평균:<span id="avg"></span>
      수강신청과목수:<span id="cnt"></span>
      <table id="etbl" border=1 width=700></table>
      <script id="etemp" type="text/x-handlebars-template">
         <tr>
            <td>강좌번호</td>
            <td>강좌명</td>
            <td>점수</td>
         </tr>
      {{#each elist}}
         <tr>
            <td>{{lcode}}</td>
            <td>{{lname}}</td>
            <td>{{grade}}</td>
         </tr>
      {{/each}}
      </script>
   </div>
</body>
<script>
   var scode;
   var avg;
   var cnt;
   
   getList();
   //수강신청 목록 출력
   function getList(){
      $.ajax({
         type:"get",
         url:"sjson.jsp",
         dataType:"json",
         data:{"scode":scode},
         success:function(data){
            var temp=Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
         }
      });
   }
   
   $("#tbl").on("click", ".row", function(){
      scode=$(this).find(".scode").html();
      $.ajax({
         type:"get",
         url:"sjson.jsp",
         dataType:"json",
         data:{"scode":scode},
         success:function(data){
            $("#scode").html(scode);
            $("#avg").html(data.avg);
            $("#cnt").html(data.cnt);
            var temp=Handlebars.compile($("#etemp").html());
            $("#etbl").html(temp(data));
         }
      });
   })
</script>
</html>