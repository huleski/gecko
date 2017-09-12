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
	private static ITopicService  topicService = TopicServiceImpl.getTopicService();

	public String findAll(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Topic> list = topicService.findAll();
			String jsonArray = JsonUtil.list2json(list);
			response.getWriter().print(jsonArray);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/jsp/error.jsp";
		}
	}
}
