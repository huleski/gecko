package com.myself.gecko.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.dao.ICommentDao;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class CommentDaoImpl extends BaseDao<Comment> implements ICommentDao {

	@Override
	public List<CommentVO> ajaxLoad(int currentPage, int pageSize,int type, int targetId, User user) throws Exception {
		int uid = 0;
		if(user != null) {
			uid = user.getId();
		}
		
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select comment.id, pid, uid, content, type, date, user.name, user.photo from comment, user where comment.uid = user.id and type = ? and targetId = ? limit ?, ?";
		Object[] params = {type, targetId, (currentPage -1) * pageSize, pageSize};
		List<CommentVO> list = queryRunner.query(sql, new BeanListHandler<>(CommentVO.class), params);
		for (CommentVO vo : list) {
			if(vo.getPid() != null) {
				sql = "select user.id, user.name from comment c1, comment c2, user where c1.uid = user.id and c1.id = c2.pid and  c2.id = " + vo.getId();
				Map<String, Object> map = queryRunner.query(sql, new MapHandler());
				vo.setParentUid((Integer) map.get("id"));
				vo.setParentName((String) map.get("name"));
			}
			//查询评论赞同数
			sql = "select count(*) from comment_agree where cid = ?";
			Long agreeCount = (Long) queryRunner.query(sql, new ScalarHandler(), vo.getId());
			vo.setAgreeCount(agreeCount.intValue());
			
			//查询是否已点过赞同
			sql = "select count(*) from comment_agree where cid = ? and uid = ?";
			Long agree = (Long) queryRunner.query(sql, new ScalarHandler(), vo.getId(), uid);
			vo.setAgree(agree.intValue());
		}
		return list;
	}

	@Override
	public int selectCommentCount(int type, int targetId) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from comment where type = ? and targetId = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), type, targetId);
		return count.intValue();
	}

	@Override
	public void save(Comment comment) throws Exception {
		String sql = "insert into comment values(?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, comment.getParent().getId(), comment.getUser().getId(), comment.getType(), 
				comment.getTargetId(), comment.getContent(), comment.getDate()};
		CU(sql, params);
	}

	@Override
	public void agree(User user, int cid) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from comment_agree where cid = ? and uid = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), cid, uid);
		if(count.intValue() == 0) {
			sql = "insert into comment_agree values(null, ?, ?, ?)";
			queryRunner.update(sql, cid, uid, new Date());
		}
	}

	@Override
	public void disagree(User user, int cid) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from comment_agree where cid = ? and uid = ?";
		queryRunner.update(sql, cid, uid);
	}
}
