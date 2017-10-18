package com.myself.gecko.web.servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.service.impl.TopicServiceImpl;
import com.myself.gecko.util.JsonUtil;

/**
 * 话题servlet
 */
public class TopicServlet extends BaseServlet {
	private static ITopicService topicService = TopicServiceImpl.getTopicService();
	
	
	public String ajaxLoadTopic(HttpServletRequest request, HttpServletResponse response) {
		String tidStr = request.getParameter("tid");
		int tid = Integer.parseInt(tidStr);
		
		try {
			Topic topic = topicService.findById(tid);
			String data = JsonUtil.object2json(topic);
			response.getWriter().print(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询话题动态
	 */
	public String findTopicDynamic(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		
		try {
			String tidStr = request.getParameter("tid");
			String orderStyle = request.getParameter("orderStyle");
			String pageNum = request.getParameter("currentPage");
			int tid = Integer.parseInt(tidStr);
			int currentPage = Integer.parseInt(pageNum);
			
			Set set = topicService.findTopicDynamic(tid, orderStyle, user, currentPage);
			if (set.size() == 0) {
				response.getWriter().print(0);
				return null;
			} else {
				request.setAttribute("set", set);
				return "/template/topicdynamic.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}
	
	/**
	 * 查询已关注话题
	 */
	public String findWatchedTopic(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return "/500.jsp";
		}
		try {
			List<Topic> list = topicService.findWatchedTopic(user.getId());
			request.setAttribute("list", list);
			return "/jsp/topicdynamic.jsp";
		} catch (SQLException e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}
	
	/**
	 * 添加关注
	 */
	public String addWatch(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			return null;
		}

		String tidStr = request.getParameter("tid");
		try {
			int tid = Integer.parseInt(tidStr);
			topicService.addWatch(tid, user);
			response.getWriter().print(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 取消关注
	 */
	public String cancleWatch(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			return null;
		}
		
		String tidStr = request.getParameter("tid");
		try {
			int tid = Integer.parseInt(tidStr);
			topicService.cancleWatch(tid, user);
			response.getWriter().print(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

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
		User user = (User) request.getSession().getAttribute("user");
		
		try {
			int id = Integer.parseInt(idStr);
			Topic topic = topicService.findTopicById(id, user);
			request.setAttribute("topic", topic);
			return "/jsp/topic.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}

	public String findOthers(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		try {
			String topics = topicService.findOthers(user);
			response.getWriter().print(topics);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
