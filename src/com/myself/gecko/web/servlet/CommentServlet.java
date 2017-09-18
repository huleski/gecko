package com.myself.gecko.web.servlet;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.domain.PageBean;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.ICommentService;
import com.myself.gecko.service.impl.CommentServiceImpl;


public class CommentServlet extends BaseServlet {
	private static ICommentService commentService = new CommentServiceImpl();
	
	public String add(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			return "/error.jsp";
		}
		
		String typeStr = request.getParameter("type");
		String targetIdStr = request.getParameter("targetId");
		String content = request.getParameter("content");
		String pidStr = request.getParameter("pid");
		 try {
			 int targetId = Integer.parseInt(targetIdStr);
			 int type = Integer.parseInt(typeStr);
			 Comment comment = new Comment();
			 comment.setTargetId(targetId);
			 comment.setType(type);
			 comment.setDate(new Date());
			 comment.setContent(content);
			 comment.setUser(user);
			 
			 Comment parent = new Comment();
			 if(pidStr != null && !("".equals(pidStr))) {
				 int pid = Integer.parseInt(pidStr);
				 parent.setId(pid);
			 }
			 comment.setParent(parent);
			 
			 commentService.save(comment);
			 return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/error.jsp";
		}
	}
	
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
