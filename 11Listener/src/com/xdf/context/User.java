package com.xdf.context;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class User implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("contextInitialized=================>初始化");
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("contextInitialized=================>销毁");
	}

}
