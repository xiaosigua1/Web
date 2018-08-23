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
 * 用户的注册
 * 
 * 失去一日甚易,欲得回已无途！
 *  
 * @author 小葱拌豆腐
 * 2017-11-9下午12:04:48
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private Logger log = Logger.getLogger(RegisterServlet.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		log.debug("进去了  RegisterServlet 注册");
		request.setCharacterEncoding("utf-8");
		// 通过请求获取用户注册信息 并封装成一个User对象
		Easybuy_User user = new Easybuy_User();
		user.setEmail(request.getParameter("email"));
		user.setIdentityCode(request.getParameter("pid"));
		user.setLoginName(request.getParameter("userName"));
		user.setUserName(request.getParameter("realName"));
		user.setPassword(request.getParameter("password"));
		user.setSex(Integer.parseInt(request.getParameter("sex")));
		user.setMobile(request.getParameter("phone"));
		user.setType(0);
		// 调用service层代码
		UserService service = new UserServiceImpl();
		service.register(user);
	}
}
