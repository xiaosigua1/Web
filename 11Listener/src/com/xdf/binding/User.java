package com.xdf.binding;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * 
 * 只有实现HttpSessionBindingListener接口的类
 * 才能被监听！
 */

public class User implements HttpSessionBindingListener {

	private String userName; // 在线用户名
	private int onlineNums = 0; // 默认在线人数是0

	public User(String userName) {
		this.userName = userName;
	}

	/**
	 * 绑定事件
	 * 在session中管理这个User的时候 会进入此方法
	 */
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("进入了  valueBound  人数+1");
		System.out.println("登录的用户名是：" + userName);
		onlineNums++;
	}

	/**
	 * 解绑事件
	 * 01.session超时       maxInactiveInterval(5000)  以毫秒为单位   5S
	 * 02.session失效          invalidate()
	 * 03.session清除或者修改对象的时候  remove()   再次setAttribute()
	 * 04.服务器关闭
	 */
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println("进入了  valueUnbound  人数-1");
		System.out.println("退出的用户名是：" + userName);
		onlineNums--;

	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getOnlineNums() {
		return onlineNums;
	}

	public void setOnlineNums(int onlineNums) {
		this.onlineNums = onlineNums;
	}

}
