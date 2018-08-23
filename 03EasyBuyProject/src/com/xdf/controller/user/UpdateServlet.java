package com.xdf.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xdf.bean.Easybuy_User;
import com.xdf.service.user.UserService;
import com.xdf.service.user.impl.UserServiceImpl;

@WebServlet("/updateUser")
public class UpdateServlet extends HttpServlet {

	UserService service = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		// 获取id
		String id = req.getParameter("id");
		String method = req.getParameter("method");

		// 根据前台用户的选择 进入指定的方法
		switch (method) {
		case "findById":
			findById(id, req, resp);
			break;
		case "update":
			String loginName = req.getParameter("loginName");
			String userName = req.getParameter("userName");
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
			int sex = Integer.parseInt(req.getParameter("sex"));
			Easybuy_User user = new Easybuy_User();
			user.setId(Integer.parseInt(id));
			user.setLoginName(loginName);
			user.setUserName(userName);
			user.setSex(sex);
			user.setEmail(email);
			user.setMobile(mobile);
			update(user, req, resp);
			break;

		}

	}

	// 修改
	private void update(Easybuy_User user, HttpServletRequest req,
			HttpServletResponse resp) {
		boolean flag = service.update(user);
		if (flag) {
			try {
				resp.sendRedirect("listServlet");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				req.getRequestDispatcher("/update.jsp").forward(req, resp);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// 查询指定的用户信息
	private void findById(String id, HttpServletRequest req,
			HttpServletResponse resp) {

		Easybuy_User user = service.findOne(id);
		// 让数据回显
		req.setAttribute("updateUser", user);
		try {
			req.getRequestDispatcher("/update.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
