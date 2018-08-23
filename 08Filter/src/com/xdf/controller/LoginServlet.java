package com.xdf.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("进入了==============》LoginServlet");
		// 获取用户的输入
		String userName = req.getParameter("userName");
		System.out.println(userName);
		if (userName != null && !"".equals(userName)) {
			req.getSession().setAttribute("user", userName); // 保存用户信息
			resp.sendRedirect("main.jsp");
		} else {
			resp.sendRedirect("login.jsp");
		}

	}

}
