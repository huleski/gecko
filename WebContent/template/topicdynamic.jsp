<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:forEach items="${set }" var="a">
		<c:if test="${a.mark == 1 }">
			<!-- 加载的是回答 -->
			<div class="text-block">
				<div class="question">
					<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${a.question.id}">
						${fn:substring(a.question.title, 0, 50) }...
					</a>
				</div>
				<div style="position: relative;margin-bottom:10px;">
					<button class="thinking">${a.agreeCount }</button>
					<span class="author-info"> 
						<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${a.user.id}" class="author-name">
							${a.user.name }
						</a>
						<span class="author-signal">, ${a.user.sentence }</span>
					</span>
				</div>
				<div class="text">
					<span class="word">${fn:substring(a.pureContent, 0, 120) }...</span> <span class="showall">显示全部</span>
				</div>
				<div class="text-all">${a.content }</div>
				<div class="text-footer">
					<a href="#">关注问题</a> 
					<a class="text-comment" href="javascript:void(0)" onclick="showComment(${a.id}, 1, 1, this)">${a.commentCount } 条评论</a> 
					<span class="hidelabel">
						<a href="#">感谢</a> 
						<a href="#">分享</a> 
						<a href="#">收藏</a> 
						<a href="#">没有帮助</a>
						<a href="#">举报</a>
					</span> 
					<a href="#">作者保留权利</a> 
					<span class="takebackspan"><a>收起</a></span>
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
						<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, ${a.id}, 1)">评论</button>
					</div>
				</div>
				<div class="separator"></div>
			</div>
		</c:if>
	
		<c:if test="${a.mark == 2 }">
			<!-- 加载的是文章 -->
			<div class="text-block">
				<div class="question">
					<a href="${pageContext.request.contextPath}/articleServlet?method=findById&aid=${a.id}">
						${fn:substring(a.title, 0, 50) }...
					</a>
				</div>
				<div style="position: relative;margin-bottom:10px;">
					<button class="thinking">${a.agreeCount}</button>
					<span class="author-info"> 
						<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${a.user.id}" class="author-name">
							${a.user.name }
						</a>
						<span class="author-signal">, ${a.user.sentence }</span>
					</span>
				</div>
				<div class="text">
					<img alt="[图片]" style="width:200px;height:120px;" src="${pageContext.request.contextPath}/${a.titlePicture}">
					<div style="position:absolute;right:0;top:0;width:380px;">
						<span class="word">${fn:substring(a.pureContent, 0, 120) }...</span> 
						<span class="showall">显示全部</span>
					</div>
				</div>
				<div class="text-all">
					<div style="margin-bottom:20px;text-align:center;"><img alt="[图片]" style="width:550px;" src="${pageContext.request.contextPath}/${a.titlePicture}"></div>
					<div>${a.content }</div>
				</div>
				<div class="text-footer">
					<a href="#">关注问题</a>
					<a class="text-comment" href="javascript:void(0)" onclick="showComment(${a.id}, 1, 2, this)">${a.commentCount } 条评论</a> 
					<span class="hidelabel">
						<a href="#">感谢</a> 
						<a href="#">分享</a> 
						<a href="#">收藏</a> 
						<a href="#">没有帮助</a>
						<a href="#">举报</a>
					</span> 
					<a href="#">作者保留权利</a> 
					<span class="takebackspan"><a>收起</a></span>
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
						<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, ${a.id}, 2)">评论</button>
					</div>
				</div>
				<div class="separator"></div>
			</div>
		</c:if>
		
		<c:if test="${a.mark == 3 }">
			<!-- 加载的是问题 -->
			<div class="text-block">
				<div style="margin-bottom:10px;">
					<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${a.user.id}" class="author-name">${a.user.name }</a>
					<span style="margin-left:10px;">添加了问题:</span> 
				</div>
				<div style="font-size:16px;font-weight:bold;">
					<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${a.id}">
						${fn:substring(a.title, 0, 50) }...
					</a>
				</div>
				<div class="text-footer">
					<a href="#">关注问题</a> 
					<a class="text-comment" href="javascript:void(0)">${fn:length(a.answerList)} 个回答</a> 
					<span class="hidelabel">
						<a href="#">感谢</a> 
						<a href="#">分享</a> 
						<a href="#">收藏</a> 
						<a href="#">没有帮助</a>
						<a href="#">举报</a>
					</span> 
					<a href="#">作者保留权利</a> 
					<span class="takebackspan"><a>收起</a></span>
				</div>
				<div class="separator"></div>
			</div>
		</c:if>
	</c:forEach>
</body>
</html>