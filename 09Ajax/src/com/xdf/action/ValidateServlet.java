package com.xdf.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");// 处理乱码
		resp.setCharacterEncoding("utf-8");
		String userName = req.getParameter("userName");// 接收用户通过ajax传递过来的用户名
		boolean flag = false;// 定义一个标记 用于前台接收
		if ("admin".equals(userName)) {
			flag = true; // 证明数据库中存在
		}
		PrintWriter pw = resp.getWriter();// 响应数据
		pw.print(flag);
		pw.close();
	}

}
