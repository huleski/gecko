<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>已关注话题</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.min.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<style type="text/css">
			a:hover {
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
			#askModal {
				line-height: 1.6;
			}
			#askModal p {
				margin: 20px 0;
			}
		</style>
		<style type="text/css">
			.focusedtopic {
				border: 1px solid lightblue;
				border-radius: 15px;
				padding: 2px 10px;
				margin: 5px 5px;
				background-color: white;
				color: deepskyblue;
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
				color: deepskyblue;
				border: 0;
				border-radius: 3px;
			}
			
			.text {
				margin-left: 55px;
				cursor: pointer;
				margin-bottom: 20px;
				position:relative;
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
				font-size: 12px;
				padding: 2px;
				color:royalblue;
			}
			
			.text-footer {
				margin: 20px 0 20px 55px;
				position: relative;
			}
			
			.text-footer a {
				padding-right: 12px;
			}
			
			.hidelabel {
				display: none;
			}
			
			.text-all {
				margin-left: 55px;
				display: none;
			}
			
			.separator {
				height: 1px;
				background-color: darkgray;
				margin-bottom: 15px;
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
				height: 140px;
				background-color: aliceblue;
				border: 1px solid lightblue;
				border-radius: 5px;
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
		</style>

		<script type="text/javascript">
			$(function() {
				$("#topicAnswer").on("click", ".takebackspan", function() {
					$(this).hide(1);
					var $textBlock = $(this).parents(".text-block");
					$textBlock.find(".text-all").hide(1, function() {
						$textBlock.find(".text").show();
					});
				});

				$("#topicAnswer").on("click", ".text", function() {
					$(this).hide();
					var $block = $(this).parent(".text-block");
					$block.find(".text-all").show();
					$block.find(".hidelabel").show();
					$block.find(".takebackspan").show();
				});

				$("#topicAnswer").on("mouseover", ".text-block", function() {
						$(this).find(".hidelabel").show();
				});
				$("#topicAnswer").on("mouseout", ".text-block", function() {
						$(this).find(".hidelabel").hide();
				});

				$("#topicAnswer").on("mouseover", ".thinking", function() {
					$(this).css({ color: "#EFF6FA", background: "deepskyblue" });
				});
				$("#topicAnswer").on("mouseout", ".thinking", function() {
					$(this).css({ color: "deepskyblue", background: "#EFF6FA" });
				});
					

				$(".topmenu").hover(function() {
					$(this).css("color", "white");
				},
				function() {
					$(this).css("color", "#F5F5F5");
				});

				$(".focusedtopic").bind({
					click: function() {
						$(this).css({ color: "white", background: "deepskyblue" });
						var $btns = $(".focusedtopic:disabled");
						$btns.prop("disabled", false)
						$btns.mouseout();
						$(this).prop("disabled", true);
					},
					mouseover: function() {
						$(this).css({ color: "white", background: "deepskyblue" });
					},
					mouseout: function() {
						$(this).css({ color: "deepskyblue", background: "white" });
					}
					
				});
				
				$("#topicAnswer").on("click", ".text-comment", function() {
					$(this).parents(".text-block").find(".commentdiv").toggle();
				});
				
				$("#topicAnswer").on("click", ".comment-replybtn", function() {
					if("${user}" == "") {
						$('#loginModal').modal();
					} else {
						$(this).parent(".comment-situation").hide();
						$(this).parent(".comment-situation").next(".comment-reply").show();
					}
				});
				
				$("#topicAnswer").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
				//检测答案评论输入框是否有值,有才能提交评论
				$("#topicAnswer").on("keyup", ".commentInput", function() {
					if (this.value != "") {
						$(this).next(".commentSubmitBtn").attr("disabled", false);
					} else {
						$(this).next(".commentSubmitBtn").attr("disabled", true);
					}
				});
				
				//检测评论回复输入框是否有值,有才能提交评论
				$("#topicAnswer").on("keyup", ".comment-input", function() {
					if (this.value != "") {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", false);
					} else {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", true);
					}
				});
				
				//ajax查询其他话题
				ajaxLoadOtherTopics();
				
				//ajax加载第一个话题动态
				$(".focusedtopic:first").click();
				
				/*回到顶部*/
				$("#gotobtn").click(function() {
					 $('body,html').animate({scrollTop:0}, 500);
				});

			});

			$(window).scroll(function() {
				if(document.body.scrollTop > 600) {
					$("#gotobtn").show();
				}
				if(document.body.scrollTop < 600) {
					$("#gotobtn").hide();
				}
			});
			
			//关注其他话题
			function watchOrCancle(tid, obj) {
				if("${user}" == "") {	//若用户未登录,不能关注
					$('#loginModal').modal();
					return;
				}
				if(obj.innerText == "关注"){
					$.post("${pageContext.request.contextPath}/topicServlet", {"method":"addWatch", "tid":tid}, function(result) {
						if(result == 1){
							obj.innerText="取消关注";						
						}
					});
				} else {
					$.post("${pageContext.request.contextPath}/topicServlet", {"method":"cancleWatch", "tid":tid}, function(result) {
						if(result == 1){
							obj.innerText="关注";						
						}
					});
				}
			}
			
			//ajax加载其他话题
			function ajaxLoadOtherTopics(){
				$.getJSON("${pageContext.request.contextPath}/topicServlet", {"method":"findOthers"},
					function(result){
						var topics = "";
						$(result).each(function(i, obj){
							topics += '<div class="topicdiv">';
							topics += '<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id='+obj.id+'"><img class="topicicon" src="${pageContext.request.contextPath}/'+obj.photo+'" /></a>';
							topics += '<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id='+obj.id+'" class="topicfont">'+obj.name+'</a>';
							topics += '<a href="javascript:void(0)" onclick="watchOrCancle('+obj.id+', this)" class="topicfocus">关注</a>';
							topics += '</div>';
						});
						$("#otherTopicsDiv").html(topics);
				});
			}
			
			
		</script>
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
			.report{
				font-size: 16px;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
		//点击 话题 按钮
			function clickWatchedTopic(tid) {
				currentPage = 1;
				topicId = tid;
				$.getJSON("${pageContext.request.contextPath}/topicServlet", {"method":"ajaxLoadTopic", tid:tid}, function(result){
					var s = '<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id='+result.id+'" style="text-decoration: none;">';
					s += '<img src="${pageContext.request.contextPath}/'+result.photo+'" height="40px" style="border-radius: 4px;" />';
					s += '<span style="font-weight: bold; margin-left: 20px;">'+result.name+'</span>';	 
					s += '</a>';	
					$("#topicInfo").html(s);
				});
				$("#topicAnswer").html("");
				showTopicDynamic();
			}
		
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

			// ajax加载话题动态
			function showTopicDynamic(){
				$.post("${pageContext.request.contextPath}/topicServlet", {"method":"findTopicDynamic", tid:topicId, orderStyle:orderStyle, currentPage:currentPage++}, function(result){
					$("#waitResult").hide();
					if(result != "0") {
						$("#topicAnswer").append(result);
						if(currentPage >= 5) {
							$("#showMoreDynamic").show();
						}
					} else {
						$("#showMoreDynamic").hide();
						$("#topicAnswer").append("<h4 style='padding:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
						currentPage = -1;
					}
				});
			}
			
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var currentPage = 1;
			var topicId = 0;
			var orderStyle = "hot";
			 $(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				if((totalheight >= $(document).height()) && currentPage > 0 && currentPage <= 5) {
					showTopicDynamic();
				}
			}); 
			 //热度排序
			 function hotOrder(){
				 $("#timeOrder").toggle();
				 $("#hotOrder").toggle();
				 $("#topicAnswer").html("");
				 orderStyle="hot";
				 currentPage = 1;
				 showTopicDynamic();
			 }
			 //时间排序
			 function timeOrder(){
				 $("#timeOrder").toggle();
				 $("#hotOrder").toggle();
				 $("#topicAnswer").html("");
				 orderStyle="time";
				 currentPage = 1;
				 showTopicDynamic();
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
					<div>
						<span style="font-weight: bold;margin-left: 20px;">已关注的话题动态</span>
						<a href="javascript:void(0)" style="margin-left: 415px;">共关注 ${fn:length(list)}个话题</a>
					</div>
					<div style="height: 1px;background-color: darkgray;margin-top: 10px;"></div>
					<div style="padding: 15px 0;">
						<!-- 已关注话题 -->
						<c:forEach items="${list}" var="topic">
							<button class="focusedtopic" onclick="clickWatchedTopic(${topic.id})">${topic.name }</button>
						</c:forEach>
					</div>
					<div style="height: 1px;background-color: lightgray;"></div>
					
					<!-- ajax加载话题信息 -->
					<div style="margin-top: 15px; margin-bottom: 40px; position: relative;">
						<span id="topicInfo"></span>
						<span id="timeOrder"><span style="margin-left: 410px;">热门排序 |</span> <a href="javascript:timeOrder()">时间排序</a></span>
						<span id="hotOrder" style="display: none;"><a style="margin-left: 410px;"  href="javascript:hotOrder()">热门排序 |</a> <span>时间排序</span></span>
					</div>
					
					<!-- ajax加载话题答案 -->
					<div>
						<div id="waitResult" style="text-align:center;padding:40px;color:deepskyblue;">
							<i class="fa fa-spinner fa-pulse fa-5x"></i>
							<span class="sr-only">Loading...</span>
						</div>
						<div id="topicAnswer"></div>
					</div>
					<!-- 查看更多回答 -->
					<button id="showMoreDynamic" class="btn btn-default btn-block btn-lg" style="margin-bottom:100px;display:none" onclick='showTopicDynamic()'>查看更多动态</button>
				</div>
			</div>

			<!-- 右边栏Div -->
			<div style="float:left;margin-left: 50px;">
				<div id="topicground">
					<div style="text-align: center;">
						<a href="${pageContext.request.contextPath}/jsp/topicground.jsp"><button type="button" class="btn btn-info" style="margin-top:30px;">进入话题广场</button></a>
					</div>
					<div style="text-align: center;margin-top: 20px;">
						<a href="${pageContext.request.contextPath}/jsp/topicground.jsp">
							来这里发现更多有趣话题
						</a>
					</div>
				</div>
				<div class="separator" style="margin: 25px 0;"></div>
				<div>
					<div style="position: relative;">
						<span style="font-weight: bold;">其他人关注的话题</span>
						<a href="javascript:void(0)" onclick="ajaxLoadOtherTopics()" style="position: absolute;right: 0px;">换一换</a>
					</div>
					<!-- ajax加载其他的话题 -->
					<div id="otherTopicsDiv">
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
						<li><a href="#" target="_blank">赵日天</a></li>
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

		<!--提问须知模态框-->
		<%@ include file="/jsp/askrule.jsp" %>

		</div>
	</body>

</html>