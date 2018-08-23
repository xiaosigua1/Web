package com.xdf.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * 测试过滤器的执行顺序
 */

@WebFilter(urlPatterns = "/*")
public class TestFilter implements Filter {

	/**
	 * 服务器启动的时候  初始化
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("TestFilter=============》init");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("TestFilter=============》doFilter");
		chain.doFilter(request, response);
	}

	/**
	 * 服务器关闭的时候执行
	 */
	@Override
	public void destroy() {
		System.out.println("TestFilter=============》destroy");
	}
}
