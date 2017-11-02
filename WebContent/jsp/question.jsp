<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>${question.title }</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.css" rel="stylesheet" />
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
				z-index: 5;
				text-align: center;
			}
			
			.topmenu {
				color: darkgray;
			}
			
			#mainDiv {
				width: 700px;
				boder-radius: 3px;
				float: left;
			}
			#dynamic {
				background-color: white;
				margin-bottom: 40px;
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
			
			.answerblock {
				width: 700px;
				background-color: white;
				padding:0 16px;
				line-height: 1.7;
				position: relative;
			}
			
			.text-author {
				margin-top: 10px;
				margin-bottom: 10px;
			}
			
			.text-author .photo {
				width: 40px;
			}
			
			.text-author .personalmsg {
				position: absolute;
				top: 10px;
				left: 70px;
			}
			
			.text-author .name {
				font-family: "微软雅黑";
				font-weight: bold;
				font-size: 15px;
			}
			
			.text-author .signal {
				font-size: 14px;
			}
			
			.text-content {
				font-size: 15px;
				margin-bottom: 15px;
				cursor: pointer;
			}
			
			.disagreebtn {
				color: deepskyblue;
				font-size: 14px;
				border: deepskyblue 1px solid;
			}
			.agreebtn {
				color: deepskyblue;
				font-size: 14px;
				border: deepskyblue 1px solid;
			}
			
			.answerblock .text-status {
				color: darkgray;
			}
			
			.text-situation {
				margin-left: 25px;
				cursor: pointer;
			}
			
			.answerblock .text-end {
				padding-bottom: 20px;
				position:relative;
			}
			
			.answerblock .text-content .expand {
				font-size: 14px;
			}
			
			.answerblock .keepgap {
				margin-left: 10px;
			}
			.answerblock .edit-time {
				color: darkgray;
				font-size: 14px;
				margin: 10px 0;
			}
		</style>
		<style type="text/css">
			#rightDiv {
				width: 300px;
				height: 300px;
				float: left;
				margin-left: 10px;
			}
			
			#icoDiv {
				width: 300px;
				font-size: 15px;
				background-color: white;
				border-radius: 3px;
			}
			
			#subscribe {
				width: 300px;
				height: 80px;
				margin-top: 10px;
				font-size: 15px;
				background-color: white;
				border-radius: 3px;
				padding-top: 14px;
			}
			
			#navDiv {
				width: 300px;
				height: 260px;
				margin-top: 10px;
				border-radius: 3px;
				padding-top: 5px;
			}
			
			#navDiv .navseparator {
				height: 1px;
				background-color: lightgray;
				margin-bottom: 15px;
			}
			
			#navDiv .navlayer {
				padding-bottom: 15px;
			}
			
			#navDiv .navtitle {
				float: right;
			}
			
			#rightDiv .iconcls {
				position: relative;
				top: 25px;
				margin-left: 20px;
			}
			
			#rightDiv .icobtn {
				background-color: white;
				border: 0;
				width: 70px;
				margin-bottom: 20px;
			}
			
			#rightDiv .icoexplain {
				position: relative;
				top: 8px;
			}
			
			#rootDiv {
				width: 300px;
				margin-top: 10px;
				margin-left: 10px;
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
				left: 175px;
				border-radius: 3px;
			}
			
			#focusquestion {
				border: deepskyblue 1px solid;
				color: white;
				margin-right: 20px;
			}
			#writeanswer {
				border: deepskyblue 1px solid;
				color: deepskyblue;
			}
		</style>
		<style type="text/css">
			#personalnav li {
				margin-right: 10px;
			}
			
			#topdiv {
				margin-top: 50px;
				background-color: white;
				padding-top: 25px;
			}
			
			#questionResume a {
				background-color: aliceblue;
				padding: 8px 13px;
				border-radius: 20px;
			}
			
			#questiontitle {
				font-size: 22px;
				font-weight: bold;
				margin-top: 20px;
			}
			#titlelabelcolumn .titlelabel {
				margin-right: 20px;
			}
			.takeback {
				position: absolute;
				top: 5px;
				right: 5px;
				display: none;
			}
			.text-all{
				display:none;
				font-size: 15px;
			}
			.commentdiv {
				border: 1px lightgray solid;
				border-radius: 5px;
				margin: 15px 0 30px 0;
				width: 670px;
				display: none;
			}
			
			.comment-title {
				padding: 10px 20px;
				font-size: 15px;
				position: relative;
			}
			.separator {
				width: 99%;
				height: 1px;
				background-color: lightgray;
				margin: auto;
			}
			.user-comment {
				width: 670px;
				padding: 12px 20px;
			}
			.comment-user-photo {
				width: 26px;
				height: 26px;
				border-radius: 3px;
			}
			.comment-time {
				position: absolute;
				right: 0;
				color: darkgray;
			}
			.comment-situation a{
				margin-right: 30px;
				cursor: pointer;
			}
			.comment-input {
				margin: 8px 0 15px 0;
			}
			
			.commentInput {
				width: 540px;
				display: inline;
				margin: 15px 30px 15px 20px;
			}
			.report{
				font-size: 16px;
				font-weight: bold;
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

				$(window).scroll( function() {
					if($(this).scrollTop() > $("#topdiv").height() + 50) {
						$("#navbar").slideUp();
						$("#outline").slideDown();
					} else {
						$("#outline").slideUp();
						$("#navbar").slideDown();
					};
					if($(this).scrollTop() > 1000) {
						$("#gotobtn").show();
					} else {
						$("#gotobtn").hide();
					}
				});
				
				/*回到顶部*/
				$("#gotobtn").click(function() {
					 $('body,html').animate({scrollTop:0}, 500);
				});
				
				
				 $("#dynamic").on("mouseover", ".text-content", function() {
					$(this).css("color", "gray");
					});
				$("#dynamic").on("mouseout", ".text-content", function() {
					$(this).css("color", "black");
					}); 

				$("#dynamic").on("hover", ".answerblock", function() {
					$(this).find(".closeblock").toggle();
				});

				$("#dynamic").on("click", ".text-content", function() {
					$(this).hide();
					var $answer = $(this).parent(".answerblock");
					$answer.find(".text-all").show();
					$answer.find(".takeback").show();
				});
				$("#dynamic").on("click", ".takeback", function() {
					$(this).hide();
					var $answerblock = $(this).parents(".answerblock");
					$answerblock.find(".text-all").hide();
					$answerblock.find(".text-content").show();
				});
				$("#dynamic").on("click",".closeblock", function() {
					$(this).parents(".answerblock").hide();
				});
				
				
				$("#dynamic").on("click", ".text-comment", function() {
					$(this).parents(".answerblock").find(".commentdiv").toggle();
					$(this).find(".comment-count").toggle();
					$(this).find(".hidecomment").toggle();
				});
				
				$("#dynamic").on("click", ".comment-replybtn", function() {
					if("${user}" == "") {
						$('#loginModal').modal();
					} else {
						$(this).parent(".comment-situation").hide();
						$(this).parent(".comment-situation").next(".comment-reply").show();
					}
				});
				
				$("#dynamic").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
				//检测答案评论输入框是否有值,有才能提交评论
				$("#dynamic").on("keyup", ".commentInput", function() {
					if (this.value != "") {
						$(this).next(".commentSubmitBtn").attr("disabled", false);
					} else {
						$(this).next(".commentSubmitBtn").attr("disabled", true);
					}
				});
				
				//检测评论回复输入框是否有值,有才能提交评论
				$("#dynamic").on("keyup", ".comment-input", function() {
					if (this.value != "") {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", false);
					} else {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", true);
					}
				});
				
				$(".cancleWatch").hover(function(){
					$(this).text("取消关注");
				}, function() {
					$(this).text("已关注");
				});
				
				$.getJSON("${pageContext.request.contextPath}/questionServlet", {"method":"findRelativeQuestion", "tid":"${question.topic.id}"}, function(result) {
					var content = "";
					$(result).each(function(i, obj){
						content += '<div style="padding:8px 15px;font-size: 14px;">';
						content += '<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id='+obj.id+'">'+obj.title+'</a>';
						content += '<span style="color: darkgray;"> '+obj.answerList.length+' 个回答</span>';
						content += '</div> ';
					});
					$("#relativeQuestion").html(content);
				});
				
				//举报弹出框
				$(".report").popover();
				
			});
			
			//关注问题
			function addWatch(qid){
				if("${user}" == "") {	//若用户未登录,不能关注
					$('#loginModal').modal();
					return;
				}
				$(".cancleWatch").toggle();
				$(".addWatch").toggle();
				$.post("${pageContext.request.contextPath}/questionServlet", {"method":"addWatch", "qid":qid},
					function(result) {
						if(result == 1){
							var count = parseInt($("#questionWatchCount").text());
							$("#questionWatchCount").text(count + 1);
						}
				});
			}
			
			//取消关注问题
			function cancleWatch(qid){
				if("${user}" == "") {	//若用户未登录,不能取消关注
					$('#loginModal').modal();
					return;
				}
				$(".cancleWatch").toggle();
				$(".addWatch").toggle();
				$.post("${pageContext.request.contextPath}/questionServlet", {"method":"cancleWatch", "qid":qid},
					function(result) {
						if(result == 1){
							var count = parseInt($("#questionWatchCount").text());
							$("#questionWatchCount").text(count - 1);
						}
				});
			}
			
			//赞同回答
			function agree(aid, obj) {
				if("${user}" == "") {	//若用户未登录,不能点赞
					$('#loginModal').modal();
					return;
				}
				
				$(obj).toggleClass("btn-default"); 
				$(obj).toggleClass("btn-info");
				$(obj).toggleClass("active");
				var $disagreebtn = $(obj).next(".disagreebtn");
				var cls = $disagreebtn.attr("class");
				if(cls.indexOf("active") != -1) {	
					$disagreebtn.toggleClass("btn-default"); 
					$disagreebtn.toggleClass("btn-info");
					$disagreebtn.toggleClass("active");
				}
				
				var count =  parseInt($(obj).find(".keepgap").text());
				if(($(obj).attr("class").indexOf("active")) != -1) {	//点赞,发送ajax请求
					$.post("${pageContext.request.contextPath}/answerServlet", {"method":"agree", "aid":aid});
					$(obj).find(".keepgap").text(count + 1);
				} else {	//取消点赞,发送ajax请求
					$.post("${pageContext.request.contextPath}/answerServlet", {"method":"disagree", "aid":aid});
					$(obj).find(".keepgap").text(count - 1);
				}
			}
			//反对回答(取消赞同)
			function disagree(aid, obj) {
				if("${user}" == "") {	//若用户未登录,不能点赞
					$('#loginModal').modal();
					return;
				}
				
				$(obj).toggleClass("btn-default"); 
				$(obj).toggleClass("btn-info");
				$(obj).toggleClass("active");
				var $agreebtn = $(obj).prev(".agreebtn");
				var count =  parseInt($agreebtn.find(".keepgap").text());
				var cls = $agreebtn.attr("class");
				if(cls.indexOf("active") != -1) {
					$agreebtn.toggleClass("btn-default"); 
					$agreebtn.toggleClass("btn-info");
					$agreebtn.toggleClass("active");
					$agreebtn.find(".keepgap").text(count - 1);
					$.post("${pageContext.request.contextPath}/answerServlet", {"method":"disagree", "aid":aid});
				} 
			}
			
			//赞同评论
			function agreeComment(cid, obj) {
				if("${user}" == "") {
					$('#loginModal').modal();
				} else {
					var count = parseInt($(obj).find("span").text());
					$(obj).find("i").toggle();
					
					var $agree = $(obj).find(".fa-thumbs-up");
					if($agree.css("display") != "none") {
						$(obj).find("span").text(count + 1);
						$.post("${pageContext.request.contextPath}/commentServlet", {"method":"agree", "cid":cid});
					} else {
						$(obj).find("span").text(count - 1);
						$.post("${pageContext.request.contextPath}/commentServlet", {"method":"disagree", "cid":cid});
					}
				}
			}
			
			//点击回答
			function writeAnswer(){
				if("${user}" == "") {
					$('#loginModal').modal();
				} else {
					$("#answereditordiv").show();
					$('body,html').animate({scrollTop:$(window).height() * 2 + $(document).height() }, 200); 
				}
			}
			
			//ajax加载评论
			function showComment(aid, currentPage, type, obj) {
				var $commentblock = $(obj).parents(".answerblock").find(".user-commentblock");
				$.post("${pageContext.request.contextPath}/commentServlet", {"method":"ajaxLoad","targetId":aid, "currentPage": currentPage, "type":type}, function(result) {
					$commentblock.html(result);
				}, "text");
			}
			
			//ajax提交答案评论
			function submitAnswerComment(obj, pid, targetId) {
				if("${user}" == "") {
					$('#loginModal').modal();
				} else {
					var content = $(obj).prev(".commentInput").val();
					$.post("${pageContext.request.contextPath}/commentServlet", {"method":"add", "pid":pid, "type":1, "targetId": targetId, "content":content},
						function(result) {	
						$(obj).prev(".commentInput").val("");
						$(obj).attr("disabled", true);
						showComment(targetId, 1, 1, obj);
					});
				}
			}
			
			//ajax提交评论回复
			function submitCommentReply(obj, pid, targetId, type) {
				if("${user}" == "") {
					$('#loginModal').modal();
				} else {
					var content = $(obj).parent(".comment-reply-opr").prev(".comment-input").val();			
					$.post("${pageContext.request.contextPath}/commentServlet", {"method":"add", "pid":pid, "type":type, "targetId": targetId, "content":content},
						function(result) {	
						showComment(targetId, 1, type, obj);
					});
				}
			}
			
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var answer_index = 0;
			 $(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				if((totalheight >= $(document).height()) && answer_index >= 0 && answer_index < 3) {
					ajaxLoadAnswer();
				}
			}); 
			
			function ajaxLoadAnswer() {
				if(answer_index >= 0) {
					$.post("${pageContext.request.contextPath}/answerServlet", {"method":"ajaxLoad", "qid":"${question.id}", "currentPage": ++answer_index},
							function(result) {
								if(result != "0") {
									$("#noAnswer").hide();
									$("#dynamic").append(result);
									$(".report").popover();
									
									if(answer_index == 3) {
										$("#showMoreAnswer").show();
									}
								} else if (answer_index == 1) {
									answer_index = -1;
								} else {
									$("#showMoreAnswer").hide();
									$("#dynamic").append("<div style='height:30px; background-color:#F3F3F3;'/>");
									$("#dynamic").append("<h4 style='padding:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
									answer_index = -1;
								}
							}, "text");
				}
			}
			
			/*格式化日期*/
			Date.prototype.format = function (fmt) { //author: meizz 
			    var o = {
			        "M+": this.getMonth() + 1, //月份 
			        "d+": this.getDate(), //日 
			        "h+": this.getHours(), //小时 
			        "m+": this.getMinutes(), //分 
			        "s+": this.getSeconds(), //秒 
			        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			        "S": this.getMilliseconds() //毫秒 
			    };
			    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			    for (var k in o)
			    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
			}
			
		</script>
	</head>
	<body>
		<!--提问模态框-->
 		<%@ include file="/jsp/askmodal.jsp" %>
 		
		<div class="">
			<!--导航栏-->
			<div id="topbar">
				<div id="navbar" style="position: relative;margin: auto;width: 1010px;">
					<span style="font-size: 15px;">
						<a href="${pageContext.request.contextPath}/jsp/index.jsp" style="font-size: 32px; color: deepskyblue;font-family: '黑体';">逼乎</a>
						<span style="position: relative;top: -5px;">
							<a class="topmenu" href="${pageContext.request.contextPath}/jsp/index.jsp" style="margin-left: 30px;">首页</a>
							<a class="topmenu" onclick="findWatchedTopic()" href="javascript:void(0)" style="margin-left: 30px;">话题</a>
							<a class="topmenu" href="${pageContext.request.contextPath}/jsp/find.jsp" style="margin-left: 30px;">发现</a>
							<form action="${pageContext.request.contextPath}/questionServlet" method="post" style="position: relative;display: inline;">
								<div class="input-group" style="width:350px;position: absolute;top:-8px;left: 20px;">
							      	<input type="text" class="form-control" placeholder="搜索你感兴趣的内容...">
							      	<span class="input-group-btn">
								        <button class="btn btn-default" type="button" style="height:34px;color:lightgray">
											<i class="fa fa-search  fa-lg"></i>
										</button>
							      </span>
							    </div>
							</form>
							<button type="button" class="btn btn-info" onclick="writeQuestioin()" style="width:60px;font-size: 14px;margin-left: 390px;position:relative;top:-2px">提问</button>
							<c:if test="${empty user}">	
								<button type="button" class="btn btn-info" style="width:60px;font-size: 14px;margin-left: 120px;" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp'">登录</button>
								<button type="button" class="btn btn-default" style="font-size: 14px;margin-left: 20px;color:deepskyblue;border:1px deepskyblue solid;" onclick="location.href='${pageContext.request.contextPath}/jsp/login.jsp?register=1'">加入逼乎</button>
							</c:if>
							<c:if test="${not empty user}">	
								<span style="margin-left: 120px;position:relative;top:5px">
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
				</div>
				<!--问题标题 导航栏 -->	
				<div id="outline" style="position: relative;margin: auto;width: 1010px;height:50px;display: none;">
					<div style="position: absolute;top:10px;text-align: left;font-weight: bold;font-size: 22px;width: 700px;">
						${fn:substring(question.title, 0, 30) }...
					</div>
					<span style="position: absolute;top:8px;right: 20px;">
						<c:if test="${question.watched != 1 }">
							<button type="button" class="btn btn-info addWatch" onclick="addWatch(${question.id})">关注问题</button>
							<button type="button" class="btn btn-info cancleWatch" style="display:none" onclick="cancleWatch(${question.id})">已关注</button>
						</c:if>
						<c:if test="${question.watched == 1 }">
							<button type="button" class="btn btn-info addWatch" style="display:none" onclick="addWatch(${question.id})">关注问题</button>
							<button type="button" class="btn btn-info cancleWatch" onclick="cancleWatch(${question.id})">已关注</button>
						</c:if>
						<button type="button" class="btn btn-default" id="writeanswer" onclick="writeAnswer()">
							<span class="glyphicon glyphicon-pencil"></span>
							写回答
						</button>
					</span>
				</div>
				<div style="height: 1px;background-color: lightgray;"></div>
			</div>

			<!--问题div-->
			<div id="topdiv">
				<div style="width: 1000px;position: relative;margin:auto;">
					<div style="width:700px;">
						<div id="questionResume" style="margin-right: 50px;">
							<a href="${pageContext.request.contextPath }/topicServlet?method=findById&id=${question.topic.id}">${question.topic.name }</a>
						</div>
						<div id="questiontitle">${question.title }</div>
						<div style="font-size: 15px;line-height:1.7;margin-top: 10px;">
							${question.content }
							<a href="#"></a></div>
						<div id="titlelabelcolumn" style="margin: 15px 0;padding-bottom: 20px;">
							<a href="#" class="titlelabel">
								<span class="glyphicon glyphicon-comment"></span>
								<span>${fn:length(question.commentList)} 条评论</span>
							</a>
							<a href="#" class="titlelabel">
								<span class="glyphicon glyphicon-share-alt"></span>
								<span>分享</span>
							</a>
							<a href="#" class="titlelabel">
								<span class="glyphicon glyphicon-star"></span>
								<span>邀请回答</span>
							</a>
							<a href="#" class="titlelabel">
								<span class="glyphicon glyphicon-flag"></span>
								<span>举报</span>
							</a>
							<a href="#" class="titlelabel" style="font-size: 16px;font-weight: bold;">
									···
							</a>
						</div>
					</div>
					<div style="position: absolute;top:0;right: 0;width: 220px;margin-left: 70px;">
						<div style="float: left;width: 100px;text-align: center;">
							<div style="color: darkgray;">关注者</div>
							<div style="font-size: 18px;" id="questionWatchCount">${question.watchCount}</div>
						</div>
						<div style="float: left;width: 100px;text-align: center;">
							<div style="color: darkgray;">被浏览</div>
							<div style="font-size: 18px;">${question.lookCount}</div>
						</div>
					</div>
					<div style="position: absolute;bottom: 15px;right: 20px;">
						<c:if test="${question.watched != 1 }">
							<button type="button" class="btn btn-info addWatch" onclick="addWatch(${question.id})">关注问题</button>
							<button type="button" class="btn btn-info cancleWatch" style="display:none" onclick="cancleWatch(${question.id})">已关注</button>
						</c:if>
						<c:if test="${question.watched == 1 }">
							<button type="button" class="btn btn-info addWatch" style="display:none" onclick="addWatch(${question.id})">关注问题</button>
							<button type="button" class="btn btn-info cancleWatch" onclick="cancleWatch(${question.id})">已关注</button>
						</c:if>
						<button type="button" class="btn btn-default" id="writeanswer" onclick="writeAnswer()">
							<span class="glyphicon glyphicon-pencil"></span>
							写回答
						</button>
					</div>
				</div>
			</div>


			<div style="width: 1020px;margin: auto;margin-top: 10px;">
				<!--回答总div-->
				<div id="mainDiv">
					<div id="dynamic">
						<div style="padding: 12px 0 15px 20px;position: relative;">
							<span style="font-weight: bold;font-size: 15px;">${fn:length(question.answerList)} 个回答</span>
							<span style="position: absolute;right: 20px;">默认排序</span>
						</div>
						
						<!-- 没有回答 -->
						<div id="noAnswer" style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/noanswer.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								还没有回答，快来
								<a href="javascript:void(0)" onclick="writeAnswer()">抢沙发</a>吧!
							</div>
						</div>
							
							
						<!--用户个人回答板块-->
						<script type="text/javascript">
							ajaxLoadAnswer();
						</script>
					</div>
					
					<!-- 查看更多回答 -->
					<button id="showMoreAnswer" class="btn btn-default btn-block btn-lg" style="margin-bottom:100px;display:none" onclick="ajaxLoadAnswer()">查看更多回答</button>
				
					<!--写答案-->
					<div id="answereditordiv" style="margin-bottom:100px;position:relative;display:none">
						<form id="answerForm" action="${pageContext.request.contextPath}/answerServlet" method="post">
							<input type="hidden" name="method" value="add"/>
							<input type="hidden" name="qid" value="${question.id}"/>
							<input id="hidePureContent" type="hidden" name="pureContent" />
							<script id="editorId" name="content" type="text/plain" style="width:700px;height:200px;">写回答...</script>
							<div style="margin-top:10px">
								<label class="checkbox-inline"><input type="checkbox" name="anonymous" value="1">匿名提交</label>
								<button class="btn btn-info" style="position:absolute;right:0;" type="button" onclick="submitAnswer()">提交回答</button>
							</div>
						</form>
					</div>
					<script type="text/javascript" >
						var answerUE = UE.getEditor('editorId', {
					        autoClearinitialContent:true, //focus时自动清空初始化时的内容
					        wordCount:false, //关闭字数统计
					        elementPathEnabled:false,//关闭elementPath
					        saveInterval:30000,		//自动保存
					        toolbars: [
							           	['bold', 'italic','horizontal', 'paragraph', 'justifycenter', '|', 'blockquote','insertorderedlist','insertunorderedlist', 
							           	'link','removeformat', '|','simpleupload', 'insertimage', 'insertvideo', 'music', 'fullscreen' ]
							       	  ]
					    });
						
						function submitAnswer() {
							$("#hidePureContent").val(answerUE.getContentTxt());
							$("#answerForm").submit();
						}
					</script>
				</div>
				
				<!--右侧导航栏div-->
				<div id="rightDiv">
				
					<div id="icoDiv">
						<div style="font-weight: bold;padding: 13px;">相关问题</div>
						<div style="background-color: #F0F2F7;height: 1px;"></div>
						<div id="relativeQuestion"></div>
					</div>
					
					<div id="rootDiv">
						<div>
							<a class="footchain" href="#">刘日山</a>
							<a class="footchain" href="#">逼乎指南</a>
							<a class="footchain" href="#">逼乎协议</a>
							<a class="footchain" href="#">应用工作</a>
						</div>
						<div>
							<a class="footchain" href="#">侵权举报</a>
							<a class="footchain" href="#">网上有害信息举报专区</a>
						</div>
						<div class="footlab">违法和不良信息举报：010-82716601</div>
						<div>
							<a class="footchain" href="#">联系我们</a>
							<span class="footlab">© 2017 逼乎</span>
						</div>
					</div>
					
				</div>
			</div>
		</div>
			
		<!--回到顶部-->
		<div id="gotobtn" style="position: fixed;right: 30px;bottom: 80px;display:none" >
			<button class="glyphicon glyphicon-arrow-up btn btn-default" style="font-size: 20px;padding: 5px 10px;" ></button>
		</div>
		
	</body>

</html>