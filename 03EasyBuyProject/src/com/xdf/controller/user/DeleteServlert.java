package com.xdf.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xdf.service.user.UserService;
import com.xdf.service.user.impl.UserServiceImpl;

@WebServlet("/deleteServlet")
public class DeleteServlert extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String id = req.getParameter("id");
		// 调用service的代码
		UserService service = new UserServiceImpl();

		boolean flag = service.deleteUser(id);
		if (flag) {
			// 删除成功之后
			resp.sendRedirect("listServlet");
		}

	}

}
