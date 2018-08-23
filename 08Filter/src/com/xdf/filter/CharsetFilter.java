package com.xdf.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 针对于post请求设置的  解决乱码的过滤器
 * 
 * 如果我们使用的是注解开发！
 * filter的执行顺序和 类名的首字母有关系   A  >   B  >  C
 * 
 * 如果自己想控制执行顺序  需要引入外部jar包 使用@WebFilterSort中的value
 */
@WebFilter(urlPatterns = "/*")
public class CharsetFilter implements Filter {

	/**
	 * 服务器启动的时候  初始化
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("CharsetFilter=============》init");
	}

	/**
	 * doFilter 
	 * 01.用户每访问一次项目，进入一次
	 * 02.务必要放行 chain.doFilter(request, response);
	 * 03.HttpServletRequest   extends  ServletRequest
	 *     它们两个都是接口
	 * 04.如果配置了多个filter  默认的执行顺序是按照 xml文件中filter-mapping的书写顺序执行的！
	 * 05.后续我们会接触到 listener(监听器)
	 *     这时候我们的web.xml文件中就出出现多种节点
	 *     context-param
	 *     listener
	 *     filter
	 *     servlet
	 *     他们之间的执行顺序如何？
	 *     
	 *     context-param  >   listener  > filter  > servlet
	 *     
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("CharsetFilter=============》doFilter");
		// 治本 解决post请求乱码问题
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		/**
		 * 放行
		 * 01.如果有其他的过滤器 就去执行其他的过滤器
		 * 02.如果没有过滤器，则去执行响应的servlet
		 */
		// 验证用户是否登录 不登录不允许进入主界面
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		/**
		 * HttpServletRequest才有getSession() 所以需要向下转型
		 * 放行的条件
		 * 01.请求中有用户信息   
		 * 02.请求的路径有login
			getRequestURL===>http://localhost:8080/08Filter/login  统一资源定位符
			getRequestURI===>/08Filter/login  项目名+请求地址
			getContextPath===>/08Filter   项目名
			getServletPath===>/login    请求地址
			03.请求中.js .css .jpg
			04.请求不能是.jsp
		 */
		String userName = (String) req.getSession().getAttribute("user");
		// 获取用户请求的路径
		String path = req.getRequestURI();
		if (path.indexOf("login") > -1
				|| userName != null
				|| (path.contains(".css") || path.contains(".js")
						|| path.contains(".jpg") || !path.contains(".jsp"))) {
			chain.doFilter(request, response); // 放行
		} else {
			resp.sendRedirect("login.jsp");
		}

	}

	/**
	 * 服务器关闭的时候执行
	 */
	@Override
	public void destroy() {
		System.out.println("CharsetFilter=============》destroy");
	}
}
