package com.myself.gecko.web.servlet;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IQuestioinService;
import com.myself.gecko.service.impl.QuetionServiceImpl;
import com.sun.xml.internal.bind.v2.model.core.ID;

public class QuestionServlet extends BaseServlet {
	private static IQuestioinService questionService = new QuetionServiceImpl();
	
	public String findById(HttpServletRequest request, HttpServletResponse response) {
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			Question question = questionService.findQuestioinById(id);
			request.setAttribute("question", question);
			return "/jsp/question.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		String currentPageStr = request.getParameter("currentPage");
		String personIdStr = request.getParameter("personId");
		
		try {
			int currentPage = Integer.parseInt(currentPageStr);
			int personId = Integer.parseInt(personIdStr);
			String result = questionService.ajaxQueryByUid(currentPage, personId);
			response.getWriter().print(result);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/error.jsp";
	}
	public String addQuestion(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		
		try {
			if(user == null) {
				response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
				return null;
			}
			//封装question对象
			Map<String, String[]> map = request.getParameterMap();
			Question question = new Question();
			BeanUtils.populate(question, map);
			question.setUser(user);
			Topic topic = new Topic();
			int id = Integer.parseInt(request.getParameter("tid"));
			topic.setId(id);
			question.setTopic(topic);
			question.setDate(new Date());
			
			questionService.save(question);
			
			response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
}
