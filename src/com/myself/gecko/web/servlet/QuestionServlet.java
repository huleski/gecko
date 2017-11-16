package com.myself.gecko.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IAnswerService;
import com.myself.gecko.service.IQuestionService;
import com.myself.gecko.service.impl.QuestionServiceImpl;

import net.sf.json.JSONArray;

@SuppressWarnings("all")
public class QuestionServlet extends BaseServlet {
    private static IQuestionService questionService = new QuestionServiceImpl();

    /**
     * 输入框联想搜索
     */
    public String findAssociated(HttpServletRequest request, HttpServletResponse response) {
        String keywords = request.getParameter("keywords");
        try {
            List<Question> list = questionService.findAssociated(keywords);
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
     * 查找相关问题(同一话题的问题)
     */
    public String findRelativeQuestion(HttpServletRequest request, HttpServletResponse response) {
        String tidStr = request.getParameter("tid");
        try {
            int tid = Integer.parseInt(tidStr);
            String result = questionService.findRelativeQuestion(tid);
            response.getWriter().print(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 关注问题
     */
    public String addWatch(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return null;
        }

        String qidStr = request.getParameter("qid");
        try {
            int qid = Integer.parseInt(qidStr);
            questionService.addWatch(qid, user);
            response.getWriter().print(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 取消问题关注
     */
    public String cancleWatch(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return null;
        }

        String qidStr = request.getParameter("qid");
        try {
            int qid = Integer.parseInt(qidStr);
            questionService.cancleWatch(qid, user);
            response.getWriter().print(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据id查找问题
     */
    public String findById(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");

        String idStr = request.getParameter("id");
        try {
            int id = Integer.parseInt(idStr);

            // 更新问题浏览次数
            Boolean visited = (Boolean) request.getSession().getAttribute(idStr);

            if (visited == null) { // 每浏览一次问题则递增浏览次数
                request.getSession().setAttribute(idStr, true);
                questionService.visitQuestion(id);
            }

            Question question = questionService.findQuestioinById(id, user);
            request.setAttribute("question", question);
            return "/jsp/question.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            return "/500.jsp";
        }
    }

    /**
     * 保存问题
     */
    public String addQuestion(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");

        try {
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
                return null;
            }
            // 封装question对象
            Map<String, String[]> map = request.getParameterMap();
            Question question = new Question();
            BeanUtils.populate(question, map);
            question.setUser(user);
            Topic topic = new Topic();
            int id = Integer.parseInt(request.getParameter("tid"));
            topic.setId(id);
            question.setTopic(topic);
            question.setDate(new Date());

            questionService.save(question);
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return "/500.jsp";
        }
    }
}
