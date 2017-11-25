package com.myself.gecko.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.User;

public interface IUserService {
	public abstract void add(User user) throws SQLException;
	public abstract void delete(int id) throws SQLException;
	public abstract void update(User user) throws SQLException;
	public abstract User findPersonById(int id, User user) throws SQLException;
	public abstract User findUserByNameAndPwd(String name, String password) throws SQLException;
	public abstract void register(User user) throws SQLException;
	public abstract void cancleWatch(int uid, User user) throws SQLException;
	public abstract void addWatch(int uid, User user) throws SQLException;
	public abstract PersonInfo findPersonInfo(int id) throws SQLException;
	public abstract void visitHome(int id) throws SQLException;
    public abstract Set findUserDynamic(User user, int uid, int currentPage) throws Exception;
    public abstract String findQuestionByUid(int currentPage, int personId) throws Exception;
    public abstract List<Answer> findUserAnswer(User user, int uid, int currentPage) throws Exception;
    public abstract List<Article> findUserArticle(User user, int id, int currentPage) throws Exception;
    public abstract void deleteAnswerById(User user, int aid) throws Exception;
    public abstract void deleteArticleById(User user, int aid) throws Exception;
}
