<%@page import="com.xdf.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
  
  
  <!--向四个作用域中增加属性  -->
   <%
      pageContext.setAttribute("pageKey", "pageValue");
      request.setAttribute("requestKey", "requestValue");
      session.setAttribute("sessionKey", "sessionValue");
      application.setAttribute("applicationKey", "applicationValue");
    %>
  
   <!--之前获取的方式  --> 
  <%=pageContext.getAttribute("pageKey") %><br/>
  <%=request.getAttribute("requestKey") %><br/>
  <%=session.getAttribute("sessionKey") %><br/>
  <%=application.getAttribute("applicationKey") %><br/>
  <hr/>
   <!--现在通过el表达式获取的方式  --> 
    ${pageScope.pageKey}<br/>
    ${requestScope.requestKey}<br/>
    ${sessionScope.sessionKey}<br/>
    ${applicationScope.applicationKey}<br/>
    <hr/>
   <!--现在通过el表达式获取的方式  --> 
    ${pageKey}<br/>
    ${requestKey}<br/>
    ${sessionKey}<br/>
    ${applicationKey}<br/>
       <hr/>
     <!--现在通过el表达式向作用域中存放对象  -->    
      <%
        User user=new User(1,"小黑1");
         //现在把user对象存进session作用域中
        session.setAttribute("user", user);
       %>
     用户的编号：${sessionScope.user.id}<br/>
     用户的姓名：${sessionScope.user.getName()}<br/>
      <hr/>
     <!--现在通过el表达式向作用域中存放对象的集合  list  -->  
     <%
        User user1=new User(1,"小黑1");
        User user2=new User(2,"小黑2");
        User user3=new User(3,"小黑3");
        
        List<User>  userList=new ArrayList();
        userList.add(user1);
        userList.add(user2);
        userList.add(user3);
         //现在把user对象存进session作用域中
        session.setAttribute("list", userList);
       %>
    
     获取list集合中第三个user对象的姓名:${sessionScope.list[2].name}<br/>
       <hr/>
     <!--现在通过el表达式向作用域中存放对象的集合  map  -->  
        <%
        User user4=new User(4,"小黑4");
        User user5=new User(5,"小黑5");
        User user6=new User(6,"小黑6");
        Map<String,Object> userMap=new HashMap();
        userMap.put("a", user4);
        userMap.put("b", user5);
        userMap.put("c", user6);
         //现在把map存进session作用域中
        session.setAttribute("map", userMap);
       %>
      获取map集合中第2个user对象的姓名:${sessionScope.map["b"].name }<br/>
      获取map集合中第2个user对象的姓名:${sessionScope.map.b.name }
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    
    
  
  </body>
</html>
