Web  (java  EE)  

 B/S  ������ȫ�����ڷ�������

 B/S ��   C/S ����
 
B: Browser  �����
C��Client   �ͻ���
S��Server   ������
 
 01. C/S �������ظ��ֿͻ���   
     B/S ֻ��Ҫ�������
 
 02. C/S ���ܵĸߵͣ�ȡ���ڿͻ��˵����� 
     B/S ���ܵĸߵͣ�ȡ���ڷ�����������   
 
 03. C/S ����а汾���±�����У������޷�ʹ���¹���
     B/S ���������Զ����£��������������Ҫ   
 
 04. C/S  �Բ���ϵͳ������
     B/S  �����ϵͳ��ϵ���������
     
URI ��  URL

 ���ӣ�
     ���������ڴ�绰��A��B �����ģ�    URI 
     B�ش�˵����·��
     A��ȥ�Լ������еı���·���ҵ�B�� A��B����һ�����У�
   
  ���B˵��XX��xx����   ����·��  ����A�ܲ����ҵ�B���� ���ԣ�  URL
       
 URI  ͳһ��Դ��ʶ��
 
 URL  ͳһ��Դ��λ��    
  
  
 ��̬ҳ��;�̬ҳ�������
   
  01.��̬ҳ�� ���������Ƿ��������н���
  02.��̬ҳ��  ������û���ͬ��������Ӧһ����ͬҳ�� 
 
 ���õ�web������   
 
 Tomcat     ������    
 JBoss      ������   
 WebLogic   ������ 
 
 
     
 Tomcat������ �ļ�����         
     
01.bin  ��ŷ�������������ֹͣ�ĸ��ֽű��ļ� windows(.bat)  linux(.sh)
02.conf ��ŷ������ĸ��������ļ�
        001.context.xml 
        002.server.xml  ���ö˿ں�
        003.web.xml     sessionʧЧ����ӭ����  mime         
03.lib  ��ŷ���������ʱ��Ҫ��jar��
04.logs ��ŷ���������ʱ��������־�ļ�
05.temp ��ŷ���������ʱ��Ҫ����ʱ�ļ�    
06.webapps  ���ǵ�web��Ŀ����ĵط�
07.work  ���û��������ǵ���Ŀ���ڴ��ļ����л����ɶ�Ӧ���ļ�     
     
     
     
�����ǵ�web��Ŀ�� �����ǵ�java��Ŀ���������ļ�
1.java EE :web��Ŀ��Ҫ��jar
2.webRoot
    01.META-INF :web��Ŀ��Ҫ��Ԫ��Ϣ
    02.WEB-INF  :��ȫ·�����û��޷�����
        001.lib :�ⲿjar���λ�ã�����Ҫ�����ֶ���build path
        002.web.xml  :��Ŀ�����ļ� �� ��������conf/web.xml
                   ������������ʱ�򣬻���ȥ���� ��������conf/web.xml
                  ��conf/context.xml�ļ�����������䣡
                  �������ǵ�ǰ��Ŀ��web.xml
         <WatchedResource>WEB-INF/web.xml</WatchedResource>
                 ��������ļ��ж���������ͬ����Ϣ��Ĭ��ȡֵ��������Ŀ�е�web.xml��
    03.index.jsp ҳ�� ===����̬ҳ��
    
    
 http://localhost  :  8080    /01WebBase/index.jsp    
  Э��      ����ip��ַ         �˿ں�         ��Ŀ����       ��Դ·��
    
 http://localhost  :  8080    /01WebBase/              URI
 http://localhost  :  8080    /01WebBase/index.jsp     URL
      
   
   
   jsp  (java  server pages) :��һ�ֶ�̬��ҳ�Ŀ���������
   
 jsp ҳ��Ԫ�ذ�����
    1. HTML��̬ҳ��  
    2.<%  javaС�ű�%>
    3.<%@ ָ�� %> 
    4.<%=���ʽ %> 
    5.<%! ��������,��Ա���� %>  
    6.  html��ע�� ===<!-- ҳ����Կ��� -->
        jsp��ע�� ===<%-- ҳ�治���Կ��� --%>
    
 
 
 �۲�first.jspҳ��
 
 <%@ page language="java" import="java.util.*" 
 pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
 
                page��  jsp9�����ö���֮һ����ǰҳ��
    language="java" ��   ��ǰҳ�����ʹ�õ�����
 import="java.util.*"   ����java������util���µ�������
pageEncoding="UTF-8" ��  ��ǰҳ��ı����ʽ 
contentType="text/html; charset=utf-8" :��ǰҳ�������������ʾ�ĸ�ʽ   

<meta http-equiv="content-type" content="text/html;charset=utf-8">    
  �û���ǰ��ҳ������ı����ʽ��  
    
<%
String path = request.getContextPath();  ��Ŀ�ĸ�·��    /01WebBase

http://localhost:8080/01WebBase/

String basePath = 
request.getScheme()+      �����Э��
"://"+
request.getServerName()+  �������������
":"+
request.getServerPort()+  ����������˿ں�
path+"/";                 ��Ŀ�ĸ�·��
%>
    
 <base href="<%=basePath%>"> 
 ��  localhost:8080/01WebBase/���������·��
    
    
 û�ж���������ôʹ����������Լ���������  ѹ�����У�
 ����ͨ��   ����   ������=new ����();
 
 
 ���ö���:�ײ������ʵ�����ˣ�����ֱ��ʹ�ö��󼴿ɣ�
                
                JSP�ľŴ����ö��� (������jspҳ��ʹ��)
                
page                   ��ǰҳ��                        this
pageContext       ��ǰҳ�������Ķ���                PageContext
request                �������                        HttpServletRequest
response               ��Ӧ����                        HttpServletResponse
session                �Ự����                        HttpSession
application           Ӧ�ó������                   ServletContext
out                     �������                      JspWriter
config                  ���ö���                      ServletConfig
exception               �쳣����                      Throwable
   
   
   
   jsp��ʵ����һ��servlet��
   servlet��ʵ����һ��java�࣡
   
   
   
  ����������<% %> ������ _jspService()�����У�   �ֲ�������
  ����������<%! %> �����ڶ�Ӧ��jsp���У�   ��Ա������
  ����ֻ�ܶ�����  <%! %> 
   
   
   jsp��ִ������
	   01.����׶�:��jsp�ļ������.javaԴ�ļ�
	                             ���jsp�ļ�û�б��޸ģ���ô����׶�ִֻ��һ�Σ�
	                             
	   02.����׶Σ�.javaԴ�ļ������.class�ļ�
	   
	   03.ִ�н׶Σ� ִ��.class�ļ� ת����jsp���ظ��û�
	   
   
   jsp����������
       01. init����ʼ���� ֻ�����û���һ�η���ҳ���ʱ��ִ��һ�Σ�
       02.destroy�����٣� ֻ�з������رյ�ʱ��ִ��һ�Σ�
       03.service�� �û�ÿ����һ�Σ�ִ��һ�Σ�
   
   
    
    
    
     
     
     
