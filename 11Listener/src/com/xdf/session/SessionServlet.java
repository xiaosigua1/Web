package com.xdf.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sessionLogin")
public class SessionServlet extends HttpServlet {

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
		// 把在线人数和登录的用户名放进session作用域
		System.out.println("*****************************************");
		req.getSession().setAttribute("userName", userName);
		System.out.println("*****************************************");
		resp.sendRedirect("sessionSuccess.jsp");

	}
}
