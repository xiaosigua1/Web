
���⣺
���Ǹ���web��Ŀ��ʱ���мǣ�
�Ҽ������Ŀ�� ѡ��properties ֮������web  �ı���Ŀ���ƣ�



JSP���ݴ���

01.��login.jspҳ�� �û���������
02.��doLogin.jspҳ����л�ȡ����
     ��ô��ȡ�ģ�����  request.getParameter("name������ֵ")
     
���⣿

����form���е�����ʽ ��post!
�������룡   
�����ʽ ��  ʹ��  request.setCharacterEncoding("UTF-8");  �α겻�α�
����������������ԴӸ����Ͻ������

get��������   �α��İ취  ȥ tomcat�е�conf/server.xml�ļ��� connector�ڵ�������
 URIEncoding="utf-8" 
  
  
  
  ת�����ض��������
  
  01��ת���Ƿ���������Ϊ���ض����ǿͻ��˵���Ϊ
  02. ת�����ݱ������ض������ݶ�ʧ
  03. ת��URL��ַ����仯,�ض���URL��ַ��仯
  04. �ض����������η��ʷ�������ת�����ӳ�һ������������
  
  
 ��ô��ȡ���и�ѡ��Ķ��ֵ������
  String [] loves= request.getParameterValues("love");
 
 request�����õķ���
  
 getParameter()   ����nameֵ��ȡvalue
 setCharacterEncoding() ����post��������
 getParameterValues()   ��ȡҳ����name��Ӧ��value����
 
 
 
 
 
 
 
  
  
  
  
  
  
  