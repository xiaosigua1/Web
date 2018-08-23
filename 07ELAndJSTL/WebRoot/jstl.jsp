<%@page import="com.xdf.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--  引入需要的jstl标签库  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jstl.jsp' starting page</title>
    
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
       <!--之前的输出方式  -->
       <%="aaaa" %> <br/>
        01.out：输出标签<br/>
       <!--使用jstl标签  
       
       01.out：输出标签
       
         value: 显示的值，一般使用el表达式   <c:out value="${key}"/>
         escapeXml:是否转义特殊字符，默认值是true==》不转义
         default:当value中的el表达式为null的时候，输出的默认值
       -->
       <c:out value="小黑"/><br/>
       <c:out value="&lt;小黑&gt;" escapeXml="false"/><br/>
       <c:out value="${null}" default="默认值"/><br/>
        <hr/>
       02.set：赋值标签<br/>
       <!-- 
       target:需要赋值的对象   el表达式
       property:对象的属性
       value：属性的值
       var:自己定义的变量名
       scope：变量所在的作用域
        -->
        <%
           User  user=new User();
           request.setAttribute("user", user);
         %>
        <c:set  target="${user}" property="name" value="小黑1"/>
        <c:out value="${requestScope.user.name}"/><br/>
    
       <c:set var="sex" value="男"  scope="request"/>
       <c:out value="${requestScope.sex}"/><br/>
        <hr/>
       03.remove：删除标签<br/>
       <!--删除指定的变量 
         var：需要删除的变量
         scope：变量所在的作用域
        -->
        <c:remove var="sex" scope="request"/>
        <c:out value="${requestScope.sex}"/><br/>
      <hr/>
       04.choose：选择标签<br/>
       <!--
       c:choose      类似与java中的switch
       c:when        switch中的case 
           test:判断条件
       c:otherwise   switch中的default
         -->
       <c:choose>
         <c:when test="${user.name=='小黑1'}">
                                       您的名字是：${user.name}
         </c:when>
         <c:when test="${user.name=='小黑2'}">
                                       您的名字是：aaaaaa
         </c:when>
         <c:otherwise>
                                             您没有名字！
         </c:otherwise>
       </c:choose>
     
       <hr/>
       05.forEach：遍历标签<br/>
      <%
        User user1=new User(1,"小黑1");
        User user2=new User(2,"小黑2");
        User user3=new User(3,"小黑3");
        User user4=new User(4,"小黑4");
        User user5=new User(5,"小黑5");
        User user6=new User(6,"小黑6");
        User user7=new User(7,"小黑7");
        
        List<User>  userList=new ArrayList();
        userList.add(user1);
        userList.add(user2);
        userList.add(user3);
        userList.add(user4);
        userList.add(user5);
        userList.add(user6);
        userList.add(user7);
         //现在把user对象存进session作用域中
        session.setAttribute("list", userList);
       %>
     
     <!-- 
     items:需要遍历的集合  一定是个el表达式
     var：变量，每一个元素的名称   相当于后面的a   for(String a:names)
     varStatus:获取每一行的下标！  隔行换色
     
      -->
     <table border="1">
	     <c:forEach items="${list}" var="user"  varStatus="status">
	      <c:if test="${status.count%2==0}">
			     <tr style="background:red">
		 </c:if>	     
	      <c:if test="${status.count%2!=0}">
			     <tr style="background:pink">
		  </c:if>	     
			       <td>用户的编号：${user.id }</td>
			       <td>用户的姓名：${user.name }</td>
			     </tr>
		
	     </c:forEach>
     </table> 
     
     
     
     
     
     
     
     
  </body>
</html>
