<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.css" rel="stylesheet" />
<style type="text/css">
	#searchDiv {
		width: 600px;
		border-radius:5px;
		background-color:white;
		position: fixed;
		margin-left: 290px;
		z-index: 8;
		top:43px;
		display:none;
		border: lightgray thin 1px;
		box-shadow: 0px 1px 1px 1px #888888;
		
	}
	
	#searchDiv div{
		text-align: left;
		padding: 5px 8px;
	}
</style>
<script type="text/javascript">
	var timer;

	$(function(){
		$("#search-input").bind({
			blur: function(){
				setTimeout(function(){
					$("#searchDiv").hide();
				}, 200);
			},
			keyup: function(){
				//设置定时器,延迟keyup触发事件
				clearTimeout(timer);
                timer = setTimeout(function() {
					$("#nosearch").hide();
					var keywords = $.trim($("#search-input").val());
					if(keywords != ""){//搜索输入框不为空
						$("#searchResult").empty();
						$.getJSON("${pageContext.request.contextPath}/questionServlet", {method:"findAssociated","keywords":keywords}, function(result){
							$("#searchDiv").show();
							if(result != "0"){
								$(result).each(function(i, obj){
									$("#searchResult").append('<div><a href="${pageContext.request.contextPath}/questionServlet?method=findById&id='+obj.id+'">'+obj.title+'</a></div>');
								});
							}else{
								$("#nosearch").show();
							}
							
						});
					}
                }, 1000);
			}
		})
		
	});
</script>
</head>
<body>
	<!-- 提问模态框(包含登录模态框) -->
	<%@ include file="/jsp/askmodal.jsp" %>

	<!--导航栏-->
	<div id="topbar">
		<div style="position: relative;margin: auto;width: 1000px;">
			<span style="font-size: 15px;">
				<a href="${pageContext.request.contextPath}/jsp/index.jsp" style="font-size: 32px; color: deepskyblue;font-family: '黑体';">逼乎</a>
				<span style="position: relative;top: -5px;">
					<a class="topmenu" href="${pageContext.request.contextPath}/jsp/index.jsp" style="margin-left: 30px;">首页</a>
					<a class="topmenu" onclick="findWatchedTopic()" href="javascript:void(0)" style="margin-left: 30px;">话题</a>
					<a class="topmenu" href="${pageContext.request.contextPath}/indexServlet?method=find" style="margin-left: 30px;">发现</a>
					<form action="${pageContext.request.contextPath}/indexServlet" method="post" style="position: relative;display: inline;width:360px;">
						<input type="hidden" name="method" value="searchUI" />
						<div class="input-group" style="width:350px;position: absolute;top:-8px;left: 20px;">
					    	<input type="text" id="search-input" name="keywords" autocomplete="off" class="form-control" required placeholder="搜索你感兴趣的内容...">
					    	<span class="input-group-btn">
						        <button class="btn btn-default" type="submit" style="height:34px;color:lightgray">
									<i class="fa fa-search  fa-lg"></i>
								</button>
					      	</span>
					    </div>
					</form>
					<button type="button" class="btn btn-info" onclick="writeQuestioin()" style="width:60px;font-size: 14px;margin-left: 390px;position:relative;top:-2px">提问</button>
					<c:if test="${empty user}">	
						<button type="button" class="btn btn-info" style="width:60px;font-size: 14px;margin-left: 100px;" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp'">登录</button>
						<button type="button" class="btn btn-default" style="font-size: 14px;margin-left: 20px;color:deepskyblue;border:1px deepskyblue solid;" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp?register=1'">加入逼乎</button>
					</c:if>
					<c:if test="${not empty user}">
						<span style="margin-left: 100px;position:relative;top:5px">
							<a href="#">
								<span class="glyphicon glyphicon-bell topmenu" style="font-size: 22px;color: lightgray;"></span>
								<span class="markcount">42</span>
							</a>
							<a href="#" style="margin-left: 30px;">
								<span class="glyphicon glyphicon-comment topmenu" style="font-size: 22px;color: lightgray;"></span>
							</a>
							<span class="btn-group">
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
						</span>
					</c:if>
				</span>
			</span>
			<!-- 搜索结果 -->
			<div id="searchDiv">
				<div id="nosearch">
					没有搜索到相关的结果
				</div>
				<div id="searchResult"></div>
			</div>	
		</div>
		<div style="height: 1px;background-color: lightgray;"></div>
	</div>
</body>
</html>