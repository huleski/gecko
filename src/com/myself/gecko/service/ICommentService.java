package com.myself.gecko.service;

import java.util.List;

import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.CommentVO;
import com.myself.gecko.domain.PageBean;

public interface ICommentService {

	List<CommentVO> ajaxLoad(int currentPage, int type, int targetId) throws Exception;

	PageBean<CommentVO> pageQuery(int currentPage, int type, int targetId) throws Exception;

	void save(Comment comment) throws Exception;

}
