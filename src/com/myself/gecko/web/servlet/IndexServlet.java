package com.myself.gecko.web.servlet;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IIndexService;
import com.myself.gecko.service.impl.IndexServiceImpl;

import net.sf.json.JSONArray;

public class IndexServlet extends BaseServlet {
    private IIndexService indexService = new IndexServiceImpl();
    
    /**
     * 搜索问题
     */
    public String search(HttpServletRequest request, HttpServletResponse response) {
        String keywords = request.getParameter("keywords");
        String curPageStr = request.getParameter("currentPage");
        User user = (User) request.getSession().getAttribute("user");
        int currentPage;
        
        try {
            if(curPageStr != null) {
                currentPage = Integer.parseInt(curPageStr);
            }else {
                currentPage = 1;
            }
            List list = indexService.search(keywords, currentPage, user);
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
