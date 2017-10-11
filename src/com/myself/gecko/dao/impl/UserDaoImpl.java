package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class UserDaoImpl extends BaseDao<User> implements IUserDao {
	private static UserDaoImpl userDao;

	private UserDaoImpl() {
	}

	public static UserDaoImpl getUserDao() {
		if (userDao == null) {
			userDao = new UserDaoImpl();
		}
		return userDao;
	}

	@Override
	public void updateUserWatch(int userId, int watchedId) {

	}

	@Override
	public void updateTopicWatch(int userId, int topicId) {

	}

	@Override
	public void updateQuestionWatch(int userId, int QuestionId) {

	}

	@Override
	public User findUserByNameAndPwd(String name, String password) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where name = ? and password = ?";
		return queryRunner.query(sql, new BeanHandler<>(User.class), name, password);
	}

	@Override
	public void save(User user) throws SQLException {
		String sql = "insert into user(id, name, password, phone, photo, backphoto, visitedCount) values(?, ?, ?, ?, ?, ?, ?)";
		Object[] params = { null, user.getName(), user.getPassword(), user.getPhone(), user.getPhoto(), user.getBackphoto(), user.getVisitedCount()};
		CU(sql, params);
	}

	@Override
	public void update(User user) throws SQLException {
		String sql = "update user set sex=?, sentence=?, address=?, industry=?, profession=?, education=?, description=?, photo=?, backphoto=? where id = ?";
		Object[] params = { user.getSex(), user.getSentence(), user.getAddress(), user.getIndustry(),
				user.getProfession(), user.getEducation(), user.getDescription(), user.getPhoto(), user.getBackphoto(),
				user.getId() };
		CU(sql, params);
	}

	@Override
	public void recordLogin(User user) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into user_login values(?, ?, ?)";
		Object[] params = { null, user.getId(), new Date() };
		queryRunner.update(sql, params);
	}

	@Override
	public void cancleWatch(int uid, User user) throws SQLException {
		int watcherId = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from user_watch where hostId = ? and watcherId = ?";
		queryRunner.update(sql, uid, watcherId);
	}

	@Override
	public void addWatch(int uid, User user) throws SQLException {
		int watcherId = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from user_watch where hostId = ? and watcherId = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), uid, watcherId);
		if (count.intValue() == 0) {
			sql = "insert into user_watch values(null, ?, ?, ?)";
			queryRunner.update(sql, uid, watcherId, new Date());
		}
	}

	@Override
	public User findPersonById(int id, User user) throws SQLException {
		User person = findById(id);
		if (user != null && person != null) {
			int watcherId = user.getId();
			String sql = "select count(*) from user_watch where hostId = ? and watcherId = ?";
			QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
			Long count = (Long) queryRunner.query(sql, new ScalarHandler(), id, watcherId);
			person.setWatched(count.intValue());
		}
		return person;
	}

	@Override
	public PersonInfo findPersonInfo(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());

		// 查询获得赞同数
		Long answerCount = 0L;
		Long articleCount = 0L;
		String sql = "select id from answer where uid = ?";
		List<Object[]> answerNums = queryRunner.query(sql, new ArrayListHandler(), id);
		if (answerNums.size() > 0) {
			StringBuilder sb = new StringBuilder("(");
			for (Object[] objects : answerNums) {
				sb.append(objects[0]);
				sb.append(",");
			}
			String substring = sb.substring(0, sb.length() - 1);
			substring += ")";

			sql = "select count(*) from answer_agree where aid in " + substring;
			answerCount = (Long) queryRunner.query(sql, new ScalarHandler());
		}
		sql = "select id from article where uid = ?";
		List<Object[]> articleNums = queryRunner.query(sql, new ArrayListHandler(), id);
		if (articleNums.size() > 0) {
			StringBuilder sb = new StringBuilder("(");
			for (Object[] objects : articleNums) {
				sb.append(objects[0]);
				sb.append(",");
			}
			String substring = sb.substring(0, sb.length() - 1);
			substring += ")";
			
			sql = "select count(*) from article_agree where aid in " + substring;
			articleCount = (Long) queryRunner.query(sql, new ScalarHandler());
		}
		Long approvaledCount = answerCount + articleCount;

		//查询关注数
		sql = "select count(*) from user_watch where watcherId = ?";
		Long followedCount = (Long) queryRunner.query(sql, new ScalarHandler(), id);
		
		//查询被关注数
		sql = "select count(*) from user_watch where hostId = ?";
		Long watchedCount = (Long) queryRunner.query(sql, new ScalarHandler(), id);

		//查询话题关注数
		sql = "select count(*) from topic_watch where uid = ?";
		Long watchTopicCount = (Long) queryRunner.query(sql, new ScalarHandler(), id);

		//查询问题关注数
		sql = "select count(*) from question_watch where uid = ?";
		Long watchQuestionCount = (Long) queryRunner.query(sql, new ScalarHandler(), id);

		PersonInfo personInfo = new PersonInfo();
		personInfo.setApprovaledCount(approvaledCount.intValue());
		personInfo.setFollowedCount(followedCount.intValue());
		personInfo.setWatchedCount(watchedCount.intValue());
		personInfo.setWatchQuestionCount(watchQuestionCount.intValue());
		personInfo.setWatchTopicCount(watchTopicCount.intValue());
		return personInfo;
	}

	@Override
	public void visitHome(int id) throws SQLException {
		String sql = "update user set visitedCount = visitedCount + 1 where id = ?";
		Object[] params = {id};
		CU(sql, params);
	}

}
