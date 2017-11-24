package com.myself.gecko.service.impl;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.ArticleDaoImpl;
import com.myself.gecko.dao.impl.QuestionDaoImpl;
import com.myself.gecko.dao.impl.TopicDaoImpl;
import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IUserService;
import com.myself.gecko.util.JsonUtil;

@SuppressWarnings("all")
public class UserServiceImpl implements IUserService {
	private static UserServiceImpl userService;
	private IUserDao userDao = UserDaoImpl.getUserDao();
	private IQuestionDao questionDao = new QuestionDaoImpl();
	private IAnswerDao answerDao = new AnswerDaoImpl();
	private ITopicDao topicDao = TopicDaoImpl.getTopicDao();
	private IArticleDao articleDao = new ArticleDaoImpl();
	
	private UserServiceImpl() {}
	
	public static UserServiceImpl getUserService() {
		if (userService == null) {
			userService = new UserServiceImpl();
		}
		return userService;
	}
	
	@Override
	public void add(User user) {

	}

	@Override
	public void delete(int id) {

	}

	@Override
	public void update(User user) throws SQLException {
		userDao.update(user);
	}

	@Override
	public User findPersonById(int id, User user) throws SQLException {
		return userDao.findPersonById(id, user);
	}
	@Override
	public User findUserByNameAndPwd(String name, String password) throws SQLException {
		User user = userDao.findUserByNameAndPwd(name, password);
		if(user != null) {
			userDao.recordLogin(user);
		}
		return user;
	}

	@Override
	public void register(User user) throws SQLException {
		userDao.save(user);
	}

	@Override
	public void cancleWatch(int uid, User user) throws SQLException {
		userDao.cancleWatch(uid, user);
	}

	@Override
	public void addWatch(int uid, User user) throws SQLException {
		userDao.addWatch(uid, user);
	}

	@Override
	public PersonInfo findPersonInfo(int id) throws SQLException {
		return userDao.findPersonInfo(id);
	}

	@Override
	public void visitHome(int id) throws SQLException {
		userDao.visitHome(id);
	}

    /**  
     * 查询用户的动态: 关注了 问题, 赞同了回答/文章
     * @throws Exception 
     */
    @Override
    public Set findUserDynamic(User user, int uid, int currentPage) throws Exception {
        // 创建根据时间排序的TreeSet集合
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
        
        // 关注了 问题 
        List<Question> questions = questionDao.findWatchedQuestion(uid, currentPage, Constant.HOME_DYNAMIC_WATCH_COUNT);
        
        // 赞同过回答/文章
        List<Answer> answers = answerDao.findAgreedAnswer(user, uid, currentPage, Constant.HOME_DYNAMIC_WATCH_COUNT);
        List<Article> articles = articleDao.findAgreedArticle(user, uid, currentPage, Constant.HOME_DYNAMIC_WATCH_COUNT);
        
        set.addAll(answers);
        set.addAll(questions);
        set.addAll(articles);
        return set;
    }

    @Override
    public String findQuestionByUid(int currentPage, int uid) throws Exception {
        List<Question> list = questionDao.ajaxQueryByUid(currentPage, Constant.QUESTION_AJAX_LOAD_COUNT, uid);
        for (Question question : list) {
            List<Answer> answerList = answerDao.findAllByQid(question.getId());
            question.getAnswerList().addAll(answerList);
        }
        if(!list.isEmpty()) {
            return JsonUtil.list2json(list);
        }
        return "0"; 
    }

    @Override
    public List<Answer> findUserAnswer(User user, int uid, int currentPage) throws Exception {
        return answerDao.findByUid(user, uid, currentPage, Constant.HOME_ANSWER_COUNT);
    }

    @Override
    public List<Article> findUserArticle(User user, int uid, int currentPage) throws Exception {
        return articleDao.findByUid(user, uid, currentPage, Constant.HOME_ARTICLE_COUNT);
    }

}
