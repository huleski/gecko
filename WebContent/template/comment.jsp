<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<!-- 用户评论 -->
	<c:forEach items="${pageBean.list }" var="vo">
		<div class="user-comment">
			<div style="position:relative">
				<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${vo.uid}">
					<img class="comment-user-photo" src="${pageContext.request.contextPath}/img/default.jpg" />
					<span style="margin-left: 10px;color: black;">${vo.name }</span>
				</a>
				<c:if test="${not empty vo.parentName }">
					<span style="color:gray; margin:0 10px;"> 回复 </span><a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${vo.parentUid}" style="color:black">${vo.parentName }</a>
				</c:if>
				<span class="comment-time"><fmt:formatDate value="${vo.date}" pattern="yyyy-MM-dd" /></span>
			</div>
			<div style="margin: 10px 0;">
				${vo.content }
			</div>
			<div class="comment-situation">
				<a href="javascript:void(0)" onclick="agreeComment(${vo.id}, this)">
					<c:if test="${vo.agree != 1}">
						<i class="fa fa-thumbs-o-up" ></i>
						<i class="fa fa-thumbs-up" style="display:none"></i>
					</c:if>
					<c:if test="${vo.agree == 1}">
						<i class="fa fa-thumbs-o-up" style="display:none"></i>
						<i class="fa fa-thumbs-up"></i>
					</c:if>
					<span>${vo.agreeCount }</span>
				</a>
				<a class="comment-replybtn">
					<span class="glyphicon glyphicon-edit"></span>
					<span>回复</span>
				</a>
				<a>
					<i class="fa fa-thumbs-o-down"></i>
					<span>踩</span>
				</a>
				<a>
					<span class="glyphicon glyphicon-flag"></span>
					<span>举报</span>
				</a>
			</div>
			<div class="comment-reply" style="display: none;">
				<input type="text" class="form-control comment-input" placeholder="回复  ${vo.name}"/>
				<div style="text-align: right;" class="comment-reply-opr">
					<button type="button" class="btn btn-default comment-cancel">取消</button>
					<button type="button" class="btn btn-info comment-ok" disabled="" onclick="submitCommentReply(this, ${vo.id}, ${targetId}, ${vo.type })">评论</button>
				</div>
			</div>
		</div>
		<div class="separator"></div>
	</c:forEach>
	
	<!-- 分页 -->
	<c:if test="${pageBean.count > pageBean.pageSize }">
		<div style="padding:10px 0;text-align: center;">
			<ul class="pagination" style="margin:auto">
				<!-- 上一页 -->
				<c:if test="${pageBean.currentPage == 1 }">
				  <li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>
				</c:if>						
				<c:if test="${pageBean.currentPage != 1 }">
				  <li><a href="javascript:void(0)" onclick="showComment(${targetId}, ${pageBean.currentPage - 1}, ${pageBean.list[0].type }, this)">&laquo;</a></li>
				</c:if>
				
				<!-- 翻页数 -->
				<c:forEach begin="1" end="${pageBean.totalPage }" var='n'>
					<c:if test="${pageBean.currentPage == n }">						
					  <li class="active" style="z-index:3"><a href="javascript:void(0)">${n }</a></li>
					</c:if>
					<c:if test="${pageBean.currentPage != n }">						
					  <li><a href="javascript:void(0)" onclick="showComment(${targetId}, ${n}, ${pageBean.list[0].type }, this)">${n }</a></li>
					</c:if>
				</c:forEach>
						
				<!-- 下一页 -->
				<c:if test="${pageBean.currentPage < pageBean.totalPage}">				  
				  <li><a href="javascript:void(0)" onclick="showComment(${targetId}, ${pageBean.currentPage + 1}, ${pageBean.list[0].type }, this)">&raquo;</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage >= pageBean.totalPage}">				  
				  <li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
				</c:if>
			</ul>		
		</div>
	</c:if>
	<c:if test="${empty pageBean.list }">
		<div style="height: 150px;padding-top: 20px;">
			<div align="center">
				<img src="${pageContext.request.contextPath}/img/noanswer.png" />
			</div>
			<div style="color: darkgray;font-size: 15px;text-align: center;">
				还没有评论，赶紧评论吧
			</div>
		</div>
	</c:if>
</body>
</html>