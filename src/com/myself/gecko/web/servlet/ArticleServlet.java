package com.myself.gecko.web.servlet;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IArticleServive;
import com.myself.gecko.service.impl.ArticleServiceImpl;

public class ArticleServlet extends BaseServlet {
	IArticleServive articleService = new ArticleServiceImpl();
	
	/**
	 * 点赞
	 */
	public String agree(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			return null;
		}
		
		String aidStr = request.getParameter("aid");
		try {
			int aid = Integer.parseInt(aidStr);
			articleService.agree(user, aid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 取消点赞
	 */
	public String disagree(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			return null;
		}
		
		String aidStr = request.getParameter("aid");
		try {
			int aid = Integer.parseInt(aidStr);
			articleService.disagree(user, aid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String findById(HttpServletRequest request, HttpServletResponse response){
		User user = (User) request.getSession().getAttribute("user");
		String aidStr = request.getParameter("aid");
		try {
			int aid = Integer.parseInt(aidStr);
			Article article = articleService.findById(aid, user);
			request.setAttribute("article", article);
			return "/jsp/article.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}
	
	public String add(HttpServletRequest request, HttpServletResponse response){
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return null;
		}
		
		Map<String, String[]> map = request.getParameterMap();
		Article article = new Article();
		try {
			String tidStr = map.get("tid")[0];
			int tid = Integer.parseInt(tidStr);
			Topic topic = new Topic();
			topic.setId(tid);
			
			BeanUtils.populate(article, map);
			article.setTopic(topic);
			article.setUser(user);
			article.setDate(new Date());
			
			articleService.save(article);
			return "/jsp/index.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
