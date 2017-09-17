package com.myself.gecko.web.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.domain.PageBean;
import com.myself.gecko.service.ICommentService;
import com.myself.gecko.service.impl.CommentServiceImpl;


public class CommentServlet extends BaseServlet {
	private static ICommentService commentService = new CommentServiceImpl();
	
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		String targetIdStr = request.getParameter("targetId");
		String currentPageStr = request.getParameter("currentPage");
		String typeStr = request.getParameter("type");
		
		try {
			int targetId = Integer.parseInt(targetIdStr);
			int currentPage = Integer.parseInt(currentPageStr);
			int type = Integer.parseInt(typeStr);
			//List<CommentVO> list = commentService.ajaxLoad(currentPage, aid);
			PageBean<CommentVO> pageBean = commentService.pageQuery(currentPage, type, targetId);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("targetId", targetId);
			return "/template/comment.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
}
