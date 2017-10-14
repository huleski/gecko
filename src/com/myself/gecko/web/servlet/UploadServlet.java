package com.myself.gecko.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IUserService;
import com.myself.gecko.service.impl.UserServiceImpl;

public class UploadServlet extends HttpServlet {
	IUserService userService = UserServiceImpl.getUserService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return;
		}

		// 1.创建DiskFileItemFactory对象，配置缓存用
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		// 2. 创建 ServletFileUpload对象
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

		// 3. 设置文件名称编码
		servletFileUpload.setHeaderEncoding("utf-8");

		// 4. 开始解析文件
		try {
			List<FileItem> items = servletFileUpload.parseRequest(request);
			for (FileItem fileItem : items) {

				if (fileItem.isFormField()) { // >> 普通数据
					// String info = fileItem.getString("utf-8");
					// System.out.println("info:" + info);
				} else { // >> 文件
					String fieldName = fileItem.getFieldName(); // 获得name值
					// 1. 获取文件名称
					String name = fileItem.getName();
					String subfix = name.substring(name.lastIndexOf(".")); // 后缀名
					// 2. 获取文件的实际内容
					InputStream is = fileItem.getInputStream();

					// 创建文件名前缀名
					StringBuilder fileName = new StringBuilder();
					Date date = new Date();
					String dateStr = new SimpleDateFormat("yyyyMMdd").format(date);
					long time = date.getTime();
					fileName.append(dateStr).append("_").append(time);

					// 随机4位数字
					String s = "0123456789ABCDEF";
					Random r = new Random();
					for (int i = 0; i < 4; i++) {
						fileName.append(s.charAt(r.nextInt(16)));
					}
					fileName.append(subfix); // 得到最后文件名

					String uploadPath = null;
					String filePath = null;
					String returnPath = null;

					if (fieldName.equals("photo")) { // 上传头像
						uploadPath = getServletContext().getRealPath("/upload/photo");
						filePath = uploadPath + "/" + fileName;
						returnPath = "upload/photo/" + fileName;
						
						//更新用户
						user.setPhoto(returnPath);
						userService.update(user);
						request.getSession().setAttribute("user", user);
					} else if (fieldName.equals("backphoto")) { // 上传背景图
						uploadPath = getServletContext().getRealPath("/upload/backphoto");
						filePath = uploadPath + "/" + fileName;
						returnPath = "upload/backphoto/" + fileName;
						
						//更新用户
						user.setBackphoto(returnPath);
						userService.update(user);
						request.getSession().setAttribute("user", user);
					} else if (fieldName.equals("titlePicture")) { // 上传文章题图
						uploadPath = getServletContext().getRealPath("/upload/titlePicture");
						filePath = uploadPath + "/" + fileName;
						returnPath = "upload/titlePicture/" + fileName;
					}
					// 3. 保存文件
					FileUtils.copyInputStreamToFile(is, new File(filePath));
					response.getWriter().print(returnPath);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
