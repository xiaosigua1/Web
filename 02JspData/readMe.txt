
问题：
我们复制web项目的时候，切记：
右键点击项目名 选中properties 之后输入web  改变项目名称！



JSP数据传输

01.在login.jsp页面 用户输入数据
02.在doLogin.jsp页面进行获取数据
     怎么获取的？？？  request.getParameter("name的属性值")
     
问题？

我们form表单中的请求方式 是post!
中文乱码！   
解决方式 ：  使用  request.setCharacterEncoding("UTF-8");  治标不治本
后续讲解过滤器可以从根本上解决问题

get请求乱码   治本的办法  去 tomcat中的conf/server.xml文件中 connector节点中配置
 URIEncoding="utf-8" 
  
  
  
  转发和重定向的区别：
  
  01：转发是服务器的行为，重定向是客户端的行为
  02. 转发数据保留，重定向数据丢失
  03. 转发URL地址不会变化,重定向URL地址会变化
  04. 重定向至少两次访问服务器，转发是延长一次请求作用域
  
  
 怎么获取表单中复选框的多个值？？？
  String [] loves= request.getParameterValues("love");
 
 request对象常用的方法
  
 getParameter()   根据name值获取value
 setCharacterEncoding() 设置post请求乱码
 getParameterValues()   获取页面多个name对应的value集合
 
 
 
 
 
 
 
  
  
  
  
  
  
  