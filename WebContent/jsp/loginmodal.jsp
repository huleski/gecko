<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录模态框</title>
</head>
<body>
	<!-- 登录模态框 -->
	<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<div style="margin-top: 40px;text-align: center;">
						<h3>请先登录</h3>
					</div>
				</div>
					
				<div class="modal-body" style="text-align: center; margin: 0 20px 0 20px;">
					<span style="color: darkgray;">登录之后才可以回答或评论哦!</span>
					<div style="margin-top: 80px;">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp'" class="btn btn-info" data-dismiss="modal" style="width: 300px;">去登录</button>
					</div>
					<div style="margin-top: 50px;margin-bottom: 80px;">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp?register=1'"  class="btn btn-info" data-dismiss="modal" style="width: 300px;">还未注册</button>
					</div>
				</div>
					
			</div>
		</div>
	</div>
</body>
</html>