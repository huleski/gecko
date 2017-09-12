<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>话题.发现导航栏</title>
</head>
<body>

	<!--导航栏-->
	<div id="topbar">
		<div style="width: 1020px;margin: auto;">
			<a href="${pageContext.request.contextPath}/jsp/index.jsp" style="font-size: 32px; color: white;font-family: '黑体';">逼乎</a>
			<span style="position: relative;top: -5px;">
				<form action="#" method="get" style="display: inline;">
					<input type="text" placeholder="搜索你感兴趣的内容..." style="width: 320px;height: 35px;border-top-left-radius: 3px;border-bottom-left-radius: 3px;border: 1;
						margin-left: 10px;padding-left: 10px;"/>
					<button type="submit" class="btn btn-info" style="position:relative;margin-left: -5px;height: 35px;width:40px;border: 1;">
	 						<span class="glyphicon glyphicon-search" style="color: white;"></span>
			</button>
			</form>
			</span>
			<span style="position: relative;top: -5px;font-size: 15px;">
				<a class="topmenu" href="${pageContext.request.contextPath}/jsp/index.jsp" style="margin-left: 30px;">首页</a>
				<a class="topmenu" href="${pageContext.request.contextPath}/jsp/topic.jsp" style="margin-left: 30px;">话题</a>
				<a class="topmenu" href="${pageContext.request.contextPath}/jsp/find.jsp" style="margin-left: 30px;">发现</a>
				<button type="button" class="btn btn-info" style="width:60px;font-size: 14px;margin-left: 100px;" onclick="writeQuestioin()">提问</button>
				<a class="topmenu" href="${pageContext.request.contextPath}/jsp/login.jsp?register=1" style="margin-right: 30px;">
					<span class="glyphicon glyphicon-user" style="color: #F5F5F5;margin-left: 30px;"></span> 注册逼乎
			</a>
			<a class="topmenu" href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
			</span>
		</div>
	</div>
	
</body>
</html>