package com.myself.gecko.service.impl;

import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.ArticleDaoImpl;
import com.myself.gecko.dao.impl.QuestionDaoImpl;
import com.myself.gecko.dao.impl.TopicDaoImpl;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IIndexService;
import com.sun.org.apache.bcel.internal.generic.FDIV;
import com.sun.xml.internal.ws.api.server.SDDocumentFilter;

/**
 * 自己的关注:话题(新增问题), 问题 (新增的回答) 关注的用户:写回答, 写文章, 关注话题/问题, 赞同回答/文章,
 */
@SuppressWarnings("all")
public class IndexServiceImpl implements IIndexService {
    private ITopicDao topicDao = TopicDaoImpl.getTopicDao();
    private IQuestionDao QuestionDao = new QuestionDaoImpl();
    private IArticleDao articledao = new ArticleDaoImpl();
    private IAnswerDao answerDao = new AnswerDaoImpl();

    @Override
    public Set getSet(User user) throws Exception {
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
        // 自己的关注:话题(新增问题), 问题 (新增的回答)
        // 关注的用户:写回答, 写文章, 关注话题/问题, 赞同回答/文章,
        if (user == null) { // 用户未登录
            
        } else { // 用户已登录
            List<Topic> topicList = topicDao.findWatchedTopic(user.getId());
            for (Topic topic : topicList) {
                
            }
            
        }

        return null;
    }

}
