package com.xdf.binding;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class BindingServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 处理post请求乱码 因为没有使用过滤器
		req.setCharacterEncoding("utf-8");
		// 根据请求获取用户名
		String userName = req.getParameter("userName");
		// 判断用户是否为空
		if (userName != null && !"".equals(userName)) {
			// 实例化User对象
			User user = new User(userName);
			// 把对象放进session中 就会触发到 监听器HttpSessionBindingListener 的valuBound方法
			System.out.println("**************************************");
			req.getSession().setAttribute("user", user);
			// req.getSession().setMaxInactiveInterval(5); // 设置session的失效时间
			System.out.println("**************************************");
			// 重定向到主页面
			resp.sendRedirect("success.jsp");
		} else { // 用户名为空
			resp.sendRedirect("bindingLogin.jsp");
		}

	}
}
