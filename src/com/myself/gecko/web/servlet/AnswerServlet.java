package com.myself.gecko.web.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnswerServlet extends BaseServlet {
	
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		String pageStr = request.getParameter("currentPage");
		try {
			int currentPage = Integer.parseInt(pageStr);
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
}
