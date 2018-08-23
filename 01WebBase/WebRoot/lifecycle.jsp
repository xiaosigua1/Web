<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lifecycle.jsp' starting page</title>
    
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
  
  
  <%!   //必须是成员变量
    int  initNum=0;
    int  destroyNum=0;
    int  serviceNum=0;
    
    //初始化的方法
    public void  jspInit(){
       System.out.println("jspInit执行了"+(++initNum)+"次");
    }
  
    //销毁的方法
    public void  jspDestroy(){
       System.out.println("jspDestroy执行了"+(++destroyNum)+"次");
    }
   %>
   
   
   <%
      //默认会在service方法中
       System.out.println("jspService执行了"+(++serviceNum)+"次");
       System.out.println("jspInit执行了"+(initNum)+"次");
       System.out.println("jspDestroy执行了"+(destroyNum)+"次");
    %>
  
  
  <%-- jsp  前台页面能看到吗？ --%>
  <!-- html 前台页面能看到吗？ -->
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  </body>
</html>
