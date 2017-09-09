package com.myself.gecko.web.filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.myself.gecko.domain.User;
import com.myself.gecko.service.impl.UserServiceImpl;
import com.myself.gecko.util.CookUtils;

public class AutoLoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession session = httpServletRequest.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			Cookie[] cookies = httpServletRequest.getCookies();
			String name = CookUtils.getCookieValueByName("name", cookies);
			String password = CookUtils.getCookieValueByName("password", cookies);
			
			if(name != null && password != null) {
				//取出后需解码
				name = URLDecoder.decode(name, "UTF-8");
				password = URLDecoder.decode(password, "UTF-8");
				try {
					user = UserServiceImpl.getUserService().findUserByNameAndPwd(name, password);
					if(user != null) {
						session.setAttribute("user", user);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		chain.doFilter(httpServletRequest, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
