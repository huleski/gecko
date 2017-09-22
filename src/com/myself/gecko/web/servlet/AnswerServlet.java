package com.myself.gecko.web.servlet;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IAnswerService;
import com.myself.gecko.service.impl.AnswerServiceImpl;

public class AnswerServlet extends BaseServlet {
	private static IAnswerService answerService = new AnswerServiceImpl();
	
	public String add(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			return "/500.jsp";
		}
		
		String content = request.getParameter("content");
		String pureContent = request.getParameter("pureContent");
		String qidStr = request.getParameter("qid");
		String anonymousStr = request.getParameter("anonymous");
		
		try {
			Answer answer = new Answer();
			
			int qid = Integer.parseInt(qidStr);
			Question question = new Question();
			question.setId(qid);
			answer.setQuestion(question);
			
			answer.setUser(user);
			answer.setContent(content);
			answer.setDate(new Date());
			answer.setPureContent(pureContent);
			if(anonymousStr != null) {
				int anonymous = Integer.parseInt(anonymousStr);
				answer.setAnonymous(anonymous);
			}
			answerService.save(answer);
			response.sendRedirect(request.getContextPath() + "/questionServlet?method=findById&id=" + qid);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}
	
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		String pageStr = request.getParameter("currentPage");
		String qidStr = request.getParameter("qid");
		try {
			int currentPage = Integer.parseInt(pageStr);
			int qid = Integer.parseInt(qidStr);
			
			String data = answerService.ajaxLoad(currentPage, qid);
			response.getWriter().print(data);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}
}
