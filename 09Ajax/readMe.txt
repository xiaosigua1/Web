Ajax : （Asynchronous  JavaScript  And  XML）
     01.各种技术的整合体！ 
     02.异步交互的技术
 
Ajax的核心对象 XMLHttpRequest   
 1.常用的属性
   01.readyState  ：  表示  XMLHttpRequest对象的状态   
      readyState的取值
        现在我们准备去吃饭：
        01.所有人直接去饭店    ===》 同步
        02.先打电话给饭店（找人先去饭店） ====》异步     
            01.readyState= 0  没打电话  只是决定
            02.readyState= 1  电话已经打了  但是对方还没有接电话
            03.readyState= 2  接通电话了，我们给服务员说 需要订桌
            04.readyState= 3  没有得到具体的恢复，服务员说，稍等 我确认一下有没有空桌！
            05.readyState= 4  服务员确认有或者是没有！ 我们就得到回复！
         
               0：已经创建了  XMLHttpRequest对象，还没有初始化！在open（）之前
               1：XMLHttpRequest对象已经准备就绪，但是还没有与服务器建立连接！在send（）之前
               2：已经调用了send（），与服务器建立连接，但是还没有得到响应
               3：已经接到了Http响应头，但是主体部分还没有获取
               4：响应完成，就可以拿到响应回来的数据进行操作
               
   02.onreadystatechange:每当readyState的值发生了变化，都会触发这个属性，
                                                                 我们通常使用javascript函数来接收！  （回调函数）
   
   03.responseXML: 获取服务器返回的XML内容            
   04.responseTEXT: 获取服务器返回的文本内容   
   05.status :Http状态码
         1xx:信息响应类，表示接收到请求，可以继续处理
         2xx:处理成功类，表示我们的响应成功了
         3xx:重定向响应类，表示 为了完成功能，需要进一步操作。
         4xx:客户端错误，表示我们的请求不合法
         5xx:服务端错误，表示服务器内部代码错误
   06.statusText: Http状态码对应的文本，只有   readyState= 3|4的时候才能用    
   
   
 2.常用的方法
      01.abort() :暂停与XMLHttpRequest对象相关联的http请求，XMLHttpRequest对象还原成初始化状态！
      02.open(String method,String url,boolean asynch,String userName,String password)
                      后三个参数可选！
         method ：默认是get   可以使用post  delete put head
         boolean asynch默认是true！异步！          
         userName,password:在某些服务器需要认证的时候使用！
      03.setRequestHeader("key","value"):设置请求的头部信息  ！
                         当readState=1的时候，就是open（）之后设置，否则会产生异常！
      04.send() : 发送请求到服务器
          001.get方式的
              send()
              send(null)
                                  因为我们的数据拼接在了url之后！
          002.post方式的
              send(需要给后台的数据)
                                   必须设置请求头
               xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");              
      05.getResponseHeader("key")：获取指定的相应信息！
                           在readyState= 3|4的时候使用，否则返回一个空串！
      06.getAllResponseHeaders():以字符串的形式返回所有的相应头部信息，
                        在readyState= 3|4的时候使用，否则返回null！
  
   
   
Jquery来实现Ajax！  简化了我们的ajax代码！

   $.ajax({
      url:服务器地址,
      type:请求方式,
      data:需要传递给后台的数据,
      dataType:希望服务器返回的数据类型,  xml  html  json  text  script
      timeout:请求的超时事件,
      cache:默认为true,设置成false 就不会从浏览器缓存中查询,
      contentType:默认值就是 application/x-www-from-urlencoding ,
      beforeSend:发送请求之前执行的函数,
      success:成功之后执行的函数,
      error:失败之后执行的函数,
      complete:请求完成之后执行的函数，无论失败或者是成功
   });
   
   
   
               
               
               
               
               
               
               