<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.css" rel="stylesheet" />
<title>首页.主页导航栏</title>
</head>
<body>
	<!--导航栏-->
	<div id="topbar">
		<span style="position: relative;margin: auto;width: 1000px;">
			<span style="font-size: 15px;position: relative;">
				<a href="index.html" style="font-size: 32px; color: deepskyblue;font-family: '黑体';">逼乎</a>
				<span style="position: relative;top: -5px;">
					<a class="topmenu" href="${pageContext.request.contextPath}/jsp/index.jsp" style="margin-left: 30px;">首页</a>
					<a class="topmenu" href="${pageContext.request.contextPath}/jsp/topic.jsp" style="margin-left: 30px;">话题</a>
					<a class="topmenu" href="${pageContext.request.contextPath}/jsp/find.jsp" style="margin-left: 30px;">发现</a>
					<form action="${pageContext.request.contextPath}/" method="post" style="position: relative;display: inline;width:360px;">
						<!-- <input type="text" placeholder="搜索你感兴趣的内容..." style="width: 315px;height: 35px;border-top-left-radius: 3px;border-bottom-left-radius: 3px;border: 0;
							position: relative;left: 30px;top: 2px;padding-left: 10px;background-color: #F7F8FA;" required=""/>
						<button type="submit" class="btn btn-default" style="background-color: #F7F8FA;height: 35px;width:40px;border: 0;position: absolute;top: -7px;right: -25px;">
	  						<span class="glyphicon glyphicon-search" style="color: lightgray;font-size: 18px;"></span>
						</button> -->
						<div class="input-group" style="width:350px;position: absolute;top:-8px;left: 20px;">
					      <input type="text" class="form-control" placeholder="搜索你感兴趣的内容...">
					      <span class="input-group-btn">
					        <button class="btn btn-default" type="button" style="height:34px;color:lightgray">
								<i class="fa fa-search  fa-lg"></i>
							</button>
					      </span>
					    </div>
					</form>
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#askModal" style="width:60px;font-size: 14px;margin-left: 390px;position:relative;top:-2px">提问</button>
					<c:if test="${empty user}">	
						<button type="button" class="btn btn-info" style="width:60px;font-size: 14px;margin-left: 140px;" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp'">登录</button>
						<button type="button" class="btn btn-default" style="font-size: 14px;margin-left: 20px;color:deepskyblue;border:1px deepskyblue solid;" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp?register=1'">加入逼乎</button>
					</c:if>
					<c:if test="${not empty user}">	
						<span style="margin-left: 130px;position:relative;top:5px">
							<a href="#">
								<span class="glyphicon glyphicon-bell topmenu" style="font-size: 22px;color: lightgray;"></span>
								<span class="markcount">42</span>
							</a>
							<a href="#" style="margin-left: 30px;">
								<span class="glyphicon glyphicon-comment topmenu" style="font-size: 22px;color: lightgray;"></span>
							</a>
							<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${user.id}" style="position: relative;top: -5px;margin-left: 30px;">
								<c:if test="${empty user.photo }"><img src="${pageContext.request.contextPath}/img/default.jpg" height="30px" width="30px"/></c:if>
								<c:if test="${not empty user.photo }"><img src="${pageContext.request.contextPath}/${user.photo}" height="30px" width="30px"/></c:if>						
							</a>
						</span>
					</c:if>
				</span>
			</span>
				
		</span>
		<div style="height: 1px;background-color: lightgray;"></div>
	</div>
</body>
</html>