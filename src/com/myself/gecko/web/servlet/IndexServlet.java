package com.myself.gecko.web.servlet;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IAnswerService;
import com.myself.gecko.service.IIndexService;
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.service.impl.AnswerServiceImpl;
import com.myself.gecko.service.impl.TopicServiceImpl;

public class IndexServlet extends BaseServlet {
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		IIndexService indexService = new IndexServiceImpl();

		User user = (User) request.getSession().getAttribute("user");
		if (user != null) { // 已经登录
			try {
				Set set = indexService.getSet(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 没有登录

		return "/template/index.jsp";
	}
}
