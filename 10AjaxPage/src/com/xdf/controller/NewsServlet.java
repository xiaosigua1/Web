package com.xdf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xdf.bean.Easybuy_News;
import com.xdf.dao.NewsDao;
import com.xdf.dao.NewsDaoImpl;
import com.xdf.util.PageUtil;

@WebServlet("/newsList")
public class NewsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		// 调用service层代码
		NewsDao dao = new NewsDaoImpl();
		// 创建分页需要的工具类
		PageUtil util = new PageUtil();
		util.setTotalCount(dao.getCounts()); // 获取总记录数
		// 获取用户传递过来的当前页
		String num = req.getParameter("pageIndex");
		System.out.println(num);
		if (num != null && num != "") {
			util.setPageIndex(Integer.parseInt(num));
		} else {
			util.setPageIndex(1);
		}
		List<Easybuy_News> list = dao.findAllNewsByPage(util);
		if (list != null) {
			list.get(0).setUtil(util); // 给分页的属性赋值 方便前台获取
			Gson gson = new Gson();
			String json = gson.toJson(list);
			PrintWriter writer = resp.getWriter();
			writer.print(json);
			writer.close();
		}

	}

}
