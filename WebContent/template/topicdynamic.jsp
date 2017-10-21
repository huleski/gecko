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

	<%-- <div class="text-block">
		<div class="question">
			<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=22">
				如何看待ti7之后存在一些wings清流粉无脑吹wings并且贬低其他队伍的现象？
			</a>
		</div>
		<div style="position: relative;">
			<button class="thinking">839</button>
			<span class="author-info"> <a href="#" class="author-name">郭哲彪</a>
				<span class="author-signal">, 逗比的泪窦久泽可乐喝了</span>
			</span>
		</div>
		<div class="text">
			<span class="word">-------------------------------------------------------------------------------------------------------
				的感觉是场场都有大招。也许大家都记得wings打MVP放对面PA的大招，用了2套阵容打爆MVP，杀人诛心。但其实第二局的阵容选了 蝙蝠
				--------------------------------------------------------------------------------------------
				--------------------------------------------------------------------------------------------…</span> <span class="showall">显示全部</span>
		</div>
		<div class="text-all">
			<p>TI7的评论席上，国土说WINGS是一个前无古人的战队，刷新了职业战队对于BP的理念。即使那些所谓的灵性外国队，例如液体也只是在后期弄出个先知体系的大招。但wings
				的感觉是场场都有大招。</p>
		</div>
		<div class="text-footer">
			<a href="#">关注问题</a> 
			<a class="text-comment" href="javascript:void(0)" onclick="showComment(1, 1, 1, this)">463 条评论</a> 
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
		
		
		<div class="commentdiv">
			<div class="user-commentblock">
				<div class="user-comment"></div>
				<div class="separator"></div>
				
				<div style="padding:10px 0;text-align: center;">
					<ul class="pagination" style="margin:auto">
					  	<li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>
						
					  	<li class="active" style="z-index:3"><a href="javascript:void(0)">1</a></li>
					  	<li style="z-index:3"><a href="javascript:void(0)">2</a></li>
					  	<li style="z-index:3"><a href="javascript:void(0)">3</a></li>
								
					  <li><a href="javascript:void(0)" onclick="showComment(1, 2, this)">&raquo;</a></li>
					</ul>		
				</div>
			</div>
			<div class="separator"></div>
			<div>
				<input type="text" class="form-control commentInput" placeholder="写下你的评论"/>
				<button class="btn btn-info commentSubmitBtn" disabled="disabled" type="button" onclick="submitAnswerComment(this, null, ${a.id})">评论</button>
			</div>
		</div>
		<div class="separator"></div>
	</div> --%>
</body>
</html>