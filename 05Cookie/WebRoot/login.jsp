<%@page import="java.net.URLEncoder"%>
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
  
  <%
  //可以创建多个cookie   如果有中文  务必设置编码格式
  Cookie cs=new Cookie("userName",URLEncoder.encode("哈哈", "utf-8"));
  Cookie cs2=new Cookie("userName2","99999999999");
  
   //设置cookie的有效期  会在电脑中产生文件保存cookie   务必放在addCookie之前
   cs.setMaxAge(20);
   
  response.addCookie(cs);
  response.addCookie(cs2);
  
 
  
  response.sendRedirect("doLogin.jsp");
   %>
  
  
  
  
  
  </body>
</html>
