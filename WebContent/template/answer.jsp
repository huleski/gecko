<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:forEach items="${list}" var="a">
		<div class="answerblock">
			<div class="separator"></div>
			<div class="text-author">
				<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${a.user.id}">
					<img class="photo" src="${pageContext.request.contextPath}/img/default.jpg" />
				</a>
				<span class="personalmsg">
					<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${a.user.id}" style="color: black;">
						<div class="name">
							${a.user.name}
						</div>
					</a>
					<div class="signal">
						${a.user.sentence}
					</div>
				</span>
			</div>
			<div class="text-status">${a.agreeCount} 人也赞同了该回答</div>
			<div class="text-content">
				${fn:substring(a.pureContent, 0, 300) }
				<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
			</div>
			<div class="text-all">
				${a.content}
				<div class="edit-time">编辑于 <span> <fmt:formatDate value="${a.date}" pattern="yyyy-MM-dd" /></span></div>
			</div>
			<div class="text-end">
				<c:if test="${a.agree != 1 }">
					<button class="btn btn-default agreebtn" onclick="agree(${a.id}, this)">
						<span class="glyphicon glyphicon-chevron-up"><span class="keepgap">${a.agreeCount}</span></span>
					</button>
				</c:if>
				<c:if test="${a.agree == 1 }">
					<button class="btn btn-info active agreebtn" onclick="agree(${a.id}, this)">
						<span class="glyphicon glyphicon-chevron-up"><span class="keepgap">${a.agreeCount}</span></span>
					</button>
				</c:if>
				<button class="btn btn-default disagreebtn" onclick="disagree(${a.id}, this)">
					<span class="glyphicon glyphicon-chevron-down"></span>
				</button>
				<span>
					<a class="text-situation text-comment">
						<span onclick="showComment(${a.id}, 1, this)">
							<span class="comment-count"><span class="glyphicon glyphicon-comment"></span> ${a.commentCount} 条评论</span>
						</span>
						<span class="hidecomment" style="display: none;"><span class="glyphicon glyphicon-comment"></span> 收起评论</span>
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
				<div class="comment-title">
					<span style="font-weight: bold;">${a.commentCount} 条评论</span>								
					<a style="cursor: pointer;position: absolute;right: 20px;">切换为时间顺序</a>
				</div>
				<div class="separator" style="width: 100%;"></div>
				
				<!-- 用户评论 -->
				<div class="user-commentblock">
				</div>
				
				<div class="separator"></div>						
				<!--评论回答-->
				<div>
					<input type="text" class="form-control commentInput" placeholder="写下你的评论"/>
					<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, ${a.id})">评论</button>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>