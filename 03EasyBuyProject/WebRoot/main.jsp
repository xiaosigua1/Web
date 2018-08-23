<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 引入jstl标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link  href="static/bootstrap/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="static/bootstrap/css/charisma-app.css" rel="stylesheet">
	<link href="static/bootstrap/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='static/bootstrap/css/fullcalendar.css' rel='stylesheet'>
	<link href='static/bootstrap/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='static/bootstrap/css/chosen.css' rel='stylesheet'>
	<link href='static/bootstrap/css/uniform.default.css' rel='stylesheet'>
	<link href='static/bootstrap/css/colorbox.css' rel='stylesheet'>
	<link href='static/bootstrap/css/jquery.cleditor.css' rel='stylesheet'>
	<link href='static/bootstrap/css/jquery.noty.css' rel='stylesheet'>
	<link href='static/bootstrap/css/noty_theme_default.css' rel='stylesheet'>
	<link href='static/bootstrap/css/elfinder.min.css' rel='stylesheet'>
	<link href='static/bootstrap/css/elfinder.theme.css' rel='stylesheet'>
	<link href='static/bootstrap/css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='static/bootstrap/css/opa-icons.css' rel='stylesheet'>
	<link href='static/bootstrap/css/uploadify.css' rel='stylesheet'>
</head>
  
  <body>


  
  	<div  class="sortable" >		
				<div class="box span9">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i>当前登录用户名：${sessionScope.loginUser.loginName}</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					
				
	
<!-- loginName 登录名
userName  用户名
sex 性别(1:男 0：女)
identityCode 身份证号
email 邮箱
mobile 手机号	 -->		
					
					
									
					
					<div class="box-content">
					<!-- 新增     按钮 -->
					<a class="btn btn-success" href="add.jsp">
					<i class="icon-zoom-in icon-white"></i>新增</a>	
					
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>登录名</th>
								  <th>真实姓名</th>
								  <th>性别</th>
								  <th>身份证号</th>
								  <th>邮箱</th>
								  <th>手机号</th>
								  <th>操作</th>
							  </tr>
						  </thead>   
						  <tbody>
						  <c:forEach items="${userList}" var="user" >
						  	<tr>
								<td>${user.loginName}</td>
								<td class="center">${user.userName}</td>
								<td class="center">${user.sex}</td>
								<td class="center">${user.identityCode}</td>
								<td class="center">${user.email}</td>
								<td class="center">
									<span class="label label-success">${user.mobile}</span>
								</td>
									<td class="center">
									<a class="btn btn-info" href="updateUser?id=${user.id}&method=findById">
										<i class="icon-edit icon-white"></i>  
										修改                                            
									</a>
									<a class="btn btn-danger" href="javascript:del('deleteServlet?id=${user.id}');">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
								</td>
							</tr>
						  </c:forEach>
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
		
	<!-- 模态窗口 -->	
	<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">x</button>
				<h3>确认删除</h3>
			</div>
			<div class="modal-body">
				<p>请慎重考虑是否删除...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">取消</a>
				<a href="#" class="btn" onClick="delSubmit();">确定</a>
			</div>
			<!--隐藏域  -->
			<input type="hidden" id="url">
		</div>		
			
			
			
		<!--  少一个 jquery 核心js库 -->
			<script type="text/javascript" src="static/bootstrap/js/jquery-1.7.2.min.js"></script>
	<script src="static/bootstrap/js/jquery-ui-1.8.21.custom.min.js"></script>
	<script src="static/bootstrap/js/bootstrap-transition.js"></script>
	<script src="static/bootstrap/js/bootstrap-alert.js"></script>
	<script src="static/bootstrap/js/bootstrap-modal.js"></script>
	<script src="static/bootstrap/js/bootstrap-dropdown.js"></script>
	<script src="static/bootstrap/js/bootstrap-scrollspy.js"></script>
	<script src="static/bootstrap/js/bootstrap-tab.js"></script>
	<script src="static/bootstrap/js/bootstrap-tooltip.js"></script>
	<script src="static/bootstrap/js/bootstrap-popover.js"></script>
	<script src="static/bootstrap/js/bootstrap-button.js"></script>
	<script src="static/bootstrap/js/bootstrap-collapse.js"></script>
	<script src="static/bootstrap/js/bootstrap-carousel.js"></script>
	<script src="static/bootstrap/js/bootstrap-typeahead.js"></script>
	<script src="static/bootstrap/js/bootstrap-tour.js"></script>
	<script src="static/bootstrap/js/jquery.cookie.js"></script>
	<script src='static/bootstrap/js/fullcalendar.min.js'></script>
	<script src='static/bootstrap/js/jquery.dataTables.min.js'></script>
	<script src="static/bootstrap/js/excanvas.js"></script>
	<script src="static/bootstrap/js/jquery.flot.min.js"></script>
	<script src="static/bootstrap/js/jquery.flot.pie.min.js"></script>
	<script src="static/bootstrap/js/jquery.flot.stack.js"></script>
	<script src="static/bootstrap/js/jquery.flot.resize.min.js"></script>
	<script src="static/bootstrap/js/jquery.chosen.min.js"></script>
	<script src="static/bootstrap/js/jquery.uniform.min.js"></script>
	<script src="static/bootstrap/js/jquery.colorbox.min.js"></script>
	<script src="static/bootstrap/js/jquery.cleditor.min.js"></script>
	<script src="static/bootstrap/js/jquery.noty.js"></script>
	<script src="static/bootstrap/js/jquery.elfinder.min.js"></script>
	<script src="static/bootstrap/js/jquery.raty.min.js"></script>
	<script src="static/bootstrap/js/jquery.iphone.toggle.js"></script>
	<script src="static/bootstrap/js/jquery.autogrow-textarea.js"></script>
	<script src="static/bootstrap/js/jquery.uploadify-3.1.min.js"></script>
	<script src="static/bootstrap/js/jquery.history.js"></script>
	<script src="static/bootstrap/js/charisma.js"></script>
	
	<!-- 自定义的jquery -->
	<script type="text/javascript">
	   function del(delUrl){
	     $("#myModal").modal("show");
	     //把删除的路径赋值给隐藏域
	     $("#url").val(delUrl);
	   }
	   
	   
	   
	   //模态窗口中真正的删除
	   function delSubmit(){
	   window.location.href= $("#url").val();//deleteServlet?id=${user.id}
	   }
	  
	</script>
	
  
  </body>
</html>
