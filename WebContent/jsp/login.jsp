<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>用户注册登录</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				$('#problem').popover();
				$("#registerForm").validate({
					rules: {
						username: "required",
						phone: {
							required: true,
							isMobile: true
						},
						password: {
							required: true,
							rangelength: [6, 12]
						},
						code: {
							required: true
						}
					},
					messages: {
						username: "请填写用户名",
						phone: {
							required: "请填写手机号",
						},
						password: {
							required: "请填写密码",
							rangelength: "密码应为{0}-{1}位"
						},
						code: {
							required: "请填写验证码",
						}
					},
					errorPlacement: function(error, element) {
						error.appendTo(element.next("label"));
					}
				});

				//自定义validate手机号验证
				$.validator.addMethod("isMobile", function(value, element) {
					var length = value.length;
					var mobile = /^1[34578]\d{9}$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
				}, "请输入正确的手机号");
				
				//判断是否是注册
				if("${param.register}" == 1) {
					$("#registerLi a").click();
				}
			});
		</script>
		<style type="text/css">
			body {
				background-image: url(${pageContext.request.contextPath}/img/bg.jpg);
			}
			
			#out {
				width: 440px;
				padding-bottom: 30px;
				background-color: white;
				margin-top: 20px;
				text-align: center;
				border-radius: 5px;
			}
			
			#in {
				width: 320px;
				margin: auto;
			}
			
			.input {
				width: 100%;
				height: 50px;
				font-size: 16px;
				padding-left: 10px;
			}
			.errordiv {
				position: relative;
				width: 320px;
			}
			.errorPlace {
				position: absolute;
				right: 5px;
				top: 15px;
			}
			#xieyi a {
				text-decoration: none;
			}
		</style>
	</head>

	<body>
		<div class="container-fluid" align="center">
			<!--外边框-->
			<div id="out">
				<div style="color: deepskyblue;font-family: '黑体';font-size: 80px;">
					逼<span style="margin-left: 20px;">乎</span>
				</div>
				<div>
					<h4>与世界分享你装逼的姿势,经验和见解</h4>
				</div>
				<!--内部框-->
				<div id="in">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#loginPage" data-toggle="tab" style="margin-left: 90px;">
								<font size="4" color="#000000">登录</font>
							</a>
						</li>
						<li id="registerLi">
							<a href="#registerPage" data-toggle="tab" style="margin-left: 30px;">
								<font size="4" color="#000000">注册</font>
							</a>
						</li>
					</ul>

					<div class="tab-content">
						<!--登录div-->
						<div class="tab-pane active" id="loginPage">
							<div style="width:46px;height: 4px;background-color: deepskyblue;margin-left: 100px;"></div>
							<div style="padding-top: 20px;">
								<form action="${pageContext.request.contextPath}/userServlet" method="post">
									<div>
										<input type="hidden" name="method" value="login" />
										<input type="text" name="name" class="input" placeholder="用户名" required="">
										<input type="password" name="password" class="input" placeholder="密码" required=""><br /><br />
										<button type="submit" class="btn btn-info btn-lg btn-block">登录</button>
									</div>
									<div style="margin-top: 16px;margin-bottom: 16px;">
										<input type="checkbox" id="rememberme" name="remember" value="yes"/><label for="rememberme">记住我</label>
										<span id="problem" style="margin-left: 180px;cursor: pointer;" data-original-title="解决方法:" data-trigger="hover" data-content="点我就告诉你!" data-toggle="modal" data-target="#forgetModal">
												无法登录?
										</span>
									</div>
								</form>
								<button type="submit" class="btn btn-default btn-lg btn-block" style="color: deepskyblue;border-color: deepskyblue;" data-toggle="modal" data-target="#appModal">
									下载逼乎APP
								</button>
							</div>
						</div>

						<!--注册div-->
						<div class="tab-pane" id="registerPage">
							<div style="width:46px;height: 4px;background-color: deepskyblue;margin-left: 200px;"></div>
							<div style="padding-top: 20px;">
								<div>
									<form id="registerForm" action="${pageContext.request.contextPath}/userServlet" method="post">
										<div style="height: 210px;margin-bottom: 15px;">
											<input type="hidden" name="method" value="register" />
											<div class="errordiv"><input name="name" type="text" class="input" placeholder="用户名"><label class="errorPlace"></label></div>
											<div class="errordiv"><input name="password" type="password" class="input" placeholder="密码"><label class="errorPlace"></label></div>
											<div class="errordiv"><input name="phone" type="text" class="input" placeholder="手机号"><label class="errorPlace"></label></div>
											<div class="errordiv">
												<input name="code" type="text" class="input" style="width: 210px;position: absolute;left: 0;" placeholder="验证码">
												<label class="errorPlace" style="right: 115px;"></label>
												<img src="${pageContext.request.contextPath}/img/check.jpg" width="90px" style="position: absolute;right: 0;margin: 4px 10px 20px;" />
											</div>
										</div>
										<button type="submit" class="btn btn-info btn-lg btn-block">注册逼乎</button>
									</form>
								</div>
								<div id="xieyi" style="margin-top: 16px;margin-bottom: 16px;">
									<span style="font-size: 14px;color: darkgray;">
										点击「注册」按钮，即代表你同意
										<a href="${pageContext.request.contextPath}/jsp/contract.jsp" target="_blank" style="color: deepskyblue;cursor: pointer;">
											《逼乎协议》
										</a>
									</span>
								</div>
								<div>
									<button type="submit" class="btn btn-default btn-lg btn-block" style="color: deepskyblue;border-color: deepskyblue;" data-toggle="modal" data-target="#appModal">
										下载逼乎APP
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--忘记密码Modal-->
			<div id="forgetModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">无法登录</h4>
						</div>
						<div class="modal-body" style="text-align: center; margin: 0 20px 0 20px;">
							<span>真乖,看你如此听话的份上我就大发慈悲地告诉你两种方法吧!</span>
							<div style="margin-top: 80px;">
								<button type="button" class="btn btn-info" data-dismiss="modal" style="width: 300px;">找回密码</button>
							</div>
							<div style="margin-top: 50px;margin-bottom: 80px;">
								<button type="button" class="btn btn-info" data-dismiss="modal" style="width: 300px;">人工申诉</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 二维码Modal -->
			<div class="modal fade" id="appModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">扫描二维码</h4>
						</div>
						<div class="modal-body">
							<span><img src="${pageContext.request.contextPath}/img/app.png" /></span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>

			<!--结尾谢幕-->
			<div style="width:780px;text-align: left;">
				<span style="position: absolute;bottom:12px;color: white;font-size: 12px;margin: auto;">
					© 2016 逼乎 · 逼乎圆桌 · 发现 · 移动应用 · 使用机构帐号登录 · 联系我们 · 来逼乎工作 · 京 ICP 备 13052560 号 · 京公网安备 11010802010035 号
				</span>
			</div>

			<!--反馈Modal-->
			<%@ include file="/jsp/feedback.jsp" %>
		</div>
	</body>
</html>