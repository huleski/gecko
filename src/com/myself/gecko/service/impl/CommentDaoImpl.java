package com.myself.gecko.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.ICommentDao;
import com.myself.gecko.dao.impl.BaseDao;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.util.C3P0Utils;

public class CommentDaoImpl extends BaseDao<Comment> implements ICommentDao {

	@Override
	public List<CommentVO> ajaxLoad(int currentPage, int pageSize,int type, int targetId) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select comment.id, pid, uid, content, date, agreeCount, user.name, user.photo from comment, user where comment.uid = user.id and type = ? and targetId = ? limit ?, ?";
		Object[] params = {type, targetId, (currentPage -1) * pageSize, pageSize};
		List<CommentVO> list = queryRunner.query(sql, new BeanListHandler<>(CommentVO.class), params);
		for (CommentVO vo : list) {
			if(vo.getPid() != 0) {
				sql = "select user.id, user.name from comment c1, comment c2, user where c1.uid = user.id and c1.id = c2.pid and  c2.id = " + vo.getId();
				Map<String, Object> map = queryRunner.query(sql, new MapHandler());
				vo.setParentUid((Integer) map.get("id"));
				vo.setParentName((String) map.get("name"));
			}
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
}
