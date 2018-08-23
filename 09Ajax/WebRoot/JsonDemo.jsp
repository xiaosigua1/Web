<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
  
  <body>
  
  <button type="button">查询所有学生信息</button>
  <div  id="result"  style="width: 300px;height: 300px;border:1px solid red;"></div>
  
  
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
$(function(){
   //按钮点击事件
   $("button").click(function(){
    $.ajax({
        type:"POST",
        dataType:"json",  //预期返回的数据格式
        url:"studentList", //请求的地址
        success:function(data){  //data 就是后台响应的数据
        $("#result").empty();
          $(data).each(function(i){  //遍历后台获取的数据
             $("#result").append("<span>"+data[i].id+"</span>&nbsp;&nbsp;&nbsp;");
             $("#result").append("<span>"+data[i].name+"</span>&nbsp;&nbsp;&nbsp;");
             $("#result").append("<span>"+data[i].sex+"</span>&nbsp;&nbsp;&nbsp;");
             $("#result").append("<span>"+data[i].address+"</span>&nbsp;&nbsp;&nbsp;<br/>");
          });
        }
    });
   });
});
 
  




</script>
  
  
  </body>
</html>
