package com.myself.gecko.web.servlet;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
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
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.service.impl.AnswerServiceImpl;
import com.myself.gecko.service.impl.TopicServiceImpl;

public class IndexServlet extends BaseServlet {
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		IAnswerService answerService = new AnswerServiceImpl();
//		IArticleService articleService = new ArticleServiceImpl();
		ITopicService topicService = TopicServiceImpl.getTopicService();
		
		@SuppressWarnings("all")	//创建根据时间排序的TreeSet集合
		TreeSet set = new TreeSet<>(new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				try {
					Method method1 = o1.getClass().getMethod("getDate");
					Method method2 = o2.getClass().getMethod("getDate");
					Date d1 = (Date) method1.invoke(o1);
					Date d2 = (Date) method2.invoke(o2);
					return d1.compareTo(d2);
				} catch (Exception e) {
					e.printStackTrace();
					return 0;
				}
			}
		});
		
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) { // 已经登录
			
		} 
		
		// 没有登录

		return "/template/index.jsp";
	}
}
