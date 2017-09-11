<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>写文章</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#addpicdiv").hover(function() {
					$("#addpic").slideToggle(50);
				});
			});
		</script>
	</head>
	<body>
		
		<!--页面顶部导航栏-->
		<nav class="navbar navbar-default" role="navigation">
		  <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header">
		    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
		      <span class="sr-only">Toggle navigation</span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		    </button>
		    <a class="navbar-brand" href="index.html" style="font-size: 30px;">逼</a>
		  </div>
		
		  <!-- Collect the nav links, forms, and other content for toggling -->
		  <div class="collapse navbar-collapse navbar-ex1-collapse">
		  	
		    <ul class="nav navbar-nav navbar-brand" style="margin-left: 400px;">
		      <li style="font-size: 17px;font-weight: bold;color: black;">写文章</li>
		      <li style="font-size: 16px;margin-left: 20px;">草稿自动保存</li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		      <li><button class="btn btn-default" href="#" style="margin-top: 8px;">发布</button></li>
		      <li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> ○○○ </a>
		        <ul class="dropdown-menu nav nav-pills nav-stacked">
		          <li><a href="#">草稿</a></li>
		          <li><a href="#">我的文章</a></li>
		          <li><a href="#">专栏.发现 </a></li>
		        </ul>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<div style="margin: auto;width: 660px;">
			<!--点击上传图片-->
			<div id="addpicdiv" style="background-color: #F2F2F2;height: 190px;font-size: 30px;color: darkgray;text-align: center;padding-top: 70px;cursor: pointer;" title="未选择任何文件">
				<span class="glyphicon glyphicon-camera"></span>
				<div id="addpic" style="text-align: center;font-size: 17px;display: none;">添加题图</div>
			</div>
			<div style="margin: 10px 0;">
				<input class="form-control input-lg" type="text" placeholder="请输入标题">
			</div>
			
			<!--写答案-->
			<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
			<div id="editordiv" style="margin-bottom: 90px;">
				<script id="editor" type="text/plain" style="width:660px;height:200px;"></script>
			</div>
			<script src="${pageContext.request.contextPath}/js/editorInstance.js" type="text/javascript"></script>
		</div>
		
		
		<!--反馈Modal-->
		<%@ include file="/jsp/feedback.jsp" %>

	</body>
</html>
