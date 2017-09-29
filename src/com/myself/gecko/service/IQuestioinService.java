package com.myself.gecko.service;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;

public interface IQuestioinService {

	void save(Question question) throws Exception ;

	String ajaxQueryByUid(int currentPage, int uid) throws Exception ;

	Question findQuestioinById(int id, User user) throws Exception;

}
