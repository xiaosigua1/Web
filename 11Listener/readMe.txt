监听器：Listener
     
   下面的三个接口都是 继承了   EventListener  这个接口！
  只要是想实现监听器的功能，必须  扩展这个   EventListener 接口！
/**
 * A tagging interface that all event listener interfaces must extend.
 * @since JDK1.1
 */ 
    
1.HttpSessionBindingListener    ===>对应指定的类 
    只有实现HttpSessionBindingListener接口的类，才能被监听！
    01.valueBound   
    02.valueUnBound
  

2.HttpSessionListener  ===> session（会话）
     01.sessionCreated
     02.sessionDestroyed


   01.需要在wen.xml文件中配置listener节点
   02.指定的监听器会在项目启动时 初始化
   03.sessionCreated在用户访问项目的时候 执行
   04.sessionDestroyed在session失效或者超时的时候执行



3.ServletContextListener  ===> application（项目）
    01.contextInitialized
    02.contextDestroyed
    
   01.需要在wen.xml文件中配置listener节点
   02.contextInitialized会在服务器启动的时候执行
   03.contextDestroyed会在服务器关闭的时候执行

web.xml文件中配置的节点执行顺序

context-param -> listener -> filter -> servlet











