Web  (java  EE)  

 B/S  程序完全部署在服务器！

 B/S 和   C/S 区别
 
B: Browser  浏览器
C：Client   客户端
S：Server   服务器
 
 01. C/S 必须下载各种客户端   
     B/S 只需要有浏览器
 
 02. C/S 性能的高低，取决于客户端的配置 
     B/S 性能的高低，取决于服务器的配置   
 
 03. C/S 如果有版本更新必须进行，否则无法使用新功能
     B/S 服务器会自动更新，我们浏览器不需要   
 
 04. C/S  对操作系统有限制
     B/S  与操作系统关系降到了最低
     
URI 和  URL

 例子：
     两个朋友在打电话，A问B 你在哪？    URI 
     B回答说北京路！
     A就去自己城市中的北京路能找到B吗？ A和B不在一个城市！
   
  如果B说是XX市xx区的   北京路！  这样A能不能找到B！！ 可以！  URL
       
 URI  统一资源标识符
 
 URL  统一资源定位符    
  
  
 静态页面和静态页面的区别
   
  01.静态页面 不会与我们服务器进行交互
  02.动态页面  会根据用户不同的请求，响应一个不同页面 
 
 常用的web服务器   
 
 Tomcat     服务器    
 JBoss      服务器   
 WebLogic   服务器 
 
 
     
 Tomcat服务器 文件介绍         
     
01.bin  存放服务器启动或者停止的各种脚本文件 windows(.bat)  linux(.sh)
02.conf 存放服务器的各种配置文件
        001.context.xml 
        002.server.xml  设置端口号
        003.web.xml     session失效，欢迎界面  mime         
03.lib  存放服务器启动时需要的jar包
04.logs 存放服务器运行时产生的日志文件
05.temp 存放服务器运行时需要的临时文件    
06.webapps  我们的web项目部署的地方
07.work  当用户访问我们的项目是在此文件夹中会生成对应的文件     
     
     
     
在我们的web项目中 比我们的java项目多了两个文件
1.java EE :web项目需要的jar
2.webRoot
    01.META-INF :web项目需要的元信息
    02.WEB-INF  :安全路径，用户无法访问
        001.lib :外部jar存放位置，不需要我们手动的build path
        002.web.xml  :项目配置文件 和 服务器中conf/web.xml
                   服务器启动的时候，会先去加载 服务器中conf/web.xml
                  在conf/context.xml文件中有下列语句！
                  监听我们当前项目的web.xml
         <WatchedResource>WEB-INF/web.xml</WatchedResource>
                 如果两个文件中都配置了相同的信息，默认取值是我们项目中的web.xml！
    03.index.jsp 页面 ===》动态页面
    
    
 http://localhost  :  8080    /01WebBase/index.jsp    
  协议      主机ip地址         端口号         项目名称       资源路径
    
 http://localhost  :  8080    /01WebBase/              URI
 http://localhost  :  8080    /01WebBase/index.jsp     URL
      
   
   
   jsp  (java  server pages) :是一种动态网页的开发技术！
   
 jsp 页面元素包括：
    1. HTML静态页面  
    2.<%  java小脚本%>
    3.<%@ 指令 %> 
    4.<%=表达式 %> 
    5.<%! 声明方法,成员变量 %>  
    6.  html的注释 ===<!-- 页面可以看到 -->
        jsp的注释 ===<%-- 页面不可以看到 --%>
    
 
 
 观察first.jsp页面
 
 <%@ page language="java" import="java.util.*" 
 pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
 
                page：  jsp9大内置对象之一，当前页面
    language="java" ：   当前页面可以使用的语言
 import="java.util.*"   引入java语言中util包下的所有类
pageEncoding="UTF-8" ：  当前页面的编码格式 
contentType="text/html; charset=utf-8" :当前页面在浏览器中显示的格式   

<meta http-equiv="content-type" content="text/html;charset=utf-8">    
  用户在前端页面输入的编码格式！  
    
<%
String path = request.getContextPath();  项目的跟路径    /01WebBase

http://localhost:8080/01WebBase/

String basePath = 
request.getScheme()+      请求的协议
"://"+
request.getServerName()+  请求的主机名称
":"+
request.getServerPort()+  请求的主机端口号
path+"/";                 项目的跟路径
%>
    
 <base href="<%=basePath%>"> 
 把  localhost:8080/01WebBase/当成了相对路径
    
    
 没有对象我们怎么使用类的属性以及方法？？  压根不行！
 必须通过   类名   对象名=new 类名();
 
 
 内置对象:底层给我们实例化了，我们直接使用对象即可！
                
                JSP的九大内置对象 (仅限于jsp页面使用)
                
page                   当前页面                        this
pageContext       当前页面上下文对象                PageContext
request                请求对象                        HttpServletRequest
response               响应对象                        HttpServletResponse
session                会话对象                        HttpSession
application           应用程序对象                   ServletContext
out                     输入对象                      JspWriter
config                  配置对象                      ServletConfig
exception               异常对象                      Throwable
   
   
   
   jsp其实就是一个servlet！
   servlet其实就是一个java类！
   
   
   
  所有声明在<% %> 都会在 _jspService()方法中！   局部变量！
  所有声明在<%! %> 都会在对应的jsp类中！   成员变量！
  方法只能定义在  <%! %> 
   
   
   jsp的执行流程
	   01.翻译阶段:把jsp文件翻译成.java源文件
	                             如果jsp文件没有被修改，那么这个阶段只执行一次！
	                             
	   02.编译阶段：.java源文件编译成.class文件
	   
	   03.执行阶段： 执行.class文件 转换成jsp返回个用户
	   
   
   jsp的生命周期
       01. init：初始化！ 只有在用户第一次访问页面的时候执行一次！
       02.destroy：销毁！ 只有服务器关闭的时候执行一次！
       03.service： 用户每访问一次，执行一次！
   
   
    
    
    
     
     
     
