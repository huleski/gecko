<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>首页</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
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
				background-color: white;
				width: 100%;
				position: fixed;
				top: 0;
				z-index: 1;
				text-align: center;
			}
			
			.topmenu {
				color: lightgray;
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
				margin: 10px 0;
				background-color: white;
				padding: 16px;
				border-radius: 3px;
				line-height: 1.7;
			}
			
			.closeblock {
				font-size: 15px;
				display: none;
			}
			
			.text-dynamic {
				color: gray;
				font-size: 15px;
			}
			
			.text-dynamic-a {
				color:gray;
			}
			
			.text-author {
				margin-top: 10px;
				margin-bottom: 10px;
			}
			
			.text-author .photo {
				width: 25px;
			}
			
			.text-author .name {
				font-family: "微软雅黑";
				font-weight: bold;
				font-size: 15px;
				color: black;
			}
			
			.text-author .signal {
				font-size: 14px;
			}
			
			.text-title {
				font-size: 18px;
				font-weight: bold;
				margin-bottom: 10px;
			}
			
			.text-title-a {
				color: black;
			}
			
			.text-content {
				font-size: 15px;
				margin-bottom: 15px;
				cursor: pointer;
			}
			
			.text-all {
				font-size: 15px;
				display: none;
			}
			
			.opinion {
				color: deepskyblue;
				font-size: 14px;
			}
			
			.text-end {
				position: relative;
			}
			
			.takeback {
				position: absolute;
				top: 5px;
				right: 5px;
				display: none;
			}
			
			.text-situation {
				margin-left: 25px;
				cursor: pointer;
			}
			
			.answerblock .text-content .expand {
				font-size: 14px;
			}
			
			.answerblock .keepgap {
				margin-left: 10px;
			}
		</style>
		<style type="text/css">
			#centerDiv {
				width: 700px;
				height: 600px;
				float: left;
			}
			
			#rightDiv {
				float: left;
				width: 300px;
				height: 300px;
				margin-top: 10px;
				margin-left: 10px;
			}
			
			#icoDiv {
				width: 300px;
				height: 175px;
				background-color: white;
				border-radius: 3px;
			}
			
			#navDiv {
				width: 300px;
				height: 260px;
				background-color: white;
				margin-top: 10px;
				border-radius: 3px;
				padding-top: 5px;
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
				line-height: 1.9;
			}
			
			#rootDiv .footchain {
				margin-right: 10px;
			}
			
			#rootDiv .footlab {
				color: #337AB7;
			}
			
			.report {
				font-size: 16px;
				font-weight: bold;
				cursor: pointer;
			}
			
			.commentdiv {
				border: 1px lightgray solid;
				border-radius: 5px;
				margin-top: 15px;
				width: 670px;
				display: none;
			}
			
			.comment-title {
				padding: 10px 20px;
				font-size: 15px;
				position: relative;
			}
			.separator {
				width: 95%;
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
				color: gray;
			}
			.comment-input {
				margin: 8px 0 15px 0;
			}
			
			.commentInput {
				width: 75%;
				display: inline;
				margin: 15px 30px 15px 20px;
			}
			
			.commentAnswer {
				width: 540px;
				display: inline;
				margin: 15px 30px 15px 20px;
			}
		</style>

		<script type="text/javascript">
			$(function() {
				$(".topmenu").hover(function() {
					$(this).css("color", "gray");
				},
				function() {
					$(this).css("color", "lightgray");
				});
				
				
				$(window).scroll( function() {
					if($(this).scrollTop() > 1000) {
						$("#gotobtn").show();
					} else {
						$("#gotobtn").hide();
					}
				});
				/*回到顶部*/
				$("#gotobtn").click(function() {
					 $('body,html').animate({scrollTop:0}, 200);
				});

			});
		</script>
		<script type="text/javascript">
			$(function() {
				$("#alive").hover(function() {
					$("#live").css("color", "#FFCF00");
				}, function() {
					$("#live").css("color", "#337AB7");
				});
				$("#abookstore").hover(function() {
					$("#bookstore").css("color", "#43D480");
				}, function() {
					$("#bookstore").css("color", "#337AB7");
				});
				$("#acircletable").hover(function() {
					$("#circletable").css("color", "deepskyblue");
				}, function() {
					$("#circletable").css("color", "#337AB7");
				});
				$("#acolumn").hover(function() {
					$("#column").css("color", "dodgerblue");
				}, function() {
					$("#column").css("color", "#337AB7");
				});
				$("#apay").hover(function() {
					$("#pay").css("color", "blueviolet");
				}, function() {
					$("#pay").css("color", "#337AB7");
				});

				
				$("#browseDiv").on("mouseover", ".text-content", function() {
					$(this).css("color", "gray");
					});
				$("#browseDiv").on("mouseout", ".text-content", function() {
					$(this).css("color", "black");
					}); 

				$("#browseDiv").on("hover", ".answerblock", function() {
					$(this).find(".closeblock").toggle();
				});

				$("#browseDiv").on("click", ".text-content", function() {
					$(this).hide();
					var $answer = $(this).parent(".answerblock");
					$answer.find(".text-all").show();
					$answer.find(".takeback").show();
				});
				$("#browseDiv").on("click", ".takeback", function() {
					$(this).hide();
					var $answerblock = $(this).parents(".answerblock");
					$answerblock.find(".text-all").hide();
					$answerblock.find(".text-content").show();
				});
				$("#browseDiv").on("click",".closeblock", function() {
					$(this).parents(".answerblock").hide();
				});
				
				$("#browseDiv").on("click", ".text-comment", function() {
					$(this).parents(".answerblock").find(".commentdiv").toggle();
					$(this).find(".comment-count").toggle();
					$(this).find(".hidecomment").toggle();
				});
				
				$("#browseDiv").on("click", ".comment-replybtn", function() {
					if("${user}" == "") {
						$('#loginModal').modal();
					} else {
						$(this).parent(".comment-situation").hide();
						$(this).parent(".comment-situation").next(".comment-reply").show();
					}
				});
				
				$("#browseDiv").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
				
				//举报弹出框
				$(".report").popover();
				
				//首次加载内容
				ajaxLoadDynamic();
			});

			
		
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var htm_index = 0;
			$(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				if((totalheight >= $(document).height()) && (htm_index < 4)) {
					ajaxLoadDynamic();
				}
			});
				
			//ajax加载浏览动态
			function ajaxLoadDynamic() {
				if(htm_index >= 0) {
					$.post("${pageContext.request.contextPath}/indexServlet", {"method":"ajaxLoad", "currentPage":++htm_index},
						function(result) {
							if(result != "0") {
								$("#browseDiv").append(result);
								$(".report").popover();
								
								if(htm_index == 3) {
									$("#showMoreAnswer").show();
								}
							} else if (htm_index == 1) {
								htm_index = -1;
							} else {
								$("#showMoreAnswer").hide();
								$("#browseDiv").append("<div style='margin-top:30px;'>");
								$("#browseDiv").append("<h4 style='padding:80px 0;text-align:center;background-color:white'>全部装填完毕,没有更多了</h4></div>");
								htm_index = -1;
							}
						});
				}
			}
			
			
			//ajax加载评论
			function showComment(aid, curPage, type, obj) {
				var $commentblock = $(obj).parents(".answerblock").find(".user-commentblock");
				$.post("${pageContext.request.contextPath}/commentServlet", {"method":"ajaxLoad","targetId":aid, "currentPage": curPage, "type":type}, function(result) {
					$commentblock.html(result);
				}); 
			}

			//ajax提交答案评论
			function submitAnswerComment(obj, pid, targetId, type) {
				if("${user}" == "") {
					$('#loginModal').modal();
				} else {
					var content = $(obj).prev(".commentInput").val();
					$.post("${pageContext.request.contextPath}/commentServlet", {"method":"add", "pid":pid, "type":type, "targetId": targetId, "content":content},
						function(result) {	
						$(obj).prev(".commentInput").val("");
						$(obj).attr("disabled", true);
						showComment(targetId, 1, type, obj);
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
			
			$(function(){
				//检测答案评论输入框是否有值,有才能提交评论
				$("#browseDiv").on("keyup", ".commentInput", function() {
					if (this.value != "") {
						$(this).next(".commentSubmitBtn").attr("disabled", false);
					} else {
						$(this).next(".commentSubmitBtn").attr("disabled", true);
					}
				});
				
				//检测评论回复输入框是否有值,有才能提交评论
				$("#browseDiv").on("keyup", ".comment-input", function() {
					if (this.value != "") {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", false);
					} else {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", true);
					}
				});
			});

		</script>
	</head>

	<body>
		<div class="">
			<!-- 引入导航栏 -->
			<%@ include file="/jsp/header1.jsp" %>

			<div style="width: 1020px;margin: auto;margin-top: 50px;">
				<!--浏览内容div-->
				<div id="centerDiv">
					<c:if test="${not empty user }">
						<div class="answerblock" style="font-size: 16px;">
							<a href="javascript:writeQuestioin()">
								<span class="glyphicon glyphicon-question-sign"></span> 提问
							</a>
							<a href="${pageContext.request.contextPath}/jsp/answer.jsp" style="margin-left: 40px;">
								<span class="glyphicon glyphicon-file"></span> 回答
							</a>
							<a href="${pageContext.request.contextPath}/jsp/articleedit.jsp" style="margin-left: 40px;">
								<span class="glyphicon glyphicon-pencil"></span> 写文章
							</a>
							<a href="#" style="margin-left: 360px;">
								草稿
							</a>
						</div>
					</c:if>
					<div id="browseDiv"></div>
					<!-- 查看更多回答 -->
					<button id="showMoreAnswer" class="btn btn-default btn-block btn-lg" style="margin:50px 0 100px 0;display:none" onclick="ajaxLoadDynamic()">查看更多</button>	
				</div>

				<!--右侧导航栏div-->
				<div id="rightDiv">
					<div id="icoDiv">
						<a id="alive" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-flash" style="color: #FFCF00;font-size: 25px;"></span><br />
						<span class="icoexplain" id="live">Live</span>
						</button>
						</a>
						<a id="abookstore" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-book" style="color: #43D480;font-size: 25px;"></span><br />
						<span class="icoexplain" id="bookstore">书店</span>
						</button>
						</a>
						<a id="acircletable" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-asterisk" style="color: deepskyblue;font-size: 25px;"></span><br />
						<span class="icoexplain" id="circletable">圆桌</span>
						</button>
						</a>
						<a id="acolumn" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-pencil" style="color: dodgerblue;font-size: 25px;"></span><br />
						<span class="icoexplain" id="column">专栏</span>
						</button>
						</a>
						<a id="apay" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-usd" style="color: blueviolet;font-size: 25px;"></span><br />
						<span class="icoexplain" id="pay">付费咨询</span>
						</button>
						</a>
					</div>
					<div id="navDiv">
						<ul class="nav nav-pills nav-stacked">
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-star" style="margin-right: 10px;"></span>
									<span> 我的收藏</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-exclamation-sign"><span/>
 								<span>
 									我关注的问题
 									<button class="btn btn-xs" style="color: white;position: relative;right: -120px;">58</button>
 								</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-glass"><span/>
 								<span>我的邀请</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-cutlery"><span/>
 								<span>社区服务中心</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-bookmark"><span/>
 								<span>版权服务中心</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-transfer"><span/>
 								<span>公共编辑动态</span>
								</a>
							</li>
						</ul>
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

			<!--回到顶部-->
			<a id="gotobtn" style="position: fixed;bottom: 120px;right: 400px;display: none;">
				<button class="glyphicon glyphicon-arrow-up btn" style="font-size: 20px;padding: 5px 10px;"></button>
			</a>
			
			<!-- 反馈模态框 -->
			<%@ include file="/jsp/feedback.jsp" %>
		</div>
	</body>

</html>