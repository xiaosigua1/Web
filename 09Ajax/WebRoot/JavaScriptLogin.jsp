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
  
  
  <!--Ajax 验证昵称是否存在 
    为了验证是否是局部刷新，我们实现放置一个图片-->
  
  昵称:<input type="text" name="nickName" onblur="validate();" required>
    <div  id="result"></div>
    <img src="images/cat.jpg" alt="这是一只可爱的小猫咪"/>
 
  
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

  /* 文本框的失去焦点事件 */
  function validate(){
      var $userName=$("[name='nickName']").val(); //获取用户输入的值
       
        //01.创建XMLHttpRequest对象  根据浏览器版本高低创建
         var  xhr=null;
          if(window.XMLHttpRequest){ //高版本
             xhr=new XMLHttpRequest();
          }else{//低版本
             xhr=new ActiveXObject("Microsoft.XMLHTTP");
          }
        //02.设置回调函数
        xhr.onreadystatechange=function(){
             if(xhr.readyState==4&&xhr.status==200){  //响应成功
                var data= xhr.responseText;  //获取响应的数据
                if (data.match("true")) {  //证明昵称已经存在
					$("#result").html("<span  style='color:red;'>昵称已经存在!</span>");
				}else{
				    $("#result").html("<span  style='color:green;'>昵称可以使用!</span>");
				}
             }
           
        }
        //03.初始化组件 创建连接   get方式  xhr.open("GET", "ValidateServlet?userName="+$userName);
        xhr.open("POST", "ValidateServlet");
        //如果是post请求 必须设置请求头
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        
        //04.发送数据
        //xhr.send();  get方式 可以 不写参数 或者写成 null
        var  sendData="userName="+$userName;
        xhr.send(sendData);
  }

</script>
  
  
  </body>
</html>
