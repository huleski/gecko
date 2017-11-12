<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>发现</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/html2canvas.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/frontend.js"></script>
		<style type="text/css">
			#topbar a:hover {
				text-decoration: none;
			}
			
			#topbar a:visited {
				text-decoration: none;
			}
			
			#topbar a:active {
				text-decoration: none;
			}
			
			#topbar {
				height: 50px;
				background-color: deepskyblue;
				width: 100%;
				position: fixed;
				top: 0;
				text-align: center;
				z-index: 1;
			}
			
			.topmenu {
				color: #F5F5F5;
			}
			
			#content h2 {
				font-size: 18px;
				font-family: "黑体";
				font-weight: bold;
			}
			
			#content p {
				margin-top: 20px;
				line-height: 2;
			}
			
			#content li {
				margin-top: 20px;
				line-height: 2;
			}
			
			#footer li {
				display: inline;
			}
			
			#footer a {
				color: darkgray;
			}
		</style>
		<style type="text/css">
			.focusedtopic {
				border: 1px solid lightblue;
				border-radius: 15px;
				padding: 2px 10px;
				margin: 5px 5px;
				background-color: white;
				color: steelblue;
			}
			
			.question {
				font-weight: bold;
				margin-bottom: 5px;
			}
			
			.author-name {
				font-weight: bold;
				color: black;
			}
			
			.author-signal {
				color: darkgray;
			}
			
			.thinking {
				background-color: #EFF6FA;
				color: steelblue;
				border: 0;
				border-radius: 3px;
			}
			
			.text {
				margin-left: 55px;
				cursor: pointer;
				margin-bottom: 20px;
			}
			
			.author-info {
				position: absolute;
				left: 55px;
			}
			
			.graphics {
				border-radius: 5px;
				float: left;
				margin-right: 10px;
			}
			
			.word {
				line-height: 1.5;
			}
			
			.showall {
				color: steelblue;
				font-size: 12px;
				padding: 2px;
			}
			
			.text-footer {
				margin-left: 70px;
				margin-bottom: 15px;
				position: relative;
			}
			
			.text-footer a {
				padding: 20px 12px 20px 0;
			}
			
			.hidelabel {
				display: none;
			}
			
			.text-all {
				margin-left: 55px;
				margin-bottom: 20px;
				display: none;
			}
			
			.separator {
				height: 1px;
				background-color: darkgray;
				margin: 15px 0;
			}
			
			.takebackspan {
				cursor: pointer;
				position: absolute;
				right: 0;
				bottom: 0;
				display: none;
			}
			
			#topicground {
				width: 270px;
			}
			
			.topicdiv {
				margin-top: 15px;
				position: relative;
			}
			
			.topicdiv img:hover {
				text-decoration: none;
			}
			
			.topicicon {
				width: 40px;
				height: 40px;
				border-radius: 3px;
			}
			
			.topicfont {
				font-weight: bold;
				margin-left: 15px;
			}
			
			.topicfocus {
				position: absolute;
				right: 0;
				top: 9px
			}
			
			.topicphoto {
				width: 40px;
				height: 40px;
				margin-right: 10px;
			}
			
			#rootDiv a {
				margin-right: 15px;
			}
			
			#askModal {
				line-height: 1.6;
			}
			
			#askModal p {
				margin: 20px 0;
			}
		</style>
		<style type="text/css">
			.commentdiv {
				border: 1px lightgray solid;
				border-radius: 5px;
				margin:auto;
				margin-top: 15px;
				margin-bottom:30px;
				width: 550px;
				display: none;
			}
			.user-comment {
				width: 550px;
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
				width: 75%;
				display: inline;
				margin: 15px 30px 15px 20px;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$(".topmenu").hover(function() {
						$(this).css("color", "white");
					},
					function() {
						$(this).css("color", "#F5F5F5");
					});

				/*返回顶部*/
				$("#gotobtn").click(function() {
					$('body,html').animate({ scrollTop: 0 }, 500);
				});
				
				$(window).scroll( function() {
					if($(this).scrollTop() > 1000) {
						$("#gotobtn").show();
					} else {
						$("#gotobtn").hide();
					}
				});
			});

			/* window.onscroll = function() {
				if(document.body.scrollTop > 600) {
					$("#gotobtn").show();
				}
				if(document.body.scrollTop < 600) {
					$("#gotobtn").hide();
				}
			} */
		</script>
		<script type="text/javascript">
			$(function() {
				$("#findDiv").on("click", ".takebackspan", function() {
					$(this).hide(1);
					var $textBlock = $(this).parents(".text-block");
					$textBlock.find(".text-all").hide(1, function() {
						$textBlock.find(".text").show();
					});
				});

				$("#findDiv").on("click", ".text", function() {
					$(this).hide();
					var $block = $(this).parent(".text-block");
					$block.find(".text-all").show();
					$block.find(".hidelabel").show();
					$block.find(".takebackspan").show();
				});

				$("#findDiv").on("mouseover", ".text-block", function() {
						$(this).find(".hidelabel").show();
				});
				$("#findDiv").on("mouseout", ".text-block", function() {
						$(this).find(".hidelabel").hide();
				});

				$("#findDiv").on("mouseover", ".thinking", function() {
					$(this).css({ color: "#EFF6FA", background: "steelblue" });
				});
				$("#findDiv").on("mouseout", ".thinking", function() {
					$(this).css({ color: "steelblue", background: "#EFF6FA" });
				});
					
				$("#findDiv").on("click", ".text-comment", function() {
					$(this).parents(".text-block").find(".commentdiv").toggle();
				});
				
				$("#findDiv").on("click", ".comment-replybtn", function() {
					if("${user}" == "") {
						$('#loginModal').modal();
					} else {
						$(this).parent(".comment-situation").hide();
						$(this).parent(".comment-situation").next(".comment-reply").show();
					}
				});
				
				$("#findDiv").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
				//检测答案评论输入框是否有值,有才能提交评论
				$("#findDiv").on("keyup", ".commentInput", function() {
					if (this.value != "") {
						$(this).next(".commentSubmitBtn").attr("disabled", false);
					} else {
						$(this).next(".commentSubmitBtn").attr("disabled", true);
					}
				});
				
				//检测评论回复输入框是否有值,有才能提交评论
				$("#findDiv").on("keyup", ".comment-input", function() {
					if (this.value != "") {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", false);
					} else {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", true);
					}
				});
				
				$("#showHotmonth").one("click", function(){
					ajaxLoadHotmonth();
				});
				
				//加载今日最热动态
				ajaxLoadHotday();
			});
			
			//ajax加载评论
			function showComment(aid, curPage, type, obj) {
				var $commentblock = $(obj).parents(".text-block").find(".user-commentblock");
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
						//更新评论数
						var count = $(obj).parents(".text-block").find(".text-comment").text();
						count = count.substring(0,1);
						$(obj).parents(".text-block").find(".text-comment").text(Number(count) + 1 + " 条评论");
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
						//更新评论数
						var count = $(obj).parents(".text-block").find(".text-comment").text();
						count = count.substring(0,1);
						$(obj).parents(".text-block").find(".text-comment").text(Number(count) + 1 + " 条评论");
						showComment(targetId, 1, type, obj);
					});
				}
			}
		
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var hotday_index = 0;
			var hotmonth_index = 0;
			$(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				var hodayLiCls = $("#hodayLi").attr("class");
				if(hodayLiCls == "active") {	//加载今日最热
					if((totalheight >= $(document).height()) && (hotday_index < 3)) {
						ajaxLoadHotday();
					}
				}else{		//加载本月最热
					if((totalheight >= $(document).height()) && (hotmonth_index < 3)) {
						ajaxLoadHotmonth();
					}
				}
				
			});
				
			//ajax加载今日最热
			function ajaxLoadHotday() {
				if(hotday_index >= 0) {
					$("#waitResult").show();
					$.post("${pageContext.request.contextPath}/answerServlet", {"method":"ajaxLoadHotday", "currentPageDay":++hotday_index}, function(result) {
						$("#waitResult").hide();
						if(result != "0") {
							$("#hotdayContent").append(result);
							if(hotday_index == 3) {
								$("#showMoreHotDay").show();
							}
						} else if (hotday_index == 1) {
							hotday_index = -1;
						} else {
							$("#showMoreHotDay").hide();
							$("#hotdayContent").append("<div style='margin-top:30px;'>");
							$("#hotdayContent").append("<h4 style='padding:80px 0;text-align:center;background-color:white'>全部装填完毕,没有更多了</h4></div>");
							hotday_index = -1;
						}
					});
				}
			}
				
			//ajax加载本月最热
			function ajaxLoadHotmonth() {
				if(hotmonth_index >= 0) {
					$("#waitResult2").show();
					$.post("${pageContext.request.contextPath}/answerServlet", {"method":"ajaxLoadHotmonth", "currentPageMonth":++hotmonth_index}, function(result) {
						$("#waitResult2").hide();
						if(result != "0") {
							$("#hotmonthContent").append(result);
							if(hotmonth_index == 3) {
								$("#showMoreHotMonth").show();
							}
						} else if (hotmonth_index == 1) {
							hotmonth_index = -1;
						} else {
							$("#showMoreHotMonth").hide();
							$("#hotmonthContent").append("<div style='margin-top:30px;'>");
							$("#hotmonthContent").append("<h4 style='padding:80px 0;text-align:center;background-color:white'>全部装填完毕,没有更多了</h4></div>");
							hotmonth_index = -1;
						}
					});
				}
			}
		</script>
	</head>

	<body>
		<div class="">
			<!-- 导航栏 -->
			<%@ include file="/jsp/header2.jsp" %>

			<!--话题动态展示-->
			<div style="width: 1000px;margin: auto;margin-top: 80px;">
				<div style="width:650px;float: left;">
					<div style="margin-bottom: 30px;">
						<div style="position: relative;">
							<span style="font-weight: bold;margin-left: 20px;">编辑推荐</span>
							<a href="javascript:void(0)" style="position:absolute;right: 0;">更多推荐</a>
						</div>
						<div style="height: 1px;background-color: darkgray;margin-top: 10px;"></div>
						<c:forEach items="${list }" var="q">
							<div style="position: relative;padding: 12px 0;">
								<a href="${pageContext.request.contextPath}/questionServlet?method=findById&id=${q.id }" style="font-size: 13px;font-weight: bold;">${q.title }</a>
								<span style="color: darkgray;position: absolute;right: 0;">问答</span>
							</div>
							<div style="height: 1px;background-color: lightgray;"></div>
						</c:forEach>
					</div>

					<div>
						<div>
							<ul class="nav nav-tabs">
								<li class="active" id="hodayLi">
									<a href="#hotday" data-toggle="tab">今日最热</a>
								</li>
								<li id="hotmonthLi">
									<a id="showHotmonth" href="#hotmonth" data-toggle="tab">本月最热</a>
								</li>
							</ul>
						</div>
						<div id="findDiv" class="tab-content" style="padding-top: 20px;">
							<!--今日最热-->
							<div class="tab-pane active" id="hotday">
								<div id="hotdayContent"></div>
								<div id="waitResult" style="text-align:center;padding:40px;color:deepskyblue;">
									<i class="fa fa-spinner fa-pulse fa-5x"></i>
									<span class="sr-only">Loading...</span>
								</div>
								<button id="showMoreHotDay" class="btn btn-default btn-block btn-lg" style="margin:50px 0 100px 0;display:none" onclick="ajaxLoadHotday()">查看更多</button>
							</div>

							<!--本周最热-->
							<div class="tab-pane" id="hotmonth">
								<div id="hotmonthContent"></div>
								<div id="waitResult2" style="text-align:center;padding:40px;color:deepskyblue;">
									<i class="fa fa-spinner fa-pulse fa-5x"></i>
									<span class="sr-only">Loading...</span>
								</div>
								<button id="showMoreHotMonth" class="btn btn-default btn-block btn-lg" style="margin:50px 0 100px 0;display:none" onclick="ajaxLoadHotmonth()">查看更多</button>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!--右边div-->
			<div style="float:left;margin-left: 50px;">
				<div id="topicground">
					<div style="position: relative;margin-bottom: 15px;">
						<span style="font-weight: bold;">热门话题</span>
						<a href="#" style="position: absolute;right: 0;">更多话题</a>
					</div>
					<div>
						<div style="position: relative;margin-bottom: 10px;">
							<a href="#"><img class="topicphoto" src="${pageContext.request.contextPath}/img/unicom.jpg" /></a>
							<a href="#" style="position: absolute;top: 0;">中国联通</a>
							<span style="color: darkgray;position: absolute;top: 20px;">5598人关注</span>
						</div>
						<div style="line-height: 1.5;">
							<a href="#">中国联通 780 亿混改方案中有哪些值得关注的信息？百度、阿里巴巴、腾讯、京东的投资会带来哪些影响？</a>
						</div>
						<div class="separator"></div>
					</div>
					<div>
						<div style="position: relative;margin-bottom: 10px;">
							<a href="#"><img class="topicphoto" src="${pageContext.request.contextPath}/img/rightgame.jpg" /></a>
							<a href="#" style="position: absolute;top: 0;">权力的游戏（美剧）</a>
							<span style="color: darkgray;position: absolute;top: 20px;">264853人关注</span>
						</div>
						<div style="line-height: 1.5;">
							<a href="#">如何评价《权力的游戏》第七季第六集 S07E06「Beyond the Wall」？</a>
						</div>
						<div class="separator"></div>
					</div>
					<div>
						<div style="position: relative;margin-bottom: 10px;">
							<a href="#"><img class="topicphoto" src="${pageContext.request.contextPath}/img/dota2.jpg" /></a>
							<a href="#" style="position: absolute;top: 0;">Dota 2 国际邀请赛 TI</a>
							<span style="color: darkgray;position: absolute;top: 20px;">5143人关注</span>
						</div>
						<div style="line-height: 1.5;">
							<a href="#">如何看待ti7之后存在一些wings清流粉无脑吹wings并且贬低其他队伍的现象？</a>
						</div>
						<div class="separator"></div>
					</div>
				</div>
				<div>
					<div style="position: relative;">
						<span style="font-weight: bold;">热门收藏</span>
						<a href="#" style="position: absolute;right: 0;">换一换</a>
					</div>
					<div style="margin-top: 15px;">
						<a href="#">文以载道</a>
						<div style="color: darkgray;margin-top: 3px;">2090 人关注 • 1654 条内容</div>
						<div class="separator"></div>
					</div>
					<div style="margin-top: 15px;">
						<a href="#">为人处世，待人接物</a>
						<div style="color: darkgray;margin-top: 3px;">18145 人关注 • 756 条内容</div>
						<div class="separator"></div>
					</div>
					<div style="margin-top: 15px;">
						<a href="#">捕蛇者说</a>
						<div style="color: darkgray;margin-top: 3px;">778 人关注 • 629 条内容</div>
						<div class="separator"></div>
					</div>
					<div style="margin-top: 15px;">
						<a href="#">大魔法师</a>
						<div style="color: darkgray;margin-top: 3px;">31 人关注 • 70 条内容</div>
						<div class="separator"></div>
					</div>
					<div style="margin-top: 15px;">
						<a href="#">他山之玉，可以攻石。</a>
						<div style="color: darkgray;margin-top: 3px;">3733 人关注 • 3388 条内容</div>
						<div class="separator"></div>
					</div>
				</div>
				<div id="rootDiv">
					<div>
						<a class="footchain" href="#">刘日山</a>
						<a class="footchain" href="#">逼乎指南</a>
						<a class="footchain" href="#">建议反馈</a>
						<a class="footchain" href="#">移动应用</a>
					</div>
					<div>
						<a class="footchain" href="#">加入逼乎</a>
						<a class="footchain" href="contract.html">逼乎协议</a>
						<a class="footchain" href="#">举报投诉</a>
						<a class="footchain" href="#">联系我们</a>
					</div>
					<div>
						<a style="text-decoration: none;"><span class="footlab">© 2017 逼乎</span></a>
					</div>
				</div>
			</div>
		</div>

		<!--回到顶部-->
		<a id="gotobtn" style="position: fixed;bottom: 120px;right: 400px;display: none;">
			<button class="glyphicon glyphicon-arrow-up btn" style="font-size: 20px;padding: 5px 10px;"></button>
		</a>

		<!--footer-->
		<div id="footer" style="position: fixed;bottom: 10px;display: none;">
			<div style="width:75%;height: 1px;background-color: darkgray;margin: auto;"></div>
			<div style="padding-top: 20px;margin: auto;width: 1000px;color: darkgray;">
				<span style="margin-left: 20px;">© 2017 逼乎 </span>
				<span style="margin-left: 500px;">
						<ul style="display: inline;">
							<li><a href="#" target="_blank">刘日山</a></li>
							<li><a href="#" target="_blank">移动应用</a></li>
							<li><a href="#">加入逼乎</a></li>
							<li><a href="#" target="_blank">逼乎协议</a></li>
							<li><a href="#" target="_blank">举报投诉</a></li>
							<li><a href="#">联系我们</a></li>
						</ul>
					</span>
			</div>
		</div>

		<!--反馈Modal-->
		<%@ include file="/jsp/feedback.jsp" %>

		</div>
	</body>

</html>