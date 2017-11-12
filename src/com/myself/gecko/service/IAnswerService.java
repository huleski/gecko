package com.myself.gecko.service;

import java.util.List;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.User;

public interface IAnswerService {

    List<Answer> ajaxLoad(int currentPage, int qid, User user) throws Exception;

    void save(Answer answer) throws Exception;

    void agree(User user, int aid) throws Exception;

    void disagree(User user, int aid) throws Exception;

    List<Answer> findHotday(int currentPage, User user) throws Exception;

    List<Answer> findHotmonth(int currentPage, User user) throws Exception;

    List<Answer> search(String keywords, int currentPage) throws Exception;

}
