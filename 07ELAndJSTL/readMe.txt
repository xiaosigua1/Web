EL(Expression  Language):表达式

目的：
  01.简化jsp页面
  02.简化java代码
  
语法：
  ${表达式}  
  01.其实就是从某个作用域中获取值！ 
  02.表达式 就是作用域中的key

                         四大作用域
pageContext      pageScope
request          requestScope
session          sessionScope
application      applicationScope


注意点：
  01.使用setAttribute("key","value")  向作用域中赋值

  02.使用getAttribute("key")  从作用域中获取值   =====》${作用域.key}
  
  03.如果在一个request作用域中保存了值，只能从本作用域中获取！
  
  04.${key}  现在没有指定作用域，那么我怎么知道是那个作用域呢？
    会按照pageScope==》requestScope==》sessionScope==》applicationScope==》null


通常情况下，我们的el表达式都是结合JSTL一起使用！
  
JSTL(JSP  Standard  Tag  Library)jsp标签库！是一个不断完善的标签库！
   
   core  fmt sql  xml  functions
   
 使用的注意点：
   01.务必在使用jstl的页面  引入jstl标签库
   02.使用对应的标签



















