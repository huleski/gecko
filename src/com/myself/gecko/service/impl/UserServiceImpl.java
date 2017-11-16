package com.myself.gecko.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.QuestionDaoImpl;
import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IUserService;
import com.myself.gecko.util.JsonUtil;

public class UserServiceImpl implements IUserService {
	private static UserServiceImpl userService;
	private IUserDao userDao = UserDaoImpl.getUserDao();
	private IQuestionDao questionDao = new QuestionDaoImpl();
	private IAnswerDao answerDao = new AnswerDaoImpl();
	
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
     * 查询用户的动态: 关注了 问题/话题, 赞同过回答/文章
     */
    @Override
    public Set findUserDynamic(int id) throws SQLException {
        
        return null;
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

}
