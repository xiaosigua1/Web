<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'live.jsp' starting page</title>
    
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
  
   <%
      //声明局部变量
      int  num1=5;
      int  num2=10;
    %>
    
   <%!
      //声明成员变量
      int  father1=5;
      int  father2=10;
      
      public void  getSum(){
           System.out.println("father1+father2的和===》"+(father1+father2));
      }
    %>
  
  
  
 num1+num2:<%=num1+num2 %>   <br/>
 
 father1+father2:<%=father1+father2 %> 
  
  
  
  
  
  
  </body>
</html>
