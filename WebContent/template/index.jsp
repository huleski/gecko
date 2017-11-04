<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:forEach items="${set }" var="s">
		<c:if test="${s.mark == 1}">
		<!-- 新增回答 -->
			<div class="answerblock">
				<div class="text-dynamic">
					来自 话题 <a class="text-dynamic-a" href="${pageContext.request.contextPath}/topicServlet?method=findById&id=${s.topic.id}">${s.topic.name }</a>
					<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
				</div>
				<div class="text-author">
					<a href="#">
						<img class="photo" src="${pageContext.request.contextPath}/${s.user.photo}" />
						<span class="name">${s.user.name}</span>
					</a>
					<span class="signal">
						,${s.user.sentence}...
					</span>
				</div>
				<div class="text-title">
					<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${s.question.id}" class="text-title-a">${fn:substring(s.question.title, 0, 50) }...</a>
				</div>
				<div class="text-content">
					${fn:substring(s.pureContent, 0, 120) }
					<a class="expand">...阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
				</div>
				<div class="text-all">
					${s.content }
				</div>
				<div class="text-end">
					<button class="btn btn-default">
					<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">${s.agreeCount}</span></span>
					</button>
					<button class="btn btn-default">
						<span class="glyphicon glyphicon-chevron-down opinion"></span>
					</button>
					<span>
						<a class="text-situation text-comment">
							<span onclick="showComment(${s.id}, 1, 1, this)">
								<span class="glyphicon glyphicon-comment"></span>
								<span class="comment-count">${s.commentCount } 条评论</span>
							</span>
							<span class="hidecomment" style="display: none;">收起评论</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-share-alt"></span>
							<span>分享</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-star"></span>
							<span>收藏</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-heart"></span>
							<span>感谢</span>
						</a>
						<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
							···
						</a>
					</span>
					<button class="takeback btn btn-info btn-xs">收起</button>
				</div>
				
				<!-- 评论div -->
				<div class="commentdiv">
					<!-- 用户评论 -->
					<div class="user-commentblock">
					</div>
					<div class="separator"></div>
					<!--评论回答-->
					<div>
						<input type="text" class="form-control commentInput" placeholder="写下你的评论"/>
						<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, ${s.id}, 1)">评论</button>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${s.mark == 11}">
		<!-- 新增回答 -->
			<div class="answerblock">
				<div class="text-dynamic">
					来自 话题 <a class="text-dynamic-a" href="${pageContext.request.contextPath}/topicServlet?method=findById&id=${s.topic.id}">${s.topic.name }</a>
					<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
				</div>
				<div class="text-author">
					<a href="#">
						<img class="photo" src="${pageContext.request.contextPath}/${s.user.photo}" />
						<span class="name">${s.user.name}</span>
					</a>
					<span class="signal">
						,${s.user.sentence}...
					</span>
				</div>
				<div class="text-title">
					<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${s.question.id}" class="text-title-a">${fn:substring(s.question.title, 0, 50) }...</a>
				</div>
				<div class="text-content">
					${fn:substring(s.pureContent, 0, 120) }
					<a class="expand">...阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
				</div>
				<div class="text-all">
					${s.content }
				</div>
				<div class="text-end">
					<button class="btn btn-default">
					<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">${s.agreeCount}</span></span>
					</button>
					<button class="btn btn-default">
						<span class="glyphicon glyphicon-chevron-down opinion"></span>
					</button>
					<span>
						<a class="text-situation text-comment">
							<span onclick="showComment(${s.id}, 1, 1, this)">
								<span class="glyphicon glyphicon-comment"></span>
								<span class="comment-count">${s.commentCount } 条评论</span>
							</span>
							<span class="hidecomment" style="display: none;">收起评论</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-share-alt"></span>
							<span>分享</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-star"></span>
							<span>收藏</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-heart"></span>
							<span>感谢</span>
						</a>
						<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
							···
						</a>
					</span>
					<button class="takeback btn btn-info btn-xs">收起</button>
				</div>
				
				<!-- 评论div -->
				<div class="commentdiv">
					<!-- 用户评论 -->
					<div class="user-commentblock">
					</div>
					<div class="separator"></div>
					<!--评论回答-->
					<div>
						<input type="text" class="form-control commentInput" placeholder="写下你的评论"/>
						<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, ${s.id}, 1)">评论</button>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${s.mark == 2}">
		<!-- 新增文章 -->
			<div class="answerblock">
				<div class="text-dynamic">
					来自 话题  <a class="text-dynamic-a" href="${pageContext.request.contextPath}/topicServlet?method=findById&id=${s.topic.id}">${s.topic.name }</a>
					<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
				</div>
				<div class="text-author">
					<a href="#">
						<img class="photo" src="${pageContext.request.contextPath}/${s.user.photo}" />
						<span class="name">${s.user.name}</span>
					</a>
					<span class="signal">
						,${s.user.sentence}…
					</span>
				</div>
				<div class="text-title">
					<a href="${pageContext.request.contextPath}/articleServlet?method=findById&aid=${s.id}" class="text-title-a">${fn:substring(s.title, 0, 50) }...</a>
				</div>
				<div class="text-content">
					${fn:substring(s.pureContent, 0, 120) }
					<a class="expand">...阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
				</div>
				<div class="text-all">
					${s.content }
				</div>
				<div class="text-end">
					<button class="btn btn-default">
					<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">${s.agreeCount}</span></span>
					</button>
					<button class="btn btn-default">
						<span class="glyphicon glyphicon-chevron-down opinion"></span>
					</button>
					<span>
						<a class="text-situation text-comment">
							<span onclick="showComment(${s.id}, 1, 2, this)">
								<span class="glyphicon glyphicon-comment"></span>
								<span class="comment-count">${s.commentCount } 条评论</span>
							</span>
							<span class="hidecomment" style="display: none;">收起评论</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-share-alt"></span>
							<span>分享</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-star"></span>
							<span>收藏</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-heart"></span>
							<span>感谢</span>
						</a>
						<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
							···
						</a>
					</span>
					<button class="takeback btn btn-info btn-xs">收起</button>
				</div>
			</div>
		</c:if>
		
		<c:if test="${s.mark == 3}">
		<!-- 新增问题 -->
			<div class="answerblock">
				<div class="text-dynamic">
					来自 话题  <a class="text-dynamic-a" href="${pageContext.request.contextPath}/topicServlet?method=findById&id=${s.topic.id}">${s.topic.name }</a>
					<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
				</div>
				<div class="text-title">
					<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${s.id}" class="text-title-a">${fn:substring(s.title, 0, 50) }...</a>
				</div>
				<div class="text-content">
					${fn:substring(s.pureContent, 0, 120)}
					<a class="expand">...阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
				</div>
				<div class="text-all">
					${s.content }
				</div>
				<div class="text-end">
					<span>
						<a class="text-situation"> ${s.watchCount } 人关注 </a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-share-alt"></span>
							<span>分享</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-star"></span>
							<span>收藏</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-heart"></span>
							<span>感谢</span>
						</a>
						<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
							···
						</a>
					</span>
				</div>
			</div>
		</c:if>
		
		
		<c:if test="${false}">
		<!-- 新增回答 -->
			<div class="answerblock">
				<div class="text-dynamic">
					<a class="text-dynamic-a" href="${pageContext.request.contextPath}/userServlet?method=findById&id=${s.user.id}">特种作死狗</a> 收藏了回答 1 天前
					<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
				</div>
				<div class="text-author">
					<a href="#">
						<img class="photo" src="${pageContext.request.contextPath}/img/default.jpg" />
						<span class="name">姓名</span>
					</a>
					<span class="signal">
						,人力资源（HR）话题优秀回答者 公众号：瞎说职场 HR…
					</span>
				</div>
				<div class="text-title">
					<a href="#" class="text-title-a">三十岁还没有走到管理岗的人，后来都做了什么？</a>
				</div>
				<div class="text-content">
					答：他们可以过得很好，只要做到几点（后面详述）前些年，公司每年都
					<a class="expand">...阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
				</div>
				<div class="text-all">
					<p>答：他们可以过得很好，只要做到几点（后面详述）</p>
					<p>前些年，公司每年都派个美国老大爷要飞一趟上海，做全球人才管理方面的培训，头发花白，感觉要60岁了吧（问他，他总说20出头）。人特别精神，每天早上6点就起床，在酒店泳池游1个小时再来上班。</p>
				</div>
				<div class="text-end">
					<button class="btn btn-default">
					<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">10K</span></span>
					</button>
					<button class="btn btn-default">
						<span class="glyphicon glyphicon-chevron-down opinion"></span>
					</button>
					<span>
						<a class="text-situation text-comment">
							<span onclick="showComment(1, 1, 1, this)">
								<span class="glyphicon glyphicon-comment"></span>
								<span class="comment-count">900条评论</span>
							</span>
							<span class="hidecomment" style="display: none;">收起评论</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-share-alt"></span>
							<span>分享</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-star"></span>
							<span>收藏</span>
						</a>
						<a href="#" class="text-situation">
							<span class="glyphicon glyphicon-heart"></span>
							<span>感谢</span>
						</a>
						<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
							···
						</a>
					</span>
					<button class="takeback btn btn-info btn-xs">收起</button>
				</div>
				
				<!-- 评论div -->
				<div class="commentdiv">
					<!-- 用户评论 -->
					<div class="user-commentblock">
					</div>
					<div class="separator"></div>
					<!--评论回答-->
					<div>
						<input type="text" class="form-control commentInput" placeholder="写下你的评论"/>
						<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, 1, 1)">评论</button>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
</body>
</html>