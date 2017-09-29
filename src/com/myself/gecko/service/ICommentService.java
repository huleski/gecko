package com.myself.gecko.service;

import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.domain.PageBean;
import com.myself.gecko.domain.User;

public interface ICommentService {

	//List<CommentVO> ajaxLoad(int currentPage, int type, int targetId) throws Exception;

	PageBean<CommentVO> pageQuery(int currentPage, int type, int targetId, User user) throws Exception;

	void save(Comment comment) throws Exception;

	void agree(User user, int cid) throws Exception;
	
	void disagree(User user, int cid) throws Exception;

}
