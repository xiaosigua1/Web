package com.xdf.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xdf.bean.Easybuy_User;
import com.xdf.service.user.UserService;
import com.xdf.service.user.impl.UserServiceImpl;

/**
 * 查询所有用户信息
 * 失去一日甚易,欲得回已无途！
 *  
 * @author 小葱拌豆腐
 * 2017-11-14上午11:29:07
 */
@WebServlet("/listServlet")
public class ListUserServlert extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 调用service层代码
		UserService service = new UserServiceImpl();
		// 查询所有的用户信息
		List<Easybuy_User> userList = service.findAllUsers();
		// 把userList放入作用域
		req.setAttribute("userList", userList);
		// 转发
		req.getRequestDispatcher("main.jsp").forward(req, resp);

	}

}
