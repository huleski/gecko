package com.myself.gecko.dao;

import java.util.List;

import com.myself.gecko.domain.Answer;

public interface IAnswerDao extends IBaseDao<Answer> {
	List<Answer> findListByQid(int qid) throws Exception;
}
