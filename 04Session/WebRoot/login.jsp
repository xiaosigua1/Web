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
  
  
  <form  action="doLogin.jsp"  method="post">
    用户名：<input  type="text" name="userName"> <br/>
   密码：<input type="password" name="pwd"><br/>
   <button type="submit">登录</button>
  </form>
  <a href="main.jsp">main</a>
  
  
  <%
    /* 
    从session中清除指定的属性
     session.removeAttribute("n");
     session.removeAttribute("p");*/
   
   //从请求中获取用户输入的用户名和密码
	  String name=(String)session.getAttribute("n");
	  String pwd=(String)session.getAttribute("p"); 
      out.print(name);
      out.print(pwd);
   %>
  
  
  
  
  
  </body>
</html>
