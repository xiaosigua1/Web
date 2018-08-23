四大作用域
pageScope
requestScope
sessionScope
applicationScope

==========================
pageContext
request
session
application

都有对应的向作用域中增加属性的操作
setAttribute(String key,Object Value)

取值使用
getAttribute(String key)  返回值是Object 
从指定的作用域中获取

getParameter返回的是String类型


getParameter只有request中有！
是从请求的url中获取参数！
localhost:8080/web?name=xx&pwd=xxx





指定作用域增加的属性，只能本作用域获取！
不能说 我放在session中，request能拿？    不能！
放在request中，session能拿？    不能！



session的失效方式
不要认为我们把浏览器关闭，就是session失效了！ 这是不对的！


01.在tomcat/conf/web.xml文件中有默认的session失效时间设置  30分钟
   <session-config>
        <session-timeout>30</session-timeout>
    </session-config>

02.在我们自己的项目中的web.xml文件中 配置
   <session-config>
        <session-timeout>1</session-timeout>
    </session-config>
  如果都有配置 ，默认执行我们项目中的web.xml文件中 配置！


03.设置session失效的时间
      session.setMaxInactiveInterval(5)  ; //以秒为单位！

04.让session立即失效
   session.invalidate();


从session清除指定的属性
session.removeAttribute("p");






目的就是====》为了解决http协议无状态请求！

引入了 session和cookie

01.session保存在服务器，存储的是整个用户的信息
02.在用户第一次访问服务器的时候，服务器通过response把一个编号（sessionId）
   传递给浏览器了！在浏览器中sessionId被保存在cookies中！key==>JSEESIONID
03.用户再去访问服务器的时候就是携带着  JSEESIONID！


cookie的机制

01.cookie中只能存放字符串
02.如果cookie设置了有效期，那么会在电脑中创建文件保存cookie信息
03.如果cookie没有设置有效期，那么cookie会随着浏览器的关闭而销毁
04.cookie保存在客户端



servlet  (控制器)

jsp==>servlet===>java类

01.Servlet就是一个java接口
02.任何一个Servlet接口的实现类，我们也成为Servlet


现在阶段：

Model1模式
jsp页面负责  ：   
	1.显示数据（html）  
	2.处理请求 （java）
	   2.1:接收用户的请求
	   2.2:从后台获取数据
	   2.3:根据返回的结果给用户响应
	   
JavaBean  



今天的阶段

Model2模式

jsp页面负责  ：     显示数据（html）
servlet：	     处理请求 （java）
	   1:接收用户的请求
	   2:从后台获取数据
	   3:根据返回的结果给用户响应   
JavaBean  


如果我们想实现servlet

1.实现Servlet接口
2.继承GenericServlet类
3.继承HttpServlet类     *********

HttpServlet==>继承了GenericServlet==>实现了==》Servlet






<load-on-startup>1</load-on-startup>
在服务器启动的时候 初始化servlet ===》 init()!

值务必是正整数！值越小，优先级越高！




url -pattern的匹配 原则
/login    精确匹配   exact 
/*        全局匹配  通配符 wildcard
*.do      扩展名匹配   extension 
/         默认匹配


初始化的参数配置
01.针对于每一个servlet的初始化参数配置
   init-param写在了指定的servlet节点中！只能当前servlet访问


02.针对于所有servlet的初始化参数配置
   context-param 单独的节点！规范 写在 web.xml文件的最上方！



Filter  过滤器

init   服务器启动的时候  初始化
doFilter  用户每访问一次项目，进入一次
destroy   服务器关闭的时候执行



 * 如果我们使用的是注解开发！
 * filter的执行顺序和 类名的首字母有关系   A  >   B  >  C
 * 
 * 如果自己想控制执行顺序  需要引入外部jar包 使用@WebFilterSort中的value
 HttpServletRequest才有getSession() 所以需要向下转型
		 放行的条件
		01.请求中有用户信息   
		02.请求的路径有login
			getRequestURL===>http://localhost:8080/08Filter/login  统一资源定位符
			getRequestURI===>/08Filter/login  项目名+请求地址
			getContextPath===>/08Filter   项目名
			getServletPath===>/login    请求地址
			03.请求中.js .css .jpg
			04.请求不能是.jsp



数据源   DataSource  是配置在服务器中！
   创建连接 交给连接池！
   javax.sql.DataSource  建立与数据库的连接！


服务器没开启？ 有数据源吗？ 有连接池吗？


连接池  Connection Pool   
     01.连接池中的连接由数据源提供
     02.负责管理和释放连接
     03.是一种缓冲池技术
     04.自动分配连接对象和对闲置的连接对象进行回收
     05.配置在Tomcat中conf/context.xml文件中

JDBC 常用的API？？
Conncetion
DriverManager
Statment
ResultSet
ResultSetMetaData


我们想通过JDBC技术访问数据库，就必须使用JDBC API！

现在想使用数据源和连接池技术访问数据库，必须使用JNDI！
JNDI （Java Naming And  Direcoty  Interface）  java命名和目录接口！










