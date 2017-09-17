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
			
			.opinion {
				color: deepskyblue;
				font-size: 14px;
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
				
				$(".report").popover();
				
				$("#dynamic").on("click", ".text-comment", function() {
					$(this).parents(".answerblock").find(".commentdiv").toggle();
					$(this).find(".comment-count").toggle();
					$(this).find(".hidecomment").toggle();
				});
				
				
				
				$("#dynamic").on("click", ".comment-replybtn", function() {
					$(this).parent(".comment-situation").hide();
					$(this).parent(".comment-situation").next(".comment-reply").show();
				});
				
				$("#dynamic").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
			});
			
			//点击回答
			function writeAnswer(){
				if("${user}" == "") {
					$('#loginModal').modal();
				} else {
					$("#answereditordiv").show();
					 $('body,html').animate({scrollTop:$(document).height() - $(window).height()/2}, 200);
				}
			}
			
			//加载评论
			function showComment(aid, currentPage, obj) {
				var $commentblock = $(obj).parents(".answerblock").find(".user-commentblock");
				$.post("${pageContext.request.contextPath}/commentServlet", {"method":"ajaxLoad","targetId":aid, "currentPage": currentPage, "type":1}, function(result) {
					$commentblock.html(result);
				}, "text");
				
			}
			
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var answer_index = 0;
			 $(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				if((totalheight >= $(document).height()) && answer_index >= 0) {
					$.getJSON("${pageContext.request.contextPath}/answerServlet", {"method":"ajaxLoad", "qid":"${question.id}", "currentPage": ++answer_index},
							function(result) {
								if(result != "") {
									$(result).each(function(i, obj) {
										var s = '<div class="answerblock">';
											s += '<div class="separator"></div>';
											s += '<div class="text-author">';
											s += '	<a href="${pageContext.request.contextPath}/userServlet?method=findById&id='+obj.user.id+'">';
											s += '<img class="photo" src="${pageContext.request.contextPath}/img/default.jpg" />';
											s += '</a>';
											s += '<span class="personalmsg">';
											s += '<a href="${pageContext.request.contextPath}/userServlet?method=findById&id='+obj.user.id+'" style="color: black;">';
											s += '<div class="name">';
											s += obj.user.name;
											s += '</div>';
											s += '</a>';
											s += '<div class="signal">';
											s += obj.user.sentence;
											s += '</div>';
											s += '</span>';
											s += '</div>';
											s += '<div class="text-status">'+obj.agreeCount+'人也赞同了该回答</div>';
											s += '<div class="text-content">';
											s += obj.pureContent.substring(0, 300);
											s += '<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>';
											s += '</div>';
											s += '<div class="text-all">';
											s += obj.pureContent;
											s += '<div class="edit-time">编辑于<span>'+ new Date(obj.date.time).format("yyyy-MM-dd") +'</span></div>';
											s += '</div>';
											s += '<div class="text-end">';
											s += '<button class="btn btn-default">';
											s += '<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">'+obj.agreeCount+'</span></span>';
											s += '</button>';
											s += '<button class="btn btn-default">';
											s += '<span class="glyphicon glyphicon-chevron-down opinion"></span>';
											s += '</button>';
											s += '<span>';
											s += '<a class="text-situation text-comment">';
											s += '<span onclick="showComment('+obj.id+', 1, this)">';
											s += '<span class="comment-count"><span class="glyphicon glyphicon-comment"></span> '+obj.commentCount+'条评论</span></span>';
											s += '<span class="hidecomment" style="display: none;"><span class="glyphicon glyphicon-comment"></span> 收起评论</span>';
											s += '</a>';
											s += '<a href="#" class="text-situation">';
											s += '<span class="glyphicon glyphicon-share-alt"></span>';
											s += '<span>分享</span>';
											s += '</a>';
											s += '<a href="#" class="text-situation">';
											s += '<span class="glyphicon glyphicon-star"></span>';
											s += '<span>收藏</span>';
											s += '</a>';
											s += '<a href="#" class="text-situation">';
											s += '<span class="glyphicon glyphicon-heart"></span>';
											s += '<span>感谢</span>';
											s += '</a>';
											s += '<a class="text-situation report" data-placement="bottom" data-html="true" data-content="<ul class=nav nav-pills nav-stacked><li><a href=#>没有帮助</a></li><li><a href=#>举报</a></li></ul>">';
											s += '···';
											s += '</a>';
											s += '</span>';
											s += '<button class="takeback btn btn-info btn-xs">收起</button>';
											s += '</div>';
																		
											/* 评论div */
											s += '<div class="commentdiv">';
											s += '<div class="comment-title">';
											s += '<span style="font-weight: bold;">'+obj.commentCount+'条评论</span>';								
											s += '<a style="cursor: pointer;position: absolute;right: 20px;">切换为时间顺序</a>';
											s += '</div>';
											s += '<div class="separator" style="width: 100%;"></div>';
										
											/*  用户评论 */ 
											s += '<div class="user-commentblock">';
											
											s += '</div>';
											s += '<div class="separator"></div>';
												
												
											/* 评论回答 */
											s += '<div>';
											s += '<form action="${pageContext.request.contextPath}/" method="post">';
											s += '<input class="form-control commentAnswer" type="input" placeholder="写下你的评论"/>';
											s += '<button class="btn btn-info" type="submit">评论</button>';
											s += '</form>';
											s += '</div>';
											s += '</div>';
											s += '</div>';
										
										$("#dynamic").append(s);
										$(".report").popover();
									});
								} else {
									$("#dynamic").append("<hr/>");
									$("#dynamic").append("<h4 style='padding:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
									answer_index = -1;
								}
								
							});
					
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
							<a class="topmenu" href="${pageContext.request.contextPath}/jsp/topic.jsp" style="margin-left: 30px;">话题</a>
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
									<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${user.id}" style="position: relative;top: -5px;margin-left: 30px;">
										<c:if test="${empty user.photo }"><img src="${pageContext.request.contextPath}/img/default.jpg" height="30px" width="30px"/></c:if>
										<c:if test="${not empty user.photo }"><img src="${pageContext.request.contextPath}/${user.photo}" height="30px" width="30px"/></c:if>						
									</a>
								</span>
							</c:if>
						</span>
					</span>
				</div>
				<!-- 导航问题栏 -->	
				<div id="outline" style="position: relative;margin: auto;width: 1010px;height:50px;display: none;">
					<div style="position: absolute;top:10px;text-align: left;font-weight: bold;font-size: 22px;width: 700px;">
						${fn:substring(question.title, 0, 30) }...
					</div>
					<span style="position: absolute;top:8px;right: 20px;">
						<button type="button" class="btn btn-info" id="focusquestion" onclick="">关注问题</button>
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
							<div style="font-size: 18px;">${fn:length(question.watchList)}</div>
						</div>
						<div style="float: left;width: 100px;text-align: center;">
							<div style="color: darkgray;">被浏览</div>
							<div style="font-size: 18px;">${question.lookCount}</div>
						</div>
					</div>
					<div style="position: absolute;bottom: 15px;right: 20px;">
						<button type="button" class="btn btn-info" id="focusquestion" onclick="">关注问题</button>
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
							$.getJSON("${pageContext.request.contextPath}/answerServlet", {"method":"ajaxLoad", "qid":"${question.id}", "currentPage": ++answer_index},
									function(result) {
										if(result != "") {
											$("#noAnswer").css("display", "none");
											$(result).each(function(i, obj) {
												var s = '<div class="answerblock">';
													s += '<div class="separator"></div>';
													s += '<div class="text-author">';
													s += '	<a href="${pageContext.request.contextPath}/userServlet?method=findById&id='+obj.user.id+'">';
													s += '<img class="photo" src="${pageContext.request.contextPath}/img/default.jpg" />';
													s += '</a>';
													s += '<span class="personalmsg">';
													s += '<a href="${pageContext.request.contextPath}/userServlet?method=findById&id='+obj.user.id+'" style="color: black;">';
													s += '<div class="name">';
													s += obj.user.name;
													s += '</div>';
													s += '</a>';
													s += '<div class="signal">';
													s += obj.user.sentence;
													s += '</div>';
													s += '</span>';
													s += '</div>';
													s += '<div class="text-status">'+obj.agreeCount+'人也赞同了该回答</div>';
													s += '<div class="text-content">';
													s += obj.pureContent.substring(0, 300);
													s += '<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>';
													s += '</div>';
													s += '<div class="text-all">';
													s += obj.pureContent;
													s += '<div class="edit-time">编辑于<span>'+ new Date(obj.date.time).format("yyyy-MM-dd") +'</span></div>';
													s += '</div>';
													s += '<div class="text-end">';
													s += '<button class="btn btn-default">';
													s += '<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">'+obj.agreeCount+'</span></span>';
													s += '</button>';
													s += '<button class="btn btn-default">';
													s += '<span class="glyphicon glyphicon-chevron-down opinion"></span>';
													s += '</button>';
													s += '<span>';
													s += '<a class="text-situation text-comment">';
													s += '<span onclick="showComment('+obj.id+', 1, this)">';
													s += '<span class="comment-count"><span class="glyphicon glyphicon-comment"></span> '+obj.commentCount+'条评论</span></span>';
													s += '<span class="hidecomment" style="display: none;"><span class="glyphicon glyphicon-comment"></span> 收起评论</span>';
													s += '</a>';
													s += '<a href="#" class="text-situation">';
													s += '<span class="glyphicon glyphicon-share-alt"></span>';
													s += '<span>分享</span>';
													s += '</a>';
													s += '<a href="#" class="text-situation">';
													s += '<span class="glyphicon glyphicon-star"></span>';
													s += '<span>收藏</span>';
													s += '</a>';
													s += '<a href="#" class="text-situation">';
													s += '<span class="glyphicon glyphicon-heart"></span>';
													s += '<span>感谢</span>';
													s += '</a>';
													s += '<a class="text-situation report" data-placement="bottom" data-html="true" data-content="<ul class=nav nav-pills nav-stacked><li><a href=#>没有帮助</a></li><li><a href=#>举报</a></li></ul>">';
													s += '···';
													s += '</a>';
													s += '</span>';
													s += '<button class="takeback btn btn-info btn-xs">收起</button>';
													s += '</div>';
																				
													/* 评论div */
													s += '<div class="commentdiv">';
													s += '<div class="comment-title">';
													s += '<span style="font-weight: bold;">'+obj.commentCount+'条评论</span>';								
													s += '<a style="cursor: pointer;position: absolute;right: 20px;">切换为时间顺序</a>';
													s += '</div>';
													s += '<div class="separator" style="width: 100%;"></div>';
												
													/*  用户评论 */ 
													s += '<div class="user-commentblock">';
													
													s += '</div>';
													s += '<div class="separator"></div>';
														
														
													/* 评论回答 */
													s += '<div>';
													s += '<form action="${pageContext.request.contextPath}/" method="post">';
													s += '<input class="form-control commentAnswer" type="input" placeholder="写下你的评论"/>';
													s += '<button class="btn btn-info" type="submit">评论</button>';
													s += '</form>';
													s += '</div>';
													s += '</div>';
													s += '</div>';
												
												$("#dynamic").append(s);
												$(".report").popover();
											});
										} else {
											answer_index = -1;
										}
										
									});
						</script>
						
						<div class="answerblock">
							<div class="separator"></div>
							<div class="text-author">
								<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=12">
									<img class="photo" src="${pageContext.request.contextPath}/img/default.jpg" />
								</a>
								<span class="personalmsg">
									<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=12" style="color: black;">
										<div class="name">
											郭哲彪initalize
										</div>
									</a>
										<div class="signal">
											逗比的泪窦久泽可乐喝了
										</div>
									</span>
							</div>
							<div class="text-status">793 人也赞同了该回答</div>
							<div class="text-content">
								TI7的评论席上，国土说WINGS是一个前无古人的战队，刷新了职业战队对于BP的理念。即使那些所谓的灵性外国队，例如液体也只是在后期弄出个先知体系的大招。但wings 的感觉是场场都有大招。
								也许大家都记得wings打MVP放对面PA的大招，用了2套阵容打爆MVP，杀人诛心。但其实第二局的阵容选了 蝙蝠 虚空 JUGG，原本人们都以为会是虚空 1号位 jugg 2号位 蝙蝠三号位（他们当时常用的英雄）。结果是  JUGG 1号位 虚空3 号位 蝙蝠2号位。不能说这个分路的效果有多大，今年TI7 哪个战队敢这么换着玩.
								<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
							</div>
							<div class="text-all">
								<p>TI7的评论席上，国土说WINGS是一个前无古人的战队，刷新了职业战队对于BP的理念。即使那些所谓的灵性外国队，例如液体也只是在后期弄出个先知体系的大招。但wings 的感觉是场场都有大招。</p>
								<p>也许大家都记得wings打MVP放对面PA的大招，用了2套阵容打爆MVP，杀人诛心。但其实第二局的阵容选了 蝙蝠 虚空 JUGG，原本人们都以为会是虚空 1号位 jugg 2号位 蝙蝠三号位（他们当时常用的英雄）。结果是  JUGG 1号位 虚空3 号位 蝙蝠2号位。不能说这个分路的效果有多大，今年TI7 哪个战队敢这么换着玩</p>
								<p>还有WINGS锤爆 EG的两场，1手拉比克 后面连点 抄袭 和谜团。第二局自己ban了戴泽 拿神灵（所有人都以为他们要拿小黑）。领先一分的时候选个TF炸弹的花活，落后一分的时候保持自己的阵容 SK 大鱼 虚空（这场对面选了小娜迦），所有人都在担心小娜迦是大哥，要是TI7 lgd 和NB 的尿性 选完虚空 肯定要补 克制娜迦的 阵容。 </p>
								<p>所有人都看不懂WINGS的阵容，但他们总是能赢 而且还赢的漂亮。TI6 版本英雄 POM GA.  总决赛pom我放你3场， GA体系， 在我这就没赢过。国外队得ban我的小精灵，我也能玩小精灵。有蝙蝠 以后 最后一手敢补斧王的 队伍，敢让斧王打一号位的队伍。 </p>
								<p>总决赛1-0落后的 卡尔被单杀， 虚空开大被 娜迦破解的时候，经济差8K 了。按照 lgd 和NB 的尿性 1号位和3号位 就要开始怂了，应该不知道 怎么接技能了，3号位 要发呆了。我当时躺着床上 手抓着床单 心跳120.结果WINGS 一波 打回来了，上高了， 对面GG 了，。 </p>
								<p>第4局 对面四核 都肥，小鱼  伐木机  POM  夜魔，2塔没破 小鱼 都到 高低杀人了。按照TI7 lgd 和NB 的尿性  应该是开着 BKB 懵逼 或者 OB 人家拆高 然后跳上去送一波  GG。但wings 是 听说 你有夜魔 听说夜魔有A仗 听说是晚上 听说我落后 15k的经济 ，听说 OB那群burden 说让我晚上怂 白天凶。不好意思 0换3 带盾 扫你外塔。</p>
								<p>听说你PA  不到20分钟 暗灭  带盾 还有双倍。 按照按照TI7 lgd 和NB 的尿性 应该是怂在高低，大哥去刷安全的线，酱油挨个送。不好意思 0换6.</p>
								<p>wings 是那个所有人都在感叹 还能这么玩啊的队，是那个在任何劣势都有可能翻盘的队，是那个敢在TI上选炸弹 TF的队 。 他就像是围棋届的 阿尔法狗一样打破了我们原有对于BP 所有陈旧的认识。</p>
								<p>我和我的老伙伴们多想在 这个夏天的末尾再次 听到 龙弟弟说 ：“ig/NB/LFY/lgd你们准备好了嘛？！”</p>
								<p>再次 听到 胖头鱼说 有深意的说道：奇数年？！ 奶子D激情的 呐喊 ： 炸了 炸了 。生日宝说：这不尊重一下？ DC 呵斥单车：你干什么呀？ 还没破路呢。</p>
								<p>MLGB </p>
								<p>GTMD ACE</p>
								<p></p><p></p><p></p>
								<p></p>
								<div class="edit-time">编辑于<span> 2016-03-28</span></div>
							</div>
							<div class="text-end">
								<button class="btn btn-default">
									<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">793</span></span>
								</button>
								<button class="btn btn-default">
									<span class="glyphicon glyphicon-chevron-down opinion"></span>
								</button>
								<span>
									<a class="text-situation text-comment">
										<span onclick="showComment(1, 1, this)">
											<span class="comment-count"><span class="glyphicon glyphicon-comment"></span> 900条评论</span>
										</span>
										<span class="hidecomment" style="display: none;"><span class="glyphicon glyphicon-comment"></span>收起评论</span>
									</a>
									<a href="#" class="text-situation">
										<span class="glyphicon glyphicon-share-alt"></span>
										<span>分享</span>
									</a>
									<a href="#" class="text-situation">
										<span class="glyphicon glyphicon-star"></span>
										<span>收藏</span>
									</a>
									<a href="#" class="text-situation">
										<span class="glyphicon glyphicon-heart"></span>
										<span>感谢</span>
									</a>
									<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
										···
									</a>
								</span>
								<button class="takeback btn btn-info btn-xs">收起</button>
							</div>
							
							<!-- 评论div -->
							<div class="commentdiv">
								<div class="comment-title">
									<span style="font-weight: bold;">11条评论</span>								
									<a style="cursor: pointer;position: absolute;right: 20px;">切换为时间顺序</a>
								</div>
								<div class="separator" style="width: 100%;"></div>
								
								<!-- 用户评论 -->
								<div class="user-commentblock">
									<div class="user-comment">
										<div style="position:relative">
											<a href="#">
												<img class="comment-user-photo" src="${pageContext.request.contextPath}/img/default.jpg" />
												<span style="margin-left: 10px;color: black;">saber</span>
											</a>
											<span class="comment-time">2年前</span>
										</div>
										<div style="margin: 10px 0;">
											阿法冯老师
										</div>
										<div class="comment-situation">
											<a>
												<span class="glyphicon glyphicon-thumbs-up"></span>
												<span>1973</span>
											</a>
											<a class="comment-replybtn">
												<span class="glyphicon glyphicon-edit"></span>
												<span>回复</span>
											</a>
											<a>
												<span class="glyphicon glyphicon-thumbs-down"></span>
												<span>踩</span>
											</a>
											<a>
												<span class="glyphicon glyphicon-flag"></span>
												<span>举报</span>
											</a>
										</div>
										<div class="comment-reply" style="display: none;">
											<form action="${pageContext.request.contextPath}/" method="post">
												<input type="text" class="form-control comment-input" placeholder="回复XXXX"/>
												<div style="text-align: right;">
													<button type="button" class="btn btn-default comment-cancel">取消</button>
													<button type="submit" class="btn btn-info comment-ok">评论</button>
												</div>
											</form>
										</div>
									</div>
									<div class="separator"></div>
								
									<div class="user-comment">
										<div style="position:relative">
											<a href="#">
												<img class="comment-user-photo" src="${pageContext.request.contextPath}/img/default.jpg" />
												<span style="margin-left: 10px;color: black;">archer</span>
											</a>
											<span class="comment-time">2年前</span>
										</div>
										<div style="margin: 10px 0;">
											幸运E
										</div>
										<div class="comment-situation">
											<a>
												<span class="glyphicon glyphicon-thumbs-up"></span>
												<span>1973</span>
											</a>
											<a class="comment-replybtn">
												<span class="glyphicon glyphicon-edit"></span>
												<span>回复</span>
											</a>
											<a>
												<span class="glyphicon glyphicon-thumbs-down"></span>
												<span>踩</span>
											</a>
											<a>
												<span class="glyphicon glyphicon-flag"></span>
												<span>举报</span>
											</a>
										</div>
										<div class="comment-reply" style="display: none;">
											<form action="${pageContext.request.contextPath}/" method="post">
												<input type="text" class="form-control comment-input" placeholder="回复XXXX"/>
												<div style="text-align: right;">
													<button type="button" class="btn btn-default comment-cancel">取消</button>
													<button type="submit" class="btn btn-info comment-ok">评论</button>
												</div>
											</form>
										</div>
									</div>
									<div class="separator"></div>
								
									<div class="user-comment">
										<div style="position:relative">
											<a href="#">
												<img class="comment-user-photo" src="${pageContext.request.contextPath}/img/default.jpg" />
												<span style="margin-left: 10px;color: black;">caster</span>
											</a>
											<span class="comment-time">2年前</span>
										</div>
										<div style="margin: 10px 0;">
											西呢西呢,统统西呢
										</div>
										<div class="comment-situation">
											<a>
												<span class="glyphicon glyphicon-thumbs-up"></span>
												<span>1973</span>
											</a>
											<a class="comment-replybtn">
												<span class="glyphicon glyphicon-edit"></span>
												<span>回复</span>
											</a>
											<a>
												<span class="glyphicon glyphicon-thumbs-down"></span>
												<span>踩</span>
											</a>
											<a>
												<span class="glyphicon glyphicon-flag"></span>
												<span>举报</span>
											</a>
										</div>
										<div class="comment-reply" style="display: none;">
											<form action="${pageContext.request.contextPath}/" method="post">
												<input type="text" class="form-control comment-input" placeholder="回复XXXX"/>
												<div style="text-align: right;">
													<button type="button" class="btn btn-default comment-cancel">取消</button>
													<button type="submit" class="btn btn-info comment-ok">评论</button>
												</div>
											</form>
										</div>
									</div>
									<div class="separator"></div>
									
									<!-- 翻页 -->
									<div style="padding:10px 0;text-align: center;">
										<ul class="pagination" style="margin:auto">
										  <li class="disabled"><a href="#">&laquo;</a></li>
										  <li class="active"><a href="#">1</a></li>
										  <li><a href="#">2</a></li>
										  <li><a href="#">3</a></li>
										  <li><a href="#">4</a></li>
										  <li><a href="#">...</a></li>
										  <li><a href="#">5</a></li>
										  <li><a href="#">&raquo;</a></li>
										</ul>		
									</div>
								</div>
								
								<div class="separator"></div>						
								<!--评论回答-->
								<div>
									<form action="${pageContext.request.contextPath}/" method="post">
										<input class="form-control commentAnswer" type="input" placeholder="写下你的评论"/>
										<button class="btn btn-info" type="submit">评论</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				
				
					<!--写答案-->
					<div id="answereditordiv" style="margin-bottom: 300px;position:relative;display:none">
						<script id="editorId" type="text/plain" style="width:700px;height:200px;">写回答...</script>
						<div style="margin-top:10px">
							<label class="checkbox-inline"><input type="checkbox" name="anonymous" value="1">匿名提交</label>
							<button class="btn btn-info" style="position:absolute;right:0;">提交回答</button>
						</div>
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
					</script>
				</div>
				
				<!--右侧导航栏div-->
				<div id="rightDiv">
				
					<div id="icoDiv">
						<div style="font-weight: bold;padding: 13px;">相关问题</div>
						<div style="background-color: #F0F2F7;height: 1px;"></div>
						<div style="padding:8px 15px;font-size: 14px;">
							<a href="#" style="">下一个最火爆的电子竞技游戏会是什么样的？</a>
							<span style="color: darkgray;"> 62 个回答</span>
						</div>
						<div style="padding:8px 15px;font-size: 14px;">
							<a href="#" style="">玩刀塔你说过或者听过最霸气的话？</a>
							<span style="color: darkgray;"> 546 个回答</span>
						</div>
						<div style="padding:8px 15px;font-size: 14px;">
							<a href="#" style="">游戏难度和游戏本身乐趣是否相关？</a>
							<span style="color: darkgray;"> 22 个回答</span>
						</div>
						<div style="padding:8px 15px;font-size: 14px;">
							<a href="#" style="">大神看菜鸟玩游戏是种什么体验？ </a>
							<span style="color: darkgray;"> 458 个回答</span>
						</div>
						<div style="padding:8px 15px;font-size: 14px;">
							<a href="#" style="">Dota 2 还能在中国继续爆红吗？ </a>
							<span style="color: darkgray;"> 107 个回答</span>
						</div>
					</div>
					
					<div id="rootDiv">
						<div>
							<a class="footchain" href="#">赵日天</a>
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