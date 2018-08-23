<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doLogin.jsp' starting page</title>
    
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
  
  <h1>doLogin页面</h1>
  
  <% 
	  //处理post请求乱码
	  request.setCharacterEncoding("utf-8");
	  //从请求中获取用户输入的用户名和密码
	  String name=request.getParameter("userName");  
	  String pwd=request.getParameter("pwd");  
    	 if("admin".equals(name)&&"123".equals(pwd)){ //登录成功进入 main.jsp
     //把用户的信息保存在session作用域中
     session.setAttribute("n", name);
     session.setAttribute("p", pwd);
     
            //request.getRequestDispatcher("main.jsp").forward(request, response);     转发
    	 }else{
    	   //重定向
    	   response.sendRedirect("login.jsp");
    	 }
   %>
  
  <a href="main.jsp">main</a>
  
  
  
  </body>
</html>
