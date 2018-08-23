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

/**
 * 新增
 * 失去一日甚易,欲得回已无途！
 *  
 * @author 小葱拌豆腐
 * 2017-11-14上午11:15:48
 */
@WebServlet("/addServlet")
public class AddServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 解决乱码问题
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		// 获取前台用户的输入
		String loginName = req.getParameter("loginName");
		String password = req.getParameter("password");
		String userName = req.getParameter("userName");
		String identityCode = req.getParameter("identityCode");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		int sex = Integer.parseInt(req.getParameter("sex"));
		// 创建对象并赋值
		Easybuy_User user = new Easybuy_User(sex, loginName, password,
				userName, identityCode, email, mobile);
		// 调用service层代码
		UserService userService = new UserServiceImpl();
		boolean flag = userService.addUser(user);
		if (flag) {
			// 重新从数据库中查询一遍数据
			resp.sendRedirect("listServlet");
		} else {
			resp.sendRedirect("add.jsp");// 后台不能加 /
		}

	}

}
