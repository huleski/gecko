package com.myself.gecko.web.servlet;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.Topic;
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.service.impl.TopicServiceImpl;
import com.myself.gecko.util.JsonUtil;

/**
 * 话题servlet
 */
public class TopicServlet extends BaseServlet {
	private static ITopicService topicService = TopicServiceImpl.getTopicService();

	/**
	 * 查询所有话题, 可用 Redis优化
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Topic> list = topicService.findAll();
			String jsonArray = JsonUtil.list2json(list);
			response.getWriter().print(jsonArray);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}

	public String findById(HttpServletRequest request, HttpServletResponse response) {
		String idStr = request.getParameter("id");
		
		try {
			int id = Integer.parseInt(idStr);
			Topic topic = topicService.findTopicById(id);
			request.setAttribute("topic", topic);
			return "/jsp/topic.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}

	public String findOthers(HttpServletRequest request, HttpServletResponse response) {
		try {
			String topics = topicService.findOthers();
			response.getWriter().print(topics);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
