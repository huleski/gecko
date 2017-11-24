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
			<div class="answerblock">
				<div class="text-dynamic">
					回答了问题
					<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
				</div>
				<div class="text-title">
					<a target="_blank" target="_blank" href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${s.question.id}" class="text-title-a">${fn:substring(s.question.title, 0, 50) }...</a>
				</div>
				<div class="text-content">
					${fn:substring(s.pureContent, 0, 120) }
					<a class="expand">...阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
				</div>
				<div class="text-all">
					${s.content }
				</div>
				<div class="text-end">
					<c:if test="${s.agree != 1 }">
						<button class="btn btn-default agreebtn" onclick="agree(${s.id}, this, 1)">
							<span class="glyphicon glyphicon-chevron-up"><span class="keepgap">${s.agreeCount}</span></span>
						</button>
					</c:if>
					<c:if test="${s.agree == 1 }">
						<button class="btn btn-info active agreebtn" onclick="disagree(${s.id}, this, 1)">
							<span class="glyphicon glyphicon-chevron-up"><span class="keepgap">${s.agreeCount}</span></span>
						</button>
					</c:if>
					<button class="btn btn-default disagreebtn" onclick="disagree(${s.id}, this, 1)">
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
						<a href="javascript:void(0)" class="text-situation">
							<span class="glyphicon glyphicon-share-alt"></span>
							<span>分享</span>
						</a>
						<a href="javascript:void(0)" class="text-situation">
							<span class="glyphicon glyphicon-star"></span>
							<span>收藏</span>
						</a>
						<a href="javascript:void(0)" class="text-situation">
							<span class="glyphicon glyphicon-heart"></span>
							<span>感谢</span>
						</a>
						<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="javascript:void(0)">没有帮助</a></li><li><a href="javascript:void(0)">举报</a></li></ul>'>
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
		<div class="separator"></div>
	</c:forEach>
</body>
</html>