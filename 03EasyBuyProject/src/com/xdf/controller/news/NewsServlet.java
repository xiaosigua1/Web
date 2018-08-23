package com.xdf.controller.news;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.xdf.bean.Easybuy_News;
import com.xdf.service.news.NewsService;
import com.xdf.service.news.impl.NewsServiceImpl;

/**
 * 
 * 演示文件上传
 *   
 * 文件上传的注意点：
 *   01.引入需要的jar包
 *         (fileupload     io)
 *   02. form表单增加 enctype="multipart/form-data" 
 *        001.之前的req.getParameter()不能获取值
 *        002.不会我们的数据进行编码
 *   03.虽然我们的表单是文件上传类型
 *      但是：表单中有很多字段都不是文件上传类型！
 *        001. 普通的文本输入框是一种方式
 *        002. 文件上传那些框框 是另外一种方式      
 *   04.表单中辣么多框框，我们怎么知道那些是普通的？那些是文件上传！
 *        ServletFileUpload.isMultipartContent(request)
 *        根据我们用户的请求，来判断我们的表单是否是文件上传类型！
 *        ServletFileUpload还有一个方法是获取form表单中所有的框框！！！
 *        List<FileItem> list= parseRequest(request);
 *         只要是form表单是文件上传类型，无论是什么框框，都被封装成一个FileItem对象！
 *   05.遍历list集合  判断是文件上传的框框还是普通的框框
 *        FileItem中有一个方法isFormFiled()  返回是一个boolean类型的值！
 *          true : 普通的框框
 *          fasle: 文件上传的框框
 *   06.开始将文件 上传到 内存或者是服务器的某个文件夹中
 *         FileItem中还有两个方法
 *     输入流    getInputStream()   把上传文件放进内存                          
 *     输出流    getOutputStream()  把内存中的文件放进服务器的某个位置
 *     
 *   07.想要实现文件上传 必须使用一个类  ===》DiskFileItemFactory  implements  FileItemFactory 
 *      真正实现文件上传的步骤
 *      001.创建DiskFileItemFactory的实例对象  设置缓冲区大小 ，存放位置 ，可以不设置，有默认值
 *      002.通过DiskFileItemFactory创建出 ServletFileUpload
 *         通过ServletFileUpload.isMultipartContent(request)
 *         就可以得到我们的form表单是否为文件上传类型  
 *      003.ServletFileUpload.parseRequest(request);
 *          封装所有的form中的框框  返回是 List<FileItem>
 *      004.开始遍历list集合  没遍历一次都有使用     isFormFiled() 来判断是普通框框还是文件上传框框
 *          001.如果是普通框框  使用 getFiledName 个getString 来获取字段的名称和字段的值
 *               getFiledName获取的是form表单中的name属性值
 *               getString获取的是用户实际的输入
 *          002.如果是文件框框   使用getInputStream   把上传文件放进内存 
 *                               getName       上传文件的名称
 *                            getOutputStream  把内存中的文件放进服务器的某个位置  
 * 
 * 
 */
@WebServlet("/newsServlet")
public class NewsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("默认的临时文件位置》》》"
				+ System.getProperty("java.io.tmpdir"));

		// 1.创建DiskFileItemFactory的实例对象 设置缓冲区大小 ，存放位置 ，可以不设置，有默认值
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2.通过DiskFileItemFactory创建出 ServletFileUpload
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 3.判读是否为文件上传类型
		boolean flag = upload.isMultipartContent(req);
		// 创建新闻对象 便于后续接收
		Easybuy_News news = new Easybuy_News();

		if (flag) { // 证明是文件上传类型
			try {
				// 4. 通过parseRequest(req) 获取所有的框框
				List<FileItem> items = upload.parseRequest(req);
				// 5. 使用迭代器进行遍历
				Iterator<FileItem> its = items.iterator();
				while (its.hasNext()) {
					FileItem item = its.next(); // 获取每一个框框 （普通，上传）
					if (item.isFormField()) { // 普通的框框
						// 6.如果是普通框框 使用 getFiledName 个getString 来获取字段的名称和字段的值
						String fileName = item.getFieldName();
						switch (fileName) {
						case "title": // 新闻的标题
							news.setTitle(item.getString("utf-8"));
							break;
						case "createTime":// 新闻的时间
							news.setCreateTime(new SimpleDateFormat(
									"MM/dd/yyyy").parse(item.getString("utf-8")));
							break;
						case "content": // 新闻的内容
							news.setContent(item.getString("utf-8"));
							break;
						}
					} else { // 文件上传
						// 必须获取服务器的文件上传位置
						String uploadPath = req.getSession()
								.getServletContext().getRealPath("upload/");
						// 创建上传文件夹
						File file = new File(uploadPath);
						if (!file.exists()) {
							file.mkdirs();
						}
						String fileName = item.getName(); // 上传文件的名称
						// 解决文件上传乱码
						fileName = new String(fileName.getBytes(), "utf-8");
						// 判断用户是否选择文件
						if (!"".equals(fileName) && null != fileName) {
							File saveFile = new File(uploadPath, fileName);
							item.write(saveFile); // 真正的写入磁盘
							news.setImg(uploadPath + fileName); // 写入数据库
						}
					}

				}

			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 调用service层代码
		NewsService service = new NewsServiceImpl();
		int num = service.add(news);
		if (num > 0) {
			System.out.println("成功");
		} else {
			System.out.println("失败");
		}
	}

}
