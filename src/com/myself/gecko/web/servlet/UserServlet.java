package com.myself.gecko.web.servlet;

import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myself.gecko.domain.User;
import com.myself.gecko.service.impl.IUserService;
import com.myself.gecko.service.impl.UserServiceImpl;

/**
 * user模块 ,请求时需携带参数method 直接写方法即可
 */
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private static IUserService userService = UserServiceImpl.getUserService();

	public String editUserUI(HttpServletRequest request, HttpServletResponse response) {
		return "/jsp/editUser.jsp";
	}

	public String findById(HttpServletRequest request, HttpServletResponse response) {
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			User user = userService.findById(id);
			if (user != null) {
				request.setAttribute("person", user);
				return "/jsp/home.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/error.jsp";
	}

	public String login(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		try {
			User user = userService.findUserByNameAndPwd(name, password);
			if (user != null) { // 记住用户名,自动登录
				// 解决中文乱码,先编码再存入
				name = URLEncoder.encode(name, "UTF-8");
				password = URLEncoder.encode(password, "UTF-8");

				String remember = request.getParameter("remember");
				Cookie cookie1 = new Cookie("name", name);
				Cookie cookie2 = new Cookie("password", password);
				cookie1.setPath(request.getContextPath());
				cookie2.setPath(request.getContextPath());
				if ("yes".equals(remember)) {
					cookie1.setMaxAge(60 * 60 * 24 * 7);
					cookie2.setMaxAge(60 * 60 * 24 * 7);
				} else {
					cookie1.setMaxAge(0);
					cookie2.setMaxAge(0);
				}
				response.addCookie(cookie1);
				response.addCookie(cookie2);

				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return "/jsp/index.jsp";
			} else {
				request.setAttribute("msg", "密码或用户名错误,请重试");
				return "/jsp/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}

	public String register(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");

		User user = new User();
		user.setName(name);
		user.setPassword(password);
		user.setPhone(phone);

		try {
			userService.register(user);
			response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
}
