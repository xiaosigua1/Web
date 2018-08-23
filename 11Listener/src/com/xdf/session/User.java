package com.xdf.session;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class User implements HttpSessionListener {

	/**
	 * 因为  web.xml文件中配置了
	 */
	public User() {
		System.out.println("User implements HttpSessionListener  初始化");
	}

	/**
	 * 创建监听
	 * 在用户访问项目的时候
	 */
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("进入了   sessionCreated  人数+1");
		Integer num = (Integer) event.getSession().getServletContext()
				.getAttribute("onlineNums");
		// 第一次访问项目 num==null
		if (num == null) {
			num = 1;
		} else {
			num++;
		}
		// 把总人数放进作用域
		event.getSession().getServletContext().setAttribute("onlineNums", num);
	}

	/**
	 * 销毁监听
	 * 01.session失效
	 * 02.session超时
	 */
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		System.out.println("进入了   sessionDestroyed  人数-1");
		Integer num = (Integer) event.getSession().getServletContext()
				.getAttribute("onlineNums");
		// 第一次访问项目 num==null
		if (num == null) {
			num = 0;
		} else {
			num--;
		}
		// 把总人数放进作用域
		event.getSession().getServletContext().setAttribute("onlineNums", num);

	}

}
