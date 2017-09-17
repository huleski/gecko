package com.myself.gecko.dao;

import java.util.List;

import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.CommentVO;

public interface ICommentDao extends IBaseDao<Comment> {

	List<CommentVO> ajaxLoad(int currentPage, int pageSize,int type, int targetId) throws Exception;

	int selectCommentCount(int type, int targetId) throws Exception;

}
