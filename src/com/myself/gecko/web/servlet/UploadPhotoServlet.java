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

import com.myself.gecko.domain.User;
import com.myself.gecko.service.IUserService;
import com.myself.gecko.service.impl.UserServiceImpl;

public class UploadPhotoServlet extends HttpServlet {
	IUserService userService = UserServiceImpl.getUserService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
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
//					String info = fileItem.getString("utf-8");
//					System.out.println("info:" + info);
				} else { // >> 文件
					// 1. 获取文件名称
					String name = fileItem.getName();
					String subfix = name.substring(name.lastIndexOf(".")); //后缀名
					// 2. 获取文件的实际内容
					InputStream is = fileItem.getInputStream();
					
					//创建文件名前缀名
					StringBuilder fileName = new StringBuilder();
					Date date = new Date();
					String dateStr = new SimpleDateFormat("yyyyMMdd").format(date);
					long time = date.getTime();
					fileName.append(dateStr).append("_").append(time);
					
					//随机4位数字
					String s="0123456789ABCDEF";
					Random r = new Random();
					for (int i = 0; i < 4; i++) {
						fileName.append(s.charAt(r.nextInt(16)));
					}
					fileName.append(subfix);	//得到最后文件名
					
					String uploadPath = getServletContext().getRealPath("/upload/photo");
					// 3. 保存文件
					String filePath = uploadPath + "/" + fileName;
					FileUtils.copyInputStreamToFile(is, new File(filePath));
					
					//存进user里
					user.setPhoto(filePath);
					//userService.update(user);
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
