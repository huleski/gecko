package com.myself.gecko.web.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.service.IAnswerService;

public class AnswerServlet extends BaseServlet {
	private static IAnswerService answerService = new AnswerServiceImpl();
	
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		String pageStr = request.getParameter("currentPage");
		String qidStr = request.getParameter("qid");
System.out.println("qidStr = " + qidStr);
		try {
			int currentPage = Integer.parseInt(pageStr);
			int qid = Integer.parseInt(qidStr);
			
			String data = answerService.ajaxLoad(currentPage, qid);
			response.getWriter().print(data);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
}
