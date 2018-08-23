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
  
  
  <!--Ajax 验证昵称是否存在 
    为了验证是否是局部刷新，我们实现放置一个图片-->
  
  昵称:<input type="text" name="nickName">
  <div  id="result"></div>
 <img src="images/cat.jpg" alt="这是一只可爱的小猫咪"/>
 
  
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
$(function(){
   //输入框的失去焦点事件
   $("[name='nickName']").blur(function(){
       var  $userName=$("[name='nickName']").val();//获取用户的输入
       $.ajax({   //使用jquery执行ajax
           type:"POST",
           data:"userName="+$userName,
           dataType:"text",
           url:"ValidateServlet",
           beforeSend:function(){
              alert("请求正在发送，请稍等.......");
           },
           success:function(data){ //成功
                if (data.match("true")) {  //证明昵称已经存在
					$("#result").html("<span  style='color:red;'>昵称已经存在!</span>");
				}else{
				    $("#result").html("<span  style='color:green;'>昵称可以使用!</span>");
				}
           }
       });
   });

});
 
  




</script>
  
  
  </body>
</html>
