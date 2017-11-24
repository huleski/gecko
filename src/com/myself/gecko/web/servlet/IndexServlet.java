package com.myself.gecko.web.servlet;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IIndexService;
import com.myself.gecko.service.impl.IndexServiceImpl;

public class IndexServlet extends BaseServlet {
    private IIndexService indexService = new IndexServiceImpl();
    
    /**
     * 搜索问题
     */
    public String search(HttpServletRequest request, HttpServletResponse response) {
        String keywords = request.getParameter("keywords");
        String curPageStr = request.getParameter("currentPage");
        User user = (User) request.getSession().getAttribute("user");
        
        try {
            int currentPage = Integer.parseInt(curPageStr);
            List list = indexService.search(keywords, currentPage, user);
            if (list.size() == 0) {
                response.getWriter().write("0");
                return null;
            } else {
                request.setAttribute("set", list);
                return "/template/topicdynamic.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/500.jsp";
    }
    
    /**  
     * 返回searchresult页面
     */
    public String searchUI(HttpServletRequest request, HttpServletResponse response) {
        String keywords = request.getParameter("keywords");
        if(StringUtils.isEmpty(keywords)) {
            return "/500.jsp";
        }
        request.setAttribute("keywords", keywords);
        return "/jsp/searchresult.jsp";
    }
    
    
    /**  
     * find页面
     */
    public String find(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            List<Question> list = indexService.findNewestQuestion(1, 5);
            request.setAttribute("list", list);
            return "/jsp/find.jsp";
        } catch (Exception e) {
            e.printStackTrace();  
        }
        return "/500.jsp";
    }

    public String ajaxLoad(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        String curPage = request.getParameter("currentPage");
        try {
            int currentPage = Integer.parseInt(curPage);
            Set set = indexService.getSet(user, currentPage);

            if (set.isEmpty()) {
                response.getWriter().write("0");
            } else {
                request.setAttribute("set", set);
                return "/template/index.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
