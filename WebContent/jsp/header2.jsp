<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.css" rel="stylesheet" />
<title>话题.发现导航栏</title>
</head>
<body>
	<!-- 提问模态框(包含登录模态框) -->
	<%@ include file="/jsp/askmodal.jsp" %>

	<!--导航栏-->
	<div id="topbar">
		<div style="width: 1000px;margin: auto;">
			<a href="${pageContext.request.contextPath}/jsp/index.jsp" style="font-size: 32px; color: white;font-family: '黑体';">逼乎</a>
			<span style="position: relative;top: -5px;">
				<form action="${pageContext.request.contextPath}/questionServlet" method="post" style="position: relative;display: inline;width:380px;">
					<div class="input-group" style="width:370px;position: absolute;top:-8px;left: 20px;">
				    	<input type="text" class="form-control" placeholder="搜索你感兴趣的内容...">
				    	<span class="input-group-btn">
					        <button class="btn btn-info" type="button" style="height:34px;color:white">
								<i class="fa fa-search  fa-lg"></i>
							</button>
				      	</span>
				    </div>
				</form>
			</span>
			<span style="position: relative;top: -5px;font-size: 15px;margin-left:400px">
				<a class="topmenu" href="${pageContext.request.contextPath}/jsp/index.jsp" style="margin-left: 30px;">首页</a>
				<a class="topmenu" onclick="findWatchedTopic()" href="javascript:void(0)" style="margin-left: 30px;">话题</a>
				<a class="topmenu" href="${pageContext.request.contextPath}/jsp/find.jsp" style="margin-left: 30px;">发现</a>
				<button type="button" class="btn btn-info" style="width:60px;font-size: 14px;margin-left: 120px;" onclick="writeQuestioin()">提问</button>
				
				<c:if test="${empty user}">	
					<a class="topmenu" href="${pageContext.request.contextPath}/jsp/login.jsp?register=1" style="margin-right: 20px;">
						<span class="glyphicon glyphicon-user" style="color: #F5F5F5;margin-left: 20px;"></span> 注册逼乎
					</a>
					<a class="topmenu" href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
				</c:if>
				<c:if test="${not empty user}">
					<span class="btn-group" style="margin-left: 50px;position:relative;top:5px">
						<a href="javascript:void(0)" data-toggle="dropdown" style="position: relative;top: -5px;margin-left: 30px;">
							<img src="${pageContext.request.contextPath}/${user.photo}" height="30px" width="30px"/>						
						</a>
						<ul class="dropdown-menu nav" role="menu">
						    <li>
						    	<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${user.id}">
						    		<i class="fa fa-user fa-fw"></i> 个人主页
						    	</a>
						    </li>
						    <li>
						    	<a href="${pageContext.request.contextPath}/userServlet?method=logout">
						    		<i class="fa fa-power-off fa-fw"></i> 退出
						    	</a>
						    </li>
						</ul>
					</span>
				</c:if>
				
			</span>
		</div>
	</div>
	
</body>
</html>