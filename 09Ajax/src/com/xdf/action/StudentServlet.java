package com.xdf.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xdf.bean.Student;

/**
 * 模拟从后台数据库获取一个集合 之后返回给前台
 */
@WebServlet("/studentList")
public class StudentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置响应头部信息
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		// 获取后台数据
		Student stu1 = new Student(1, "小白1", 1, "海淀1");
		Student stu2 = new Student(2, "小白2", 0, "海淀2");
		Student stu3 = new Student(3, "小白3", 1, "海淀3");
		Student stu4 = new Student(4, "小白4", 0, "海淀4");
		Student stu5 = new Student(5, "小白5", 1, "海淀5");
		Student stu6 = new Student(6, "小白6", 0, "海淀6");
		// 创建list集合
		List<Student> list = new ArrayList<Student>();
		list.add(stu1);
		list.add(stu2);
		list.add(stu3);
		list.add(stu4);
		list.add(stu5);
		list.add(stu6);
		/**
		 *  把list集合转换成json格式
		 *  01.对象放在{}中
		 *  02.集合放在[]中
		 */
		Gson gson = new Gson();
		String json = gson.toJson(list);
		System.out.println(json);
		// 给用户相应
		PrintWriter pw = resp.getWriter();
		pw.print(json);
		pw.close();
	}
}
