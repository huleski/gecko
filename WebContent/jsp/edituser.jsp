<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>编辑个人资料</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<style type="text/css">
			body {
				background-color: #F3F3F3;
			}
			
			a:hover {
				text-decoration: none;
			}
			
			a:visited {
				text-decoration: none;
			}
			
			a:active {
				text-decoration: none;
			}
			
			#topbar {
				height: 50px;
				background-color: white;
				width: 100%;
				position: fixed;
				top: 0;
				z-index: 10;
				text-align: center;
			}
			
			.topmenu {
				color: darkgray;
			}
			
			#footer li {
				display: inline;
			}
			
			#footer a {
				color: darkgray;
			}
			
			.markcount {
				background-color: red;
				padding: 0 3px;
				position: relative;
				top: -15px;
				left: -15px;
				font-size: 5px;
				color: white;
				border-radius: 8px;
			}
		</style>
		<style type="text/css">
			#rootDiv {
				width: 300px;
				margin-top: 10px;
				line-height: 1.9;
			}
			
			#rootDiv .footchain {
				margin-right: 10px;
			}
			
			#rootDiv .footlab {
				color: #337AB7;
			}
		</style>
		<style type="text/css">
			#personalshow {
				width: 1015px;
				height: 300px;
				position: relative;
				top: 60px;
				margin: auto;
				border-radius: 3px;
			}
			
			#topdiv {
				width: 1015px;
				height: 240px;
				background-color: #E3E3E3;
			}
			
			#bottomdiv {
				width: 1015px;
				background-color: white;
				position: relative;
			}
			
			#photoback {
				background-color: white;
				width: 170px;
				height: 170px;
				position: absolute;
				top: -20px;
				left: 20px;
				border-radius: 8px;
				cursor: pointer;
			}
			
			#personalimg {
				width: 160px;
				height: 160px;
				border-radius: 5px;
				margin-top: 5px;
				margin-left: 5px;
				position: absolute;
			}
			
			#personalimgcover {
				width: 160px;
				height: 160px;
				border-radius: 5px;
				margin-top: 5px;
				margin-left: 5px;
				background-color: black;
				opacity: 0.4;
				position: absolute;
			}
			
			#uploadphotobtn {
				position: absolute;
				right: 25px;
				top: 25px;
				padding-left: 15px;
				padding-right: 15px;
				background-color: #E3E3E3;
				border: 1px solid darkgray;
				color: darkgray;
			}
			
			#personalname {
				font-size: 28px;
				font-weight: bold;
			}
			
			#careerico {
				position: relative;
				top: -115px;
				left: -55px;
			}
			
			#career {
				position: relative;
				margin-left: 20px;
				top: -3px;
			}
			
			#morepersonalmsg {
				position: relative;
				top: -55px;
				left: -165px;
			}
			
			#returnpersonal {
				position: absolute;
				right: 20px;
				top: 20px;
				z-index: 1;
			}
			#editinfo {
				position: absolute;
				right: 20px;
				top: 60px;
				z-index: 1;
			}
			#saveinfo {
				position: absolute;
				right: 20px;
				top: 60px;
				z-index: 1;
				display: none;
			}
			.separator {
				height: 1px;
				width: 98%;
				margin: 40px 10px;
				background-color: lightgray;
			}
			#cancel {
				position: absolute;
				right: 120px;
				top: 60px;
				z-index: 1;
				display: none;
			}
		</style>

		<script type="text/javascript">
			$(function() {
				$(".topmenu").hover(function() {
						$(this).css("color", "lightslategray");
					},
					function() {
						$(this).css("color", "darkgray");
					});

				$("#uploadphotobtn").hover(function() {
					$("#uploadphotobtn").css("background-color", "lightgray");
				}, function() {
					$("#uploadphotobtn").css("background-color", "#E3E3E3");
				});
				
				$("#editinfo").click(function() {
					$(".personalinfo").removeAttr("disabled");
					$(this).hide();
					$("#saveinfo").show();
					$("#cancel").show();
				});
				$("#cancel").click(function() {
					$(".personalinfo").attr("disabled", "");
					$(this).hide();
					$("#saveinfo").hide();
					$("#editinfo").show();
				});
				
				//保存用户修改资料
				$("#saveinfo").click(function() {
					$("#editForm").submit();
				});
				
				
				//弹出背景图上传选择框
				$("#uploadphotobtn").click(function() {
					$("#backphoto").click();
				});
				$("#backphoto").change(function(){
					var formData = new FormData();
					var file = this.files[0];
					formData.append("backphoto", file);
					if(!/\.(gif|jpg|jpeg|png|GIF|JPG|JPEG|PNG)$/.test(this.value)) {
						alert("请选择gif,jpg,jpeg,png等格式的图片文件");
						return;
					}
					if(file.size/1024 > 500) {
						alert("图片大小不超过500K");
						return;
					}
					$.ajax({
						url:"${pageContext.request.contextPath}/uploadServlet",
						type:"post",
						data: formData,
						processData:false,
						contentType:false,
						success:function(result) {
							$("#topdiv").css("background", "url(/gecko/" + result +")");
						},
						error: function(errMsg) {
							console.log(errMsg);
						}
					});
				});				
				
				//弹出头像上传选择框
				$("#photoback").click(function() {
					$("#photo").click();
				});
				
				//上传头像
				$("#photo").change(function(){
					var formData = new FormData();
					var file = this.files[0];
					formData.append("photo", file);
					if(!/\.(gif|jpg|jpeg|png|GIF|JPG|JPEG|PNG)$/.test(this.value)) {
						alert("请选择gif,jpg,jpeg,png等格式的图片文件");
						return;
					}
					if(file.size/1024 > 500) {
						alert("图片大小不超过500K");
						return;
					}
					
					$.ajax({
						url:"${pageContext.request.contextPath}/uploadServlet",
						type:"post",
						data: formData,
						processData:false,
						contentType:false,
						success:function(result) {
							$("#photoback").find("img").attr("src", "/gecko/" + result);
						},
						error: function(errMsg) {
							console.log(errMsg);
						}
					});
				});
			});
		</script>
	</head>

	<body>
		<div class="">
			<!-- 引入导航栏 -->
			<%@ include file="/jsp/header1.jsp" %>

			<!--个人展示div-->
			<div id="personalshow">
				<c:if test="${empty user.backphoto }">
				<div id="topdiv">
					<button class="btn" id="uploadphotobtn">
						<span class="glyphicon glyphicon-camera" ></span>
						上传封面图片
					</button>
				</div>
				</c:if>
				
				<c:if test="${not empty user.backphoto }">
				<div id="topdiv" style="background:url(${pageContext.request.contextPath}/${user.backphoto})">
					<button class="btn" id="uploadphotobtn">
						<span class="glyphicon glyphicon-camera" ></span>
						上传封面图片
					</button>
				</div>
				</c:if>
				<input id="backphoto" type="file" style="display:none"/>
				
				<div id="bottomdiv">
					<!--
                    	作者：515906299@qq.com
                    	时间：2017-09-08
                    	描述：头像
                    -->
					<div id="photoback">
						<c:if test="${empty user.photo }">
							<img src="${pageContext.request.contextPath}/img/defaultbig.jpg" id="personalimg" />
						</c:if>
						<c:if test="${not empty user.photo }">
							<img src="${pageContext.request.contextPath}/${user.photo}" id="personalimg" />
						</c:if>
						<div id="personalimgcover"></div>
						<div class="glyphicon glyphicon-camera" style="font-size: 30px;position: absolute;left: 70px;top: 60px;color: white;"></div>
						<label style="font-size: 15px;position: absolute;top: 100px;left: 40px;color: white;">修改我的头像</label>
					</div>
					<input id="photo" type="file" style="display:none"/>

					<a id="returnpersonal" href="${pageContext.request.contextPath}/userServlet?method=findById&id=${user.id}">
						返回我的主页
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
					<button id="editinfo" type="button" class="btn btn-info">修改资料</button>
					<button id="saveinfo" type="button" class="btn btn-info">保存修改</button>
					<button id="cancel" type="button" class="btn btn-default">取消</button>

					<!--
                    	作者：515906299@qq.com
                    	时间：2017-09-08
                    	描述：个人信息
                    -->
					<div style="width: 790px;position: relative;left: 215px;top: 20px;">
						<span id="personalname">${user.name }</span>
						<div class="separator"></div>
						<form id="editForm" role="form" action="${pageContext.request.contextPath}/userServlet" method="post">
							<input type="hidden" name="method" value="editUser" />
							<input type="hidden" name="id" value="${user.id }" />
							<div class="form-group">
								<label>性别</label>
								<select class="form-control personalinfo" disabled="" name="sex">
									<option>请选择性别</option>
									<c:if test="${user.sex == '男' }"><option value="男" selected="">男</option></c:if>
									<c:if test="${user.sex != '男' }"><option value="男">男</option></c:if>
									
									<c:if test="${user.sex == '女' }"><option value="女" selected="">女</option></c:if>
									<c:if test="${user.sex != '女' }"><option value="女">女</option></c:if>
								</select>
							</div>
							<div class="separator"></div>
							<div class="form-group">
								<label>一句话介绍</label>
								<input type="text" class="form-control personalinfo" disabled="" placeholder="介绍自己" name="sentence" value="${user.sentence }">
							</div>
							<div class="separator"></div>
							<div class="form-group">
								<label>居住地</label>
								<input type="text" class="form-control personalinfo" disabled="" placeholder="请填写居住地" name="address" value="${user.address }">
							</div>
							<div class="separator"></div>
							<div class="form-group">
								<label>所在行业</label>
								<input type="text" class="form-control personalinfo" disabled="" placeholder="请填写从事行业" name="industry" value="${user.industry }">
							</div>
							<div class="separator"></div>
							<div class="form-group">
								<label>职业经历</label>
								<input type="text" class="form-control personalinfo" disabled="" placeholder="请填写从事职位" name="profession" value="${user.profession }">
							</div>
							<div class="separator"></div>
							<div class="form-group">
								<label>教育经历</label>
								<input type="text" class="form-control personalinfo" disabled="" placeholder="请填写教育经历" name="education" value="${user.education }">
							</div>
							<div class="separator"></div>
							<div class="form-group">
								<label>个人简介</label>
								<input type="text" class="form-control personalinfo" disabled="" placeholder="请填写个人简介" name="description" value="${user.description }">
							</div>
							<div class="separator"></div>
						</form>
					</div>
				</div>
			</div>

			<!--提问Modal-->
			<%@ include file="/jsp/askmodal.jsp" %>

			<!--反馈Modal-->
			<%@ include file="/jsp/feedback.jsp" %>
			
		</div>
	</body>

</html>