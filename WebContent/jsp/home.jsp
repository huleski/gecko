<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>${person.name } --逼乎</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.css" rel="stylesheet" />
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
				color: darkgray;
			}
			
			#mainDiv {
				width: 700px;
				background-color: white;
				boder-radius: 3px;
				float: left;
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
				padding:15px 16px;
				line-height: 1.7;
			}
			
			.text-dynamic {
				color: gray;
				font-size: 15px;
			}
			
			.text-author {
				margin-top: 10px;
				margin-bottom: 10px;
				position: relative;
			}
			
			.text-author .photo {
				width: 40px;
			}
			
			.text-author .personalmsg {
				position: absolute;
				left: 55px;
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
			
			.text-status {
				color: gray;
			}
			
			.text-content {
				font-size: 15px;
				margin-bottom: 15px;
				cursor: pointer;
			}
			
			.opinion {
				color: deepskyblue;
				font-size: 14px;
			}
			
			.text-situation {
				margin-left: 25px;
				cursor: pointer;
			}
			
			.answerblock .text-end {
				position: relative;
			}
			
			.answerblock .text-content .expand {
				font-size: 14px;
			}
			
			.answerblock .keepgap {
				margin-left: 10px;
			}
		</style>
		<style type="text/css">
			#rightDiv {
				width: 300px;
				height: 300px;
				float: left;
				margin-left:10px;
			}
			
			#icoDiv {
				width: 300px;
				height: 110px;
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
				position:relative;
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
				position:relative;
			}
			
			#navDiv .navtitle {
				position:absolute;
				right:10px;
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
		</style>
		<style type="text/css">
			#personalshow {
				width: 1015px;
				position: relative;
				margin: auto;
				top: 60px;
				border-radius: 3px;
			}
			
			#topdiv {
				width: 1015px;
				height: 240px;
				background:url(${pageContext.request.contextPath}/${person.backphoto});
			}
			
			#bottomdiv {
				width: 1015px;
				background-color: white;
				position: relative;
				border: 1px white solid;
			}
			
			#photoback {
				background-color: white;
				width: 170px;
				height: 170px;
				position: absolute;
				top: -20px;
				left: 20px;
				border-radius: 8px;
			}
			
			#personalimg {
				width: 160px;
				height: 160px;
				border-radius: 5px;
				margin-top: 5px;
				margin-left: 5px;
			}
			
			#personalname {
				font-size: 28px;
				font-weight: bold;
			}
			
			#personalsignal {
				font-size: 18px;
				margin-left: 10px;
			}
			
			#personalinfo {
				width: 780px;
				position: relative;
				margin: 15px 0 20px 215px;
			}
			#simpleInfo div{
				margin:15px 0;
			}
			#completedInfo {
				display:none;
			}
			#scrollMsg{
				display:none;
			}
			.icoValue {
				position:absolute;
				left:100px;
				width:650px
			}
			#personalinfo div {
				margin-bottom: 10px;
			}
			
			.watchOrEdit {
				position: absolute;
				right: 0px;
				bottom: 0px;
			}
		</style>
		<style type="text/css">
			#personalnav li {
				margin-right: 10px;
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
				height: 1px;
				background-color: lightgray;
				/* margin-bottom: 20px; */
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
			
			.commentAnswer {
				width: 540px;
				display: inline;
				margin: 15px 30px 15px 20px;
			}
			.takeback {
				position: absolute;
				top: 5px;
				right: 5px;
				display: none;
			}
			.text-all {
				display: none;
			}
			.question-div{
				padding:15px 20px;
			}
			.question-title{
				color:black;
				font-size:20px;
				font-weight:bold;
			}
			.question-state span{
				margin-right:20px;
			}
		</style>
		
		<style type="text/css">
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
			.commentInput {
				width: 75%;
				display: inline;
				margin: 15px 30px 15px 20px;
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
				
				$("#tabPanes").on("mouseover", ".text-content", function() {
					$(this).css("color", "gray");
					});
				$("#tabPanes").on("mouseout", ".text-content", function() {
					$(this).css("color", "black");
					}); 

				$("#tabPanes").on("hover", ".answerblock", function() {
					$(this).find(".closeblock").toggle();
				});

				$("#tabPanes").on("click", ".text-content", function() {
					$(this).hide();
					var $answer = $(this).parent(".answerblock");
					$answer.find(".text-all").show();
					$answer.find(".takeback").show();
				});
				$("#tabPanes").on("click", ".takeback", function() {
					$(this).hide();
					var $answerblock = $(this).parents(".answerblock");
					$answerblock.find(".text-all").hide();
					$answerblock.find(".text-content").show();
				});
				$("#tabPanes").on("click",".closeblock", function() {
					$(this).parents(".answerblock").hide();
				});
				
				$("#tabPanes").on("click", ".text-comment", function() {
					$(this).parents(".answerblock").find(".commentdiv").toggle();
					$(this).find(".comment-count").toggle();
					$(this).find(".hidecomment").toggle();
				});
				
				$("#tabPanes").on("click", ".comment-replybtn", function() {
					if("${user}" == "") {
						$('#loginModal').modal();
					} else {
						$(this).parent(".comment-situation").hide();
						$(this).parent(".comment-situation").next(".comment-reply").show();
					}
				});
				
				$("#tabPanes").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});

				// 回到顶部
				$("#gotobtn").click(function() {
					 $('body,html').animate({scrollTop:0}, 500);
				});
				
				// 显示回到顶部
				$(window).scroll( function() {
					if($(this).scrollTop() > 1000) {
						$("#gotobtn").show();
					} else {
						$("#gotobtn").hide();
					}
				});
				
				// 查看详细资料
				$("#moreMsg").click(function() {
					$(this).hide();
					$("#scrollMsg").show();
					$("#simpleInfo").hide();
					$("#completedInfo").show();
				});
				// 收起详细资料
				$("#scrollMsg").click(function() {
					$(this).hide();
					$("#moreMsg").show();
					$("#simpleInfo").show();
					$("#completedInfo").hide();
				});
				
				$("#cancleWatch").hover(function(){
					this.innerText="取消关注";
				},function(){
					this.innerText="已关注";
				});
				
			});

			//关注作者
			function addWatch(uid) {
				if("${user}" == "") {	//若用户未登录,不能关注
					$('#loginModal').modal();
					return;
				}
				$("#addWatch").toggle();
				$("#cancleWatch").toggle();
				$.post("${pageContext.request.contextPath}/userServlet", {"method":"addWatch", "uid":uid},
						function(result) {
							if(result == 1){
								var count = parseInt($("#authorWatchCount").text());
								$("#authorWatchCount").text(count + 1);
							}
					});
			}
			
			//取消作者关注
			function cancleWatch(uid) {
				if("${user}" == "") {	//若用户未登录,不能取消关注
					$('#loginModal').modal();
					return;
				}
				$("#addWatch").toggle();
				$("#cancleWatch").toggle();
				$.post("${pageContext.request.contextPath}/userServlet", {"method":"cancleWatch", "uid":uid},
					function(result) {
						if(result == 1){
							var count = parseInt($("#authorWatchCount").text());
							$("#authorWatchCount").text(count - 1);
						}
					});
			}
			
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var question_index = 0;
			var dynamic_index = 0;
			var answer_index = 0;
			var article_index = 0;
			$(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				if((totalheight >= $(document).height())) {
					var tabId = $(".tab-pane:visible").attr("id");
					if(tabId == "question" && question_index > 0) {
						ajaxLoadQuestion();
					}else if (tabId == "dynamic" && dynamic_index > 0) {
						ajaxLoadDynamic();
					}else if (tabId == "answer" && answer_index > 0) {
						ajaxLoadAnswer();
					}else if (tabId == "article" && article_index > 0) {
						ajaxLoadArticle();
					}
				}
			});
			
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
			
			// 加载问题 
			function ajaxLoadQuestion() {
				$.getJSON("${pageContext.request.contextPath}/userServlet", 
					{"method":"findQuestionByUid",
					"currentPage": ++question_index, 
					"id":"${person.id}"}, 
					function(result) {
						if(result != "0") {
							$("#noQuestion").css("display", "none");
							$(result).each(function(i, obj) {
								$("#question").append(
									"<div class='question-div'>"+
									"<div><a class='question-title' href='${pageContext.request.contextPath}/questionServlet?method=findById&id="+obj.id+"'>" + obj.title + "</a></div>" +
									"<div class='question-state'>"+
									"<span>" + new Date(obj.date.time).format("yyyy-MM-dd") +"</span>"+
									"<span>" + obj.answerList.length + " 个回答</span>"+
									"<span>" + obj.watchCount + " 个关注</span>"+
									"</div></div>" + 
									"<div class='separator'></div>"
								);
							});
						} else {
							if(question_index != 1){
								$("#question").append("<div style='height:30px; background-color:#F3F3F3;'/><h4 style='margin:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
							}
							question_index = -1;
						}
				});
			}
			
			//加载动态 
			function ajaxLoadDynamic() {
				$.post("${pageContext.request.contextPath}/userServlet", 
					{"method":"findUserDynamicByUid",
					"currentPage": ++dynamic_index, 
					"id":"${person.id}"}, 
					function(result) {
						if(result != "0") {
							$("#noDynamic").css("display", "none");
							$("#dynamic").append(result);
							$(".report").popover();
						} else {
							if(dynamic_index != 1){
								$("#dynamic").append("<div style='height:30px; background-color:#F3F3F3;'/><h4 style='margin:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
							}
							dynamic_index = -1;
						}
				});
			}
			
			//加载回答
			function ajaxLoadAnswer() {
				$.post("${pageContext.request.contextPath}/userServlet",
					{"method":"findAnswerByUid",
					"currentPage": ++answer_index, 
					"personId": "${person.id}",
					"id":"${person.id}"}, 
					function(result) {
						if(result != "0") {
							$("#noAnswer").css("display", "none");
							$("#answer").append(result);
							$(".report").popover();
						} else {
							if(answer_index != 1){
								$("#answer").append("<div style='height:30px; background-color:#F3F3F3;'/><h4 style='margin:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
							}
							answer_index = -1;
						}
				});
			}
			
			//加载文章
			function ajaxLoadArticle() {
				$.post("${pageContext.request.contextPath}/userServlet",
					{"method":"findArticleByUid",
					"currentPage": ++article_index, 
					"personId": "${person.id}",
					"id":"${person.id}"}, 
					function(result) {
						if(result != "0") {
							$("#noArticle").css("display", "none");
							$("#article").append(result);
							$(".report").popover();
						} else {
							if(article_index != 1){
								$("#article").append("<div style='height:30px; background-color:#F3F3F3;'/><h4 style='margin:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
							}
							article_index = -1;
						}
				});
			}
			
			$(function(){
				ajaxLoadDynamic();
				
				$("#questionLi").one("click", function(){
					ajaxLoadQuestion();
				});
				
				$("#answerLi").one("click", function(){
					ajaxLoadAnswer();
				});
				
				$("#articleLi").one("click", function(){
					ajaxLoadArticle();
				});
			});
			
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
						//更新评论数
						var count = $(obj).parents(".answerblock").find(".comment-count").text();
						count = count.substring(0,1);
						$(obj).parents(".answerblock").find(".comment-count").text(Number(count) + 1 + " 条评论");
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
						var count = $(obj).parents(".answerblock").find(".comment-count").text();
						count = count.substring(0,1);
						$(obj).parents(".answerblock").find(".comment-count").text(Number(count) + 1 + " 条评论");
						showComment(targetId, 1, type, obj);
					});
				}
			}
			
			$(function(){
				//检测答案评论输入框是否有值,有才能提交评论
				$("#tabPanes").on("keyup", ".commentInput", function() {
					if (this.value != "") {
						$(this).next(".commentSubmitBtn").attr("disabled", false);
					} else {
						$(this).next(".commentSubmitBtn").attr("disabled", true);
					}
				});
				
				//检测评论回复输入框是否有值,有才能提交评论
				$("#tabPanes").on("keyup", ".comment-input", function() {
					if (this.value != "") {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", false);
					} else {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", true);
					}
				});
			});
			
			//赞同回答
			function agree(aid, obj, type) {		//type : 1, 回答.   2,文章
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
					if(type == 1) {
						$.post("${pageContext.request.contextPath}/answerServlet", {"method":"agree", "aid":aid});
					} else {
						$.post("${pageContext.request.contextPath}/articleServlet", {"method":"agree", "aid":aid});
					}
					$(obj).find(".keepgap").text(count + 1);
				} else {	//取消点赞,发送ajax请求
					if(type == 1) {
						$.post("${pageContext.request.contextPath}/answerServlet", {"method":"disagree", "aid":aid});
					} else {
						$.post("${pageContext.request.contextPath}/articleServlet", {"method":"disagree", "aid":aid});
					}
					$(obj).find(".keepgap").text(count - 1);
				}
			}
			//反对回答(取消赞同)
			function disagree(aid, obj, type) {		//type : 1, 回答.   2,文章
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
					if(type == 1) {
						$.post("${pageContext.request.contextPath}/answerServlet", {"method":"disagree", "aid":aid});
					} else {
						$.post("${pageContext.request.contextPath}/articleServlet", {"method":"disagree", "aid":aid});
					}
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
			
			// 删除回答
			function deleteAnswer(obj, aid){
				$(obj).parents(".answerblock").hide();
				$.post("${pageContext.request.contextPath}/userServlet", {"id":aid,method:"deleteAnswerById"});
			}
			
			//删除文章
			function deleteArticle(obj, aid){
				$(obj).parents(".answerblock").hide();
				$.post("${pageContext.request.contextPath}/userServlet", {"id":aid,method:"deleteArticleById"});
			}
		</script>
	</head>

	<body>
		<div>
			<!-- 引入导航栏 -->
			<%@ include file="/jsp/header1.jsp" %>
			<c:set value="${person.id }" var="personId"/>

			<!--个人展示div-->
			<div id="personalshow">
				<!-- 背景图 -->
				<div id="topdiv"></div>
				<div id="bottomdiv">
					<div id="photoback">
						<img src="${pageContext.request.contextPath}/${person.photo}" id="personalimg" />
					</div>
					<div id="personalinfo">
						<div id="simpleInfo">
							<div>
								<span id="personalname">${person.name}</span>
								<span id="personalsignal">${person.sentence}</span>
							</div>
							<c:set value="0" var="count"/>
							<c:if test="${count < 3}">
								<c:if test="${person.sex == '男'}"><div style="font-size:20px;color:deepskyblue"><i class="fa fa-mars fa-fw"></i></div><c:set value="${count + 1 }" var="count"/></c:if>
								<c:if test="${person.sex == '女'}"><div style="font-size:20px;color:deeppink"><i class="fa fa-venus fa-fw"></i></div><c:set value="${count + 1 }" var="count"/></c:if>
							</c:if>		
							<c:if test="${count < 3}">
								<c:if test="${not empty person.address}"><div><i class="fa fa-address-book fa-fw fa-lg"></i><span class="icoValue">${person.address }</span></div><c:set value="${count + 1 }" var="count"/></c:if>
							</c:if>		
							<c:if test="${count < 3}">
								<c:if test="${not empty person.industry}"><div><i class="fa fa-industry fa-fw  fa-lg"></i><span class="icoValue">${person.industry }</span></div><c:set value="${count + 1 }" var="count"/></c:if>
							</c:if>		
							<c:if test="${count < 3}">
								<c:if test="${not empty person.profession}"><div><i class="fa fa-envira fa-fw fa-lg"></i><span class="icoValue">${person.profession }</span></div><c:set value="${count + 1 }" var="count"/></c:if>
							</c:if>		
							<c:if test="${count < 3}">
								<c:if test="${not empty person.education}"><div><i class="fa fa-graduation-cap fa-fw fa-lg"></i><span class="icoValue">${person.education }</span></div><c:set value="${count + 1 }" var="count"/></c:if>
							</c:if>		
							<c:if test="${count < 1}">
								<div style="height: 30px;"></div>
							</c:if>		
						</div>
						
						<div id="completedInfo">
							<c:set value="0" var="infocount"/>
							<c:if test="${not empty person.sex}"><div><label>性别</label><span class="icoValue">${person.sex }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${not empty person.sentence}"><div><label>一句话介绍</label><span class="icoValue">${person.sentence }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${not empty person.address}"><div><label>居住地</label><span class="icoValue">${person.address }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${not empty person.industry}"><div><label>所在行业</label><span class="icoValue">${person.industry }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${not empty person.profession}"><div><label>职业经历</label><span class="icoValue">${person.profession }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${not empty person.education}"><div><label>教育经历</label><span class="icoValue">${person.education }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${not empty person.description}"><div><label>个人简介</label><span class="icoValue">${person.description }</span></div><c:set value="${infocount + 1 }" var="infocount"/></c:if>
							<c:if test="${infocount <1 }">
								<div style="height: 35px;"></div>
							</c:if>
							<c:if test="${infocount <2 }">
								<div style="height: 25px;"></div>
							</c:if>
							<c:if test="${infocount <3 }">
								<div style="height: 5px;"></div>
							</c:if>
						</div>
						
						<div style="padding:15px 0;">
							<a href="javascript:void(0)" id="moreMsg">
								<span class="glyphicon glyphicon-chevron-down">
									<span>查看详细资料</span>
								</span>
							</a>
							<a href="javascript:void(0)" id="scrollMsg">
								<span class="glyphicon glyphicon-chevron-up">
									<span>收起详细资料</span>
								</span>
							</a>
						</div>
						<c:if test="${user.id == person.id}">					
							<button type="button" class="btn btn-default watchOrEdit" style="border: deepskyblue 1px solid;color: deepskyblue;" onclick="window.location.href='${pageContext.request.contextPath}/userServlet?method=editUserUI'">编辑个人资料</button>
						</c:if>
						<c:if test="${user.id != person.id}">
							<c:if test="${person.watched != 1}">
								<button type="button" class="btn btn-default watchOrEdit" id="addWatch" style="border:deepskyblue 1px solid;color: deepskyblue;" onclick="addWatch(${person.id})">关注Ta</button>
								<button type="button" class="btn btn-info watchOrEdit" id="cancleWatch" onclick="cancleWatch(${person.id})" style="display:none;">已关注</button>
							</c:if>
							<c:if test="${person.watched == 1}">
								<button type="button" class="btn btn-default watchOrEdit" id="addWatch" onclick="addWatch(${person.id})" style="display:none;border: deepskyblue 1px solid;color: deepskyblue;">关注Ta</button>
								<button type="button" class="btn btn-info watchOrEdit" id="cancleWatch" onclick="cancleWatch(${person.id})">已关注</button>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>

		<div style="width: 1020px;margin:auto;margin-top: 70px;">
			<!--浏览内容div-->
			<div id="mainDiv">
				<div style="font-size: 16px;padding: 5px 0 5px 5px;">
					<ul class="nav nav-pills" id="personalnav">
						<li class="active">
							<a href="#dynamic" data-toggle="tab"> 动态 </a>
						</li>
						<li id="answerLi">
							<a href="#answer" data-toggle="tab"> 回答 </a>
						</li>
						<li id="questionLi">
							<a href="#question" data-toggle="tab"> 提问 </a>
						</li>
						<li id="articleLi">
							<a href="#article" data-toggle="tab"> 文章 </a>
						</li>
						<li>
							<a href="#column" data-toggle="tab"> 专栏 </a>
						</li>
						<li>
							<a href="#share" data-toggle="tab"> 分享 </a>
						</li>
						<li class="btn-group">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								更多 <span class="glyphicon glyphicon-chevron-down"></span>
							</a>
							<ul class="dropdown-menu nav nav-pills nav-stacked" role="menu">
								<li>
									<a href="#">收藏 </a>
								</li>
								<li>
									<a href="#">关注</a>
								</li>
								<li>
									<a href="#">屏蔽</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="#">拉黑</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>

				<!-- Tab panes -->
				<div class="tab-content" id="tabPanes">
					<!-- 动态板块 -->
					<div class="tab-pane active" id="dynamic">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">我的动态</div>
						
						<div class="separator"></div>
						<div id="noDynamic" style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/noqestion.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								还没有动态
							</div>
						</div>
					</div>
					
					<!-- 回答板块 -->
					<div class="tab-pane" id="answer" style="fon">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">
							<span>我的回答</span>
							<a href="#" style="margin-left: 510px;font-weight: 100;">按时间排序</a>
						</div>
						<div class="separator"></div>
						<div id="noAnswer" style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/noanswer.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								还没有回答，看看
								<a href="#">为你推荐的问题</a>
							</div>
						</div>
					</div>
					
					<!-- 提问板块 -->
					<div class="tab-pane" id="question">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">
							<span>我的提问</span>
						</div>
						<div class="separator"></div>
						<div id="noQuestion" style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/noqestion.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								还没有提问
							</div>
						</div>
						
					</div>
					
					<!-- 文章板块 -->
					<div class="tab-pane" id="article">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">
							<span>我的文章</span>
							<a href="#" style="margin-left: 510px;font-weight: 100;">按时间排序</a>
						</div>
						<div class="separator"></div>
						<div id="noArticle" style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/noworks.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								还没有文章，开始写
								<a href="#">第一篇文章</a>
							</div>
						</div>
					</div>
					
					<!-- 专栏板块 -->
					<div class="tab-pane" id="column">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">
							<span>我的专栏</span>
						</div>
						<div class="separator"></div>
						<div style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/nocolumn.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								想在逼乎进行主题创作？
								<a href="#">申请专栏</a>
							</div>
						</div>
					</div>
					
					<!-- 分享板块 -->
					<div class="tab-pane" id="share">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">
							<span>我的分享</span>
						</div>
						<div class="separator"></div>
						<div style="height: 280px;padding-top: 80px;">
							<div align="center">
								<img src="${pageContext.request.contextPath}/img/noworks.png" />
							</div>
							<div style="color: darkgray;font-size: 15px;text-align: center;">
								还没有分享
							</div>
						</div>
					</div>
				</div>

			</div>

			<!--右侧导航栏div-->
			<div id="rightDiv">
				<div id="icoDiv">
					<div style="font-weight: bold;padding: 15px;">个人成就</div>
					<div style="background-color: #F0F2F7;height: 1px;"></div>
					<div style="padding: 20px;">
						<span class="glyphicon glyphicon-thumbs-up"></span>
						<span style="margin-left: 10px;">获得 ${personInfo.approvaledCount } 次赞同</span>
					</div>
				</div>
				<div id="subscribe">
					<div style="width:150px;position:absolute;left:0;">
						<div style="color: darkgray;text-align:center;margin-bottom:5px;">关注了</div>
						<div style="text-align:center;font-size: 19px;">${personInfo.followedCount }</div>
					</div>
					<div style="width:150px;position:absolute;right:0;">
						<div style="text-align:center;color: darkgray;margin-bottom:5px;">关注者</div>
						<div id="authorWatchCount" style="text-align:center;font-size: 19px;">${personInfo.watchedCount }</div>
					</div>
				</div>
				<div id="navDiv">
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="javascript:void(0)">
							关注的话题
							<span class="navtitle">${personInfo.watchTopicCount }</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="javascript:void(0)">
							关注的专栏
							<span class="navtitle">${personInfo.watchColumnCount }</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="javascript:void(0)">
							关注的问题
							<span class="navtitle">${personInfo.watchQuestionCount }</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="javascript:void(0)">
							关注的收藏夹
							<span class="navtitle">${personInfo.watchCollectionCount }</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<c:if test="${person.id == user.id }">
						<div class="navlayer">
							<span style="color: #337AB7;">个人主页被浏览  ${person.visitedCount } 次</span>
						</div>
						<div class="navseparator"></div>
					</c:if>
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
		
			<!--反馈Modal-->
			<%@ include file="/jsp/feedback.jsp" %>
		</div>
	</body>

</html>