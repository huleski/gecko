package com.myself.gecko.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IUserService;
import com.myself.gecko.service.impl.UserServiceImpl;

/**
 * user模块 ,请求时需携带参数method
 */
public class UserServlet extends BaseServlet {
    private static final long serialVersionUID = 1L;
    private static IUserService userService = UserServiceImpl.getUserService();

    /**
     * 根据id删除article
     */
    public String deleteArticleById(HttpServletRequest request, HttpServletResponse response) {
        String aidStr = (String) request.getParameter("id");
        User user = (User) request.getSession().getAttribute("user");

        try {
            int aid = Integer.parseInt(aidStr);
            userService.deleteArticleById(user, aid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据id删除answer
     */
    public String deleteAnswerById(HttpServletRequest request, HttpServletResponse response) {
        String aidStr = (String) request.getParameter("id");
        User user = (User) request.getSession().getAttribute("user");

        try {
            int aid = Integer.parseInt(aidStr);
            userService.deleteAnswerById(user, aid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据用户id查询该用户写下的文章
     */
    public String findArticleByUid(HttpServletRequest request, HttpServletResponse response) {
        String idStr = (String) request.getParameter("id");
        String curPage = (String) request.getParameter("currentPage");
        User user = (User) request.getSession().getAttribute("user");
        String personId = (String) request.getParameter("personId");

        try {
            int id = Integer.parseInt(idStr);
            int currentPage = Integer.parseInt(curPage);
            List<Article> list = userService.findUserArticle(user, id, currentPage);
            if (!list.isEmpty()) {
                request.setAttribute("set", list);
                request.setAttribute("personId", personId);
                return "/template/homearticle.jsp";
            } else {
                response.getWriter().write("0");
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/500.jsp";
    }

    /**
     * 根据用户id查询该用户的回答
     */
    public String findAnswerByUid(HttpServletRequest request, HttpServletResponse response) {
        String idStr = (String) request.getParameter("id");
        String curPage = (String) request.getParameter("currentPage");
        String personId = (String) request.getParameter("personId");
        User user = (User) request.getSession().getAttribute("user");

        try {
            int id = Integer.parseInt(idStr);
            int currentPage = Integer.parseInt(curPage);
            List<Answer> list = userService.findUserAnswer(user, id, currentPage);
            if (!list.isEmpty()) {
                request.setAttribute("set", list);
                request.setAttribute("personId", personId);
                return "/template/homeanswer.jsp";
            } else {
                response.getWriter().write("0");
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/500.jsp";
    }

    /**
     * 根据用户id查询该用户提出的问题
     */
    public String findQuestionByUid(HttpServletRequest request, HttpServletResponse response) {
        String currentPageStr = request.getParameter("currentPage");
        String uidStr = request.getParameter("id");

        try {
            int currentPage = Integer.parseInt(currentPageStr);
            int uid = Integer.parseInt(uidStr);
            String result = userService.findQuestionByUid(currentPage, uid);
            response.getWriter().print(result);
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/500.jsp";
    }

    /**
     * 根据id查询该用户动态
     */
    public String findUserDynamicByUid(HttpServletRequest request, HttpServletResponse response) {
        String idStr = (String) request.getParameter("id");
        String curPage = (String) request.getParameter("currentPage");
        User user = (User) request.getSession().getAttribute("user");

        try {
            int id = Integer.parseInt(idStr);
            int currentPage = Integer.parseInt(curPage);
            Set set = userService.findUserDynamic(user, id, currentPage);
            if (!set.isEmpty()) {
                request.setAttribute("set", set);
                return "/template/homedynamic.jsp";
            } else {
                response.getWriter().write("0");
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/500.jsp";
    }

    /**
     * 注销登录
     */
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("user");
        Cookie cookie1 = new Cookie("name", "");
        Cookie cookie2 = new Cookie("password", "");

        try {
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.sendRedirect(request.getContextPath());
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return "/500.jsp";
        }
    }

    /**
     * 编辑用户资料
     */
    public String editUser(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "请先登录");
            return "/500.jsp";
        }

        try {
            Map<String, String[]> map = request.getParameterMap();
            BeanUtils.populate(user, map);
            // 保存用户修改资料
            userService.update(user);
            request.getSession().setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/jsp/edituser.jsp");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return "/500.jsp";
        }
    }

    /**
     * 返回用户编辑界面
     */
    public String editUserUI(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "请先登录");
            return "/500.jsp";
        }
        return "/jsp/edituser.jsp";
    }

    /**
     * 根据id查询用户
     */
    public String findById(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        try {
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

            // 更新用户主页浏览次数
            Boolean visited = (Boolean) request.getSession().getAttribute(idStr);

            if (visited == null && (user == null || user.getId() != id)) { // 游客或者不是本人浏览主页则递增浏览次数
                request.getSession().setAttribute(idStr, true);
                userService.visitHome(id);
            }

            // 查询用户个人信息
            User person = userService.findPersonById(id, user);
            if (person != null) {
                PersonInfo personInfo = userService.findPersonInfo(id);
                request.setAttribute("person", person);
                request.setAttribute("personInfo", personInfo);
                return "/jsp/home.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/500.jsp";
    }

    /**
     * 登录
     */
    public String login(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        try {
            User user = userService.findUserByNameAndPwd(name, password);
            if (user != null) { // 记住用户名,自动登录
                // 解决中文乱码,先编码再存入
                name = URLEncoder.encode(name, "UTF-8");
                password = URLEncoder.encode(password, "UTF-8");

                String remember = request.getParameter("remember");
                Cookie cookie1 = new Cookie("name", name);
                Cookie cookie2 = new Cookie("password", password);
                cookie1.setPath(request.getContextPath());
                cookie2.setPath(request.getContextPath());
                if ("yes".equals(remember)) {
                    cookie1.setMaxAge(60 * 60 * 24 * 7);
                    cookie2.setMaxAge(60 * 60 * 24 * 7);
                } else {
                    cookie1.setMaxAge(0);
                    cookie2.setMaxAge(0);
                }
                response.addCookie(cookie1);
                response.addCookie(cookie2);

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                return "/jsp/index.jsp";
            } else {
                request.setAttribute("msg", "密码或用户名错误,请重试");
                return "/jsp/login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "/500.jsp";
        }
    }

    /**
     * 查询用户名是否存在
     */
    public String findUserByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");

        try {
            User user = userService.findUserByName(name);
            if (user != null) { //用户已经存在
                response.getWriter().write("1");
            } else {        //用户不存在
                response.getWriter().write("0");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 注册
     */
    public String register(HttpServletRequest request, HttpServletResponse response) {
        String validateCode = (String) request.getSession().getAttribute("validateCode");

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String code = request.getParameter("code");

        // 校验验证码
        if (StringUtils.isNotEmpty(code) && code.equals(validateCode)) {
            User user = new User();
            user.setName(name);
            user.setPassword(password);
            user.setPhone(phone);
            user.setPhoto("img/default.jpg");
            user.setBackphoto("img/backphoto.png");
            user.setVisitedCount(0);

            try {
                userService.register(user);
                response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
                return null;
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("fail", "注册失败");
                request.setAttribute("register", 1);
                return "/jsp/login.jsp";
            }
        } else {
            request.setAttribute("codeError", "验证码错误");
            request.setAttribute("register", "1");
            return "/jsp/login.jsp";
        }

    }

    /**
     * 添加关注
     */
    public String addWatch(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return null;
        }

        String uidStr = request.getParameter("uid");
        try {
            int uid = Integer.parseInt(uidStr);
            userService.addWatch(uid, user);
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
        if (user == null) {
            return null;
        }

        String uidStr = request.getParameter("uid");
        try {
            int uid = Integer.parseInt(uidStr);
            userService.cancleWatch(uid, user);
            response.getWriter().print(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
