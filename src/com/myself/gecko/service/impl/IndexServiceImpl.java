package com.myself.gecko.service.impl;

import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.ArticleDaoImpl;
import com.myself.gecko.dao.impl.QuestionDaoImpl;
import com.myself.gecko.dao.impl.TopicDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IIndexService;

/**
 * 自己的关注:话题(新增问题), 问题 (新增的回答) 
 * 关注的用户:写回答, 写文章, 关注话题/问题, 赞同回答/文章,
 */
@SuppressWarnings("all")
public class IndexServiceImpl implements IIndexService {
    private ITopicDao topicDao = TopicDaoImpl.getTopicDao();
    private IQuestionDao questionDao = new QuestionDaoImpl();
    private IArticleDao articleDao = new ArticleDaoImpl();
    private IAnswerDao answerDao = new AnswerDaoImpl();

    @Override
    public Set getSet(User user, int currentPage) throws Exception {
        // 创建根据时间排序的TreeSet集合
        TreeSet set = new TreeSet<>(new Comparator() {
            @Override
            public int compare(Object o1, Object o2) {
                try {
                    Method method1 = o1.getClass().getMethod("getDate");
                    Method method2 = o2.getClass().getMethod("getDate");
                    Date d1 = (Date) method1.invoke(o1);
                    Date d2 = (Date) method2.invoke(o2);
                    return d1.compareTo(d2);
                } catch (Exception e) {
                    e.printStackTrace();
                    return 0;
                }
            }
        });
        
        if (user == null) { // 用户未登录
            //查询新增的回答
            List<Answer> newAnswerList = answerDao.findNewestAnswers(currentPage, Constant.INDEX_NEW_ANSWER);
            set.addAll(newAnswerList);
            
            //查询新提出的问题
            List<Question> newQuestionList = questionDao.findNewestQuestions(currentPage, Constant.INDEX_NEW_QUESTION);
            set.addAll(newQuestionList);
            
            //查询新发表的文章
            List<Article> newArticleList = articleDao.findNewestArticles(currentPage, Constant.WATCHEDUSER_ARTICLE_COUNT);
            set.addAll(newArticleList);
            
        } else { // 用户已登录
            //查询已关注的话题中新增的问题
            List<Question> newQuestions = questionDao.findNewestQuestionInWatchedTopics(user, currentPage, Constant.INDEX_NEW_QUESTION);
            set.addAll(newQuestions);
            
            // 查询已关注的问题中新增的回答
            List<Answer> newAnswers = answerDao.findNewestAnswerInWatchedQuestion(user, currentPage, Constant.INDEX_NEW_ANSWER);
            set.addAll(newAnswers);
            
            // 查询已关注的用户中新增的回答
            List<Answer> watchedUserAnswers = answerDao.findAnswersByUserWatch(user, currentPage, Constant.WATCHEDUSER_ANSWER_COUNT);
            set.addAll(watchedUserAnswers);
            
            // 查询已关注的用户中新发表的文章
            List<Article> watchedUserArticle = articleDao.findArticlesByUserWatch(user, currentPage, Constant.WATCHEDUSER_ARTICLE_COUNT);
            set.addAll(watchedUserArticle);
            
            // 查询已关注的用户中新关注的话题
            List<Topic> newWatchTopics = topicDao.findNewWatchedTopicWithFriends(user, currentPage, Constant.WATCHEDUSER_TOPIC_WATCH_COUNT);
            set.addAll(newWatchTopics);
            
            // 查询已关注的用户中新关注的问题
            List<Question> newWatchQuestions = questionDao.findNewWatchedQuestionWithFriends(user, currentPage, Constant.WATCHEDUSER_QUESTION_WATCH_COUNT);
            set.addAll(newWatchQuestions);
        }
System.out.println("-------------------------" + set.size());
        return set;
    }
}
