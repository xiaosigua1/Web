<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'last.jsp' starting page</title>
    
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
    //针对于post请求乱码 解决方式
    request.setCharacterEncoding("UTF-8");  //请求
    response.setCharacterEncoding("UTF-8"); //响应
    //获取用户名
      String  userName= request.getParameter("userName");
    //获取密码
      String  password= request.getParameter("pwd");
    
      out.print("last用户名："+userName);
      out.print("last密码："+password);
      
      
      //获取用户选择的所有爱好
    String [] loves= request.getParameterValues("love");
    if(loves!=null&&loves.length>0){
      for(String love:loves){
          out.print(love);
      }
   }
      
      
      
      
      
     %>
  </body>
</html>
