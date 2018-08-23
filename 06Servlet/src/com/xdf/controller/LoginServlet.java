package com.xdf.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 失去一日甚易,欲得回已无途！
 *  
 * @author 小葱拌豆腐
 * 2017-11-9上午9:57:54
 * 
 * 
 * servlet的生命周期  和执行流程
 * 
 * 
 * 
 */
public class LoginServlet extends HttpServlet {

	/**
	 * 初始化操作
	 * 如果没有在web.xml文件中设置 load-on-startup!
	 * 只会在用户访问当前servlet的时候执行一次！
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("进入了====》 init");
		System.out.println("从当前的servlet配置中获取初始化参数："
				+ config.getInitParameter("userName"));
		System.out.println("从servletContext获取初始化参数："
				+ config.getServletContext().getInitParameter("userName"));

	}

	/**
	 *就是一个派发器，根据用户的请求方式来分发请求是get还是post
	 *之后进入 doGet/doPost
	 *
	 *用户每请求当前servlet一次 ，执行一次！
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("进入了====》 service");
		super.service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("进入了====》 doGet");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("进入了====》 doPost");
	}

	/**
	 * 在服务器关闭的时候销毁  执行一次！
	 */
	@Override
	public void destroy() {
		System.out.println("进入了====》destroy");
	}

}
