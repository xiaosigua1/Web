<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
contentType="text/html; charset=UTF-8"%>
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
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>小豆腐注册页面</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="static/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="static/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="static/css/amazeui.min.css" />
    <link rel="stylesheet" href="static/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="static/css/app.css">
    <!--01.引入需要bootStrap的css样式文件-->
    <link rel="stylesheet" href="static/css/bootstrap.css">
	<style  type="text/css">
	    .error{
	        color: pink;
	    }
</style>


</head>

<body data-type="login">
<div class="navbar navbar-default navbar-fixed-top"><!--导航菜单 固定头部-->
    <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button"
                data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand hidden-sm" href="#">商城首页</a>
    </div>


    <div class="navbar-collapse collapse in"><!--显示的数据-->
        <ul class="nav navbar-nav">
            <li><a href="#">小豆腐</a></li>
            <li><a>欢迎注册</a></li>
            <li><a href="#"></a></li>
        </ul>

        <div  class="navbar-form navbar-right">
            <a href="#">已有账号?登录</a>
        </div>
    </div>
</div>
<div style="height: 50px"></div>

    <div class="am-g tpl-g">
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-title"><span class="glyphicon glyphicon-user"></span>注册用户</div>
              <!-- form  注册  -->
                <form  action="register"  class="am-form tpl-form-line-form" method="post"id="myForm">
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" name="userName" placeholder="用户名">
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" name="password"  id="pwd"  placeholder="请输入密码">
                    </div>

                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" name="repPassword" placeholder="再次输入密码">
                    </div>

                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" name="realName" placeholder="输入真实姓名">
                    </div>
                    <div class="am-form-group">
                        <input type="radio" class="tpl-form-input" name="sex" value="1" checked>男
                        <input type="radio" class="tpl-form-input" name="sex" value="0">女
                    </div>
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" name="pid" placeholder="输入身份证号">
                    </div>
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" name="email" placeholder="邮箱">
                    </div>
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" name="phone" placeholder="输入手机号">
                    </div>


                    <div class="am-form-group tpl-login-remember-me">
                        我已阅读并同意 <a href="javascript:;">《用户注册协议》</a>
                        <input id="remember-me" type="checkbox" name="context">
                    </div>

                    <div class="am-form-group">
                        <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery.validate.js" charset="UTF-8"></script>
<script type="text/javascript" src="static/js/messages_cn.js" charset="UTF-8"></script>
    <script src="http://cdn.bootcss.com/amazeui/2.7.2/js/amazeui.min.js"></script>
    <script src="static/js/theme.js"></script>
    <script src="static/js/app.js"></script>
    <!--自己的js-->
<script type="text/javascript" src="static/js/bootstrap.js"></script>
<script type="text/javascript" src="static/js/myjs/register.js" charset="UTF-8"></script>

</body>

</html>
