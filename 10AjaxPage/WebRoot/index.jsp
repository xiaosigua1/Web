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
      <table>
          <thead>
              <tr>
                <th>新闻标题</th>
                <th>新闻内容</th>
                <th>创建时间</th>
              </tr>
          </thead>
          <tbody id="tbody">
          </tbody>
      </table>
      <a href="javascript:"  id="one">首页</a>
      <a href="javascript:"  id="back">上一页</a>
      <a href="javascript:"  id="next">下一页</a>
      <a href="javascript:"  id="last">尾页</a>
  
  
  
  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript">
    
    $(function(){
         //分页需要的四要素
         var  pageIndex=""; //当前页
         var  pageSize=""; //页大小
         var  pageCount="";//总页数
         var  totalCount="";  //总记录数
      
        // 用户第一次进入的时候默认 显示第一页的数据
        pageInit(pageIndex);
        
        function  pageInit(pageIndex){
        
        //显示按钮
        $("#one").show();
        $("#back").show();
        $("#next").show();
        $("#last").show();
           
           $.ajax({
              url:"newsList",
              type:"POST",
              dataType:"json",
              contentType:"application/x-www-form-urlencoded;charset=utf-8",
              data:{"pageIndex":pageIndex},
              success:function(data){  //成功之后的回调函数
                   //清空之前的内容
                   $("#tbody").empty();
                   
                   $(data).each(function(){
                     if(this.util!=null){
                       pageIndex=  this.util.pageIndex;
                       alert("pageIndex"+pageIndex);
                       pageSize=  this.util.pageSize;
                       pageCount=  this.util.pageCount;
                       totalCount=  this.util.totalCount;
                       }
                       $("#tbody").append(
                       "   <tr> <td>"+this.title+"</td>       "
				          +"   <td>"+this.content+"</td>       "
				          +"   <td>"+this.createTime+"</td>  </tr>      "
                       );
                   });
              
              }
           
           });
        }   /* pageInit  end  */
    
    
     //点击事件
     $("#one").click(function(){
          pageInit(1);
     });
     $("#last").click(function(){
          pageInit(pageCount);
     });
     $("#back").click(function(){
      if ((pageIndex-1)>0) {
		 pageInit(pageIndex-1);
	  }else{
	     $("#one").hide();
	     $("#back").hide();
	  }
     });
     $("#next").click(function(){
       if ((pageIndex+1)<=pageCount) {
		 pageInit(pageIndex+1);
	  }else{
	     $("#last").hide();
	     $("#next").hide();
	  }
     });
 
    
    });
  
  
  
  </script>
  
  
  </body>
</html>
