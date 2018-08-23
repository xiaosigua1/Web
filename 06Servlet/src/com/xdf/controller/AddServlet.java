package com.xdf.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class AddServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("进入了====》 init");
		System.out.println("从当前的servlet配置中获取初始化参数："
				+ config.getInitParameter("userName"));
		System.out.println("从servletContext获取初始化参数："
				+ config.getServletContext().getInitParameter("userName"));
	}

}
