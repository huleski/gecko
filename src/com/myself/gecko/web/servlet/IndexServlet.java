package com.myself.gecko.web.servlet;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.User;
import com.myself.gecko.service.IIndexService;
import com.myself.gecko.service.impl.IndexServiceImpl;

public class IndexServlet extends BaseServlet {
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		IIndexService indexService = new IndexServiceImpl();

		User user = (User) request.getSession().getAttribute("user");
		try {
			Set set = indexService.getSet(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/template/index.jsp";
	}
}
