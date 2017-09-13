package com.myself.gecko.service;

import com.myself.gecko.domain.Question;

public interface IQuestioinService {

	void save(Question question) throws Exception ;

	String ajaxQueryByUid(int currentPage, int uid) throws Exception ;

}
