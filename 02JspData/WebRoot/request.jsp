<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request.jsp' starting page</title>
    
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
    <h1> request对象常用的方法</h1>
    <%
      out.print("服务器的主机名称"+request.getServerName()+"<br/>");
      out.print("服务器的端口号"+request.getServerPort()+"<br/>");
      out.print("请求中使用的协议"+request.getScheme()+"<br/>");
      out.print("*******请求中的url部分*******"+request.getServletPath()+"<br/>");
      out.print("请求所在的上下文"+request.getServletContext()+"<br/>");
      out.print("请求中的项目名称"+request.getContextPath()+"<br/>");
     %>
    
    
    
    
    
    
    
    
    
    
    
    
    
  </body>
</html>
