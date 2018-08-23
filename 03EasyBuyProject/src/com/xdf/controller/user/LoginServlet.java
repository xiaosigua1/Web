package com.xdf.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.xdf.bean.Easybuy_User;
import com.xdf.service.user.UserService;
import com.xdf.service.user.impl.UserServiceImpl;

/**
 * 现在这个LoginServlet存在的意义
     01.获取login页面用户输入的信息
     02.调用service层得到数据库数据
     03.进行比对返回用户响应  
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private Logger log = Logger.getLogger(LoginServlet.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp); // 哪怕用户是get请求也得执行doPost
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		log.debug("进入了LoginServlet  登录");
		// 解决post请求乱码问题
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("userName");
		String pwd = request.getParameter("password");
		// 调用service层代码
		UserService service = new UserServiceImpl();
		Easybuy_User user = service.login(name, pwd);
		if (user != null) {
			// 把登录的用户信息存在session作用域中
			request.getSession().setAttribute("loginUser", user);
			// 转发给listServlet
			request.getRequestDispatcher("/listServlet").forward(request,
					response);
		} else {
			// 重定向到login.jsp
			response.sendRedirect("login.jsp");
		}
	}
}
