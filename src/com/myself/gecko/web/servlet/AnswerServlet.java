package com.myself.gecko.web.servlet;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IAnswerService;
import com.myself.gecko.service.impl.AnswerServiceImpl;

import net.sf.json.JSONArray;

public class AnswerServlet extends BaseServlet {
	private static IAnswerService answerService = new AnswerServiceImpl();

	/**
     * 搜索问题
     */
    public String search(HttpServletRequest request, HttpServletResponse response) {
        String keywords = request.getParameter("keywords");
        String curPageStr = request.getParameter("currentPage");
        int currentPage;
        
        try {
            if(curPageStr != null) {
                currentPage = Integer.parseInt(curPageStr);
            }else {
                currentPage = 1;
            }
            List<Answer> list = answerService.search(keywords, currentPage);
            if (list.isEmpty()) {
                response.getWriter().write("0");
            } else {
                String data = JSONArray.fromObject(list).toString();
                response.getWriter().write(data);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
	
	/**  
	 * 查询本日最热回答  
	 * @return  
	 */
	public String ajaxLoadHotday(HttpServletRequest request, HttpServletResponse response) {
	    User user = (User) request.getSession().getAttribute("user");
	    String currentPageStr = request.getParameter("currentPageDay");
	    
	    try {
            int currentPage = Integer.parseInt(currentPageStr);
            List<Answer> list = answerService.findHotday(currentPage, user);
            if(list.isEmpty()) {
                response.getWriter().write("0");
                return null;
            }
            request.setAttribute("set", list);
            return "/template/topicdynamic.jsp";
        } catch (Exception e) {
            e.printStackTrace();  
        }
	    return "/500.jsp";
	}
	
	/**  
	 * 查询本月最热回答 
	 * @return  
	 */
	public String ajaxLoadHotmonth(HttpServletRequest request, HttpServletResponse response) {
	    User user = (User) request.getSession().getAttribute("user");
        String currentPageStr = request.getParameter("currentPageMonth");
        
        try {
            int currentPage = Integer.parseInt(currentPageStr);
            List<Answer> list = answerService.findHotmonth(currentPage, user);
            if(list.isEmpty()) {
                response.getWriter().write("0");
                return null;
            }
            request.setAttribute("set", list);
            return "/template/topicdynamic.jsp";
        } catch (Exception e) {
            e.printStackTrace();  
        }
        return "/500.jsp";
	}
	
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
			answerService.agree(user, aid);
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
			answerService.disagree(user, aid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 增加回答
	 */
	public String add(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return "/500.jsp";
		}

		String content = request.getParameter("content");
		String pureContent = request.getParameter("pureContent");
		String qidStr = request.getParameter("qid");
		String anonymousStr = request.getParameter("anonymous");

		try {
			Answer answer = new Answer();

			int qid = Integer.parseInt(qidStr);
			Question question = new Question();
			question.setId(qid);
			answer.setQuestion(question);

			answer.setUser(user);
			answer.setContent(content);
			answer.setDate(new Date());
			answer.setPureContent(pureContent);
			if (anonymousStr != null) {
				int anonymous = Integer.parseInt(anonymousStr);
				answer.setAnonymous(anonymous);
			}
			answerService.save(answer);
			response.sendRedirect(request.getContextPath() + "/questionServlet?method=findById&id=" + qid);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}

	/*
	 * ddlklklkjkljkj
	 */
	public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
		String pageStr = request.getParameter("currentPage");
		String qidStr = request.getParameter("qid");
		User user = (User) request.getSession().getAttribute("user");
		
		try {
			int currentPage = Integer.parseInt(pageStr);
			int qid = Integer.parseInt(qidStr);

			List<Answer> list = answerService.ajaxLoad(currentPage, qid, user);
			if (list.isEmpty()) {
				response.getWriter().print(0);
				return null;
			} else {
				request.setAttribute("list", list);
				return "/template/answer.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/500.jsp";
		}
	}
}
