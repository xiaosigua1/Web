<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
      Cookie [] css=  request.getCookies();
       if(css!=null){
         for(int i=0;i<css.length;i++){
             if("userName".equals(css[i].getName())){
               out.print(URLDecoder.decode(css[i].getValue(), "utf-8"));
             }
             if("userName2".equals(css[i].getName())){
               out.print(URLDecoder.decode(css[i].getValue(), "utf-8"));
             }
         }
         //获取sessionID   在浏览器中对应的是JSEESIONID
          out.print(session.getId());
       }
  
  
   %>
  
  
  
  
  </body>
</html>
