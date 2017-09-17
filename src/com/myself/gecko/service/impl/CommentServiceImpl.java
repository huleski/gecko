package com.myself.gecko.service.impl;

import java.util.List;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.ICommentDao;
import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.domain.PageBean;
import com.myself.gecko.service.ICommentService;

public class CommentServiceImpl implements ICommentService {
	private static ICommentDao commentDao = new CommentDaoImpl();
	
	@Override
	public List<CommentVO> ajaxLoad(int currentPage, int type, int targetId) throws Exception {
		return commentDao.ajaxLoad(currentPage, Constant.COMMENT_AJAX_LOAD_COUNT, type,  targetId);
	}

	@Override
	public PageBean<CommentVO> pageQuery(int currentPage, int type, int targetId) throws Exception {
		List<CommentVO> list = commentDao.ajaxLoad(currentPage, Constant.COMMENT_AJAX_LOAD_COUNT, type, targetId);
		int count = commentDao.selectCommentCount(type, targetId);
		int pageSize = Constant.COMMENT_AJAX_LOAD_COUNT;
		int totalPage = 0;
		if(count % pageSize == 0) {
			totalPage = count / pageSize;
		} else {
			totalPage = count / pageSize + 1;
		}
		return new PageBean<>(list, currentPage, pageSize, totalPage, count);
	}

}
