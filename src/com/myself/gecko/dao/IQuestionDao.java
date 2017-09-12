package com.myself.gecko.dao;

import com.myself.gecko.domain.Question;

public interface IQuestionDao extends IBaseDao<Question> {

	void save(Question question) throws Exception;

}
