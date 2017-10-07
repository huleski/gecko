package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.util.C3P0Utils;

public class TopicDaoImpl extends BaseDao<Topic> implements ITopicDao {
	private static TopicDaoImpl topicDao;

	private TopicDaoImpl() {}

	public static TopicDaoImpl getTopicDao() {
		if (topicDao == null) {
			topicDao = new TopicDaoImpl();
		}
		return topicDao;
	}

	@Override
	public Topic findTopicById(int id) throws SQLException {
		Topic topic = findById(id);
		String sql = "select count(*) from topic_watcher where tid = ?";
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), id);
		topic.setWatchCount(count.intValue());
		return topic;
	}

	@Override
	public List<Topic> findOthers() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from topic order by rand() limit 0, 6";
		return queryRunner.query(sql, new BeanListHandler<>(Topic.class));
	}


}
