<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 引入jstl标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
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
  
  <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 新增页面</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
					<!--  form表单 文件上传　　必须使用  　enctype＝＂multipart/form-data＂-->
						<form  action="newsServlet"  enctype="multipart/form-data"    class="form-horizontal"  method="post">
						  <fieldset>
							<div class="control-group">
							  <label class="control-label" for="typeahead">新闻标题:</label>
							  <div class="controls">
								<input type="text" class="span6 typeahead" name="title">
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="date01">创建时间:</label>
							  <div class="controls">
								<input type="text" name="createTime" class="input-xlarge datepicker" id="date01" value="11/23/17">
							  </div>
							</div>

							<div class="control-group">
							  <label class="control-label" for="fileInput">文件上传:</label>
							  <div class="controls">
								<input class="input-file uniform_on" id="fileInput" type="file" name="img">
							  </div>
							</div>          
							<div class="control-group">
							  <label class="control-label" for="textarea2">新闻内容:</label>
							  <div class="controls">
								<textarea class="cleditor" id="textarea2" rows="3" name="content"></textarea>
							  </div>
							</div>
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">新增</button>
							  <button type="reset" class="btn">重置</button>
							</div>
						  </fieldset>
						 
						</form>   

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
	   function del(){
	     $("#myModal").modal("show");
	   }
	  
	</script>
	
  
  </body>
</html>
