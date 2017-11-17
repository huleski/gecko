package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;
import com.sun.mail.imap.protocol.UID;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class TopicDaoImpl extends BaseDaoImpl<Topic> implements ITopicDao {
	private static TopicDaoImpl topicDao;

	private TopicDaoImpl() {
	}

	public static TopicDaoImpl getTopicDao() {
		if (topicDao == null) {
			topicDao = new TopicDaoImpl();
		}
		return topicDao;
	}

	@Override
	public Topic findTopicById(int id, User user) throws SQLException {
		Topic topic = findById(id);

		// 查询关注数
		String sql = "select count(*) from topic_watch where tid = ?";
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), id);
		topic.setWatchCount(count.intValue());

		// 查询是否已关注
		if (user != null) {
			int uid = user.getId();
			sql = "select count(*) from topic_watch where uid = ? and tid = ?";
			count = (Long) queryRunner.query(sql, new ScalarHandler(), uid, id);
			topic.setWatched(count.intValue());
		}
		return topic;
	}

	/**  
	 * 查找其他话题
	 */
	@Override
	public List<Topic> findOthers(User user) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		if (user != null) {
			int uid = user.getId();
			String sql = "select tid from topic_watch where uid = ?";
			List<Object[]> watchedTopicsId = queryRunner.query(sql, new ArrayListHandler(), uid);
			if (watchedTopicsId.size() > 0) {
				StringBuilder sb = new StringBuilder("(");
				for (Object[] objects : watchedTopicsId) {
					sb.append(objects[0]);
					sb.append(",");
				}
				String substring = sb.substring(0, sb.length() - 1);
				substring += ")";

				String whereClause = "where id not in " + substring + " order by rand()";
				return this.selectLimitByWhere(1, 6, whereClause);
			}
		}
		String sql = "select * from topic order by rand() limit 0, 6";
		return queryRunner.query(sql, new BeanListHandler<>(Topic.class));
	}

	/**  
	 * 取消关注
	 */
	@Override
	public void cancleWatch(int tid, User user) throws SQLException {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from topic_watch where tid = ? and uid = ?";
		queryRunner.update(sql, tid, uid);
	}

	/**  
	 * 添加关注
	 */
	@Override
	public void addWatch(int tid, User user) throws SQLException {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from topic_watch where tid = ? and uid = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), tid, uid);
		if (count.intValue() == 0) {
			sql = "insert into topic_watch values(null, ?, ?, ?)";
			queryRunner.update(sql, uid, tid, new Date());
		}
	}

	@Override
	public List<Topic> findWatchedTopic(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select tid from topic_watch where uid = ?";
		List<Object[]> watchedTopicsId = queryRunner.query(sql, new ArrayListHandler(), id);
		if (watchedTopicsId.size() > 0) {
			StringBuilder sb = new StringBuilder("(");
			for (Object[] objects : watchedTopicsId) {
				sb.append(objects[0]);
				sb.append(",");
			}
			String substring = sb.substring(0, sb.length() - 1);
			substring += ")";

			sql = "select * from topic where id in " + substring;
			return queryRunner.query(sql, new BeanListHandler<>(Topic.class));
		}
		return null;
	}

    @Override
    public List<Topic> findNewWatchedTopicWithFriends(User user, int currentPage, int pageSize) throws SQLException {
        List<Topic> topics = new ArrayList<>();
        String sql = "select t.id, uw.hostId from topic t,topic_watch tw, user_watch uw where t.id = tw.tid and tw.uid = uw.hostId and uw.watcherId = ? limit ?,?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        List<Map<String, Object>> list = queryRunner.query(sql, new MapListHandler(), user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Map<String, Object> map : list) {
            Topic topic = findTopicById((int) map.get("id"), user);
            sql = "select id, name from user where id = ?";
            User watcher = queryRunner.query(sql, new BeanHandler<>(User.class), (int)map.get("hostId"));
            topic.setWatcher(watcher);
            topics.add(topic);
        }
        return topics;
    }
}