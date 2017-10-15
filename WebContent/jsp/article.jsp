<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>${article.title }</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<link href="${pageContext.request.contextPath}/font_awesome/css/font-awesome.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<style type="text/css">
			#authorPhoto{
				width:40px;
				height:40px;
			}
			.text-situation{
				margin-right:20px;
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
		</style>
		<script type="text/javascript">
			$(function() {
				$("#commentdiv").on("click", ".comment-replybtn", function() {
					if("${user}" == "") {
						$('#loginModal').modal();
					} else {
						$(this).parent(".comment-situation").hide();
						$(this).parent(".comment-situation").next(".comment-reply").show();
					}
				});
				
				$("#commentdiv").on("click", ".comment-cancel", function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
				//检测答案评论输入框是否有值,有才能提交评论
				$("#commentdiv").on("keyup", ".commentInput", function() {
					if (this.value != "") {
						$(this).next(".commentSubmitBtn").attr("disabled", false);
					} else {
						$(this).next(".commentSubmitBtn").attr("disabled", true);
					}
				});
				
				//检测评论回复输入框是否有值,有才能提交评论
				$("#commentdiv").on("keyup", ".comment-input", function() {
					if (this.value != "") {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", false);
					} else {
						$(this).next(".comment-reply-opr").find(".comment-ok").attr("disabled", true);
					}
				});
				
				$("#commentinput").focus(function(){
					$("#commentbtnDiv").show();					
				});
				$("#commentinput").keyup(function(){
					if(this.value != ""){
						$("#submitComment").attr("disabled", false);					
					} else {
						$("#submitComment").attr("disabled", true);
					}
				});
				
				$("#cancleComment").click(function(){
					$("#commentbtnDiv").hide();
				});
				
				showComment("${article.id}", 1);
			});
			
			//ajax加载评论
			function showComment(aid, currentPage) {
				$.post("${pageContext.request.contextPath}/commentServlet", {"method":"ajaxLoad","targetId":aid, "currentPage": currentPage, "type":2}, 
					function(result) {
						$("#commentdiv").html(result);
				});
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
			
			function submitComment(aid) {
				if("${user}" == "") {
					$("#loginModal").modal();
					return;
				}
				
				var content = $("#commentinput").val();
				$("#commentinput").val("");
				$.post("${pageContext.request.contextPath}/commentServlet", {"method":"add", "type":2, "targetId":aid, "content":content}, 
					function(result) {
					
				});
			}
			
			function disagree(aid) {
				if("${user}" == "") {
					$("#loginModal").modal();
					return;
				}
					
				$("#disagreebtn").toggle();
				$("#agreebtn").toggle();
				$.post("${pageContext.request.contextPath}/articleServlet", {"method":"disagree","aid":aid});
			}
			
			function agree(aid) {
				if("${user}" == "") {
					$("#loginModal").modal();
					return;
				}
				
				$("#disagreebtn").toggle();
				$("#agreebtn").toggle();
				$.post("${pageContext.request.contextPath}/articleServlet", {"method":"agree","aid":aid});
			}
		</script>
	</head>
	<body>
	
		<!-- 引入登录模态框 -->
		<%@ include file="/jsp/loginmodal.jsp" %>
		
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
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="font-size: 30px;">逼</a>
		  </div>
		
		  <!-- Collect the nav links, forms, and other content for toggling -->
		  <div class="collapse navbar-collapse navbar-ex1-collapse">
		  	
		    <div style="width:660px;margin:auto;margin-top:5px">
		      	<a href="${pageContext.request.contextPath}/userServlet?method=findById&id=${article.user.id}"><img id="authorPhoto" class="img-circle" src="${pageContext.request.contextPath}/${article.user.photo}"/></a></li>
		     	<span style="font-weight:bold;margin-left:10px">${article.user.name}</span>
		    </div>
		    <ul class="nav navbar-nav navbar-right" style="position:absolute;top:0;right:30px">
		      <li><a href="${pageContext.request.contextPath}/jsp/articleedit.jsp" style="font-size: 17px;"><span class="glyphicon glyphicon-file"></span> 写文章</a></li>
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
		
		<div style="margin: auto;width: 660px;position:relative">
			<img width="660px" src="${pageContext.request.contextPath}/${article.titlePicture}"/>
			<div style="margin:20px 0;font-size:32px;font-weight:bold;">
				${article.title}
			</div>
			<div style="line-height:1.8;font-size:16px">
				${article.content}
			</div>
			<div style="margin:20px 0">
				<span style="background-color: lightgray;padding: 8px 13px;border-radius: 20px;">${article.topic.name}</span>
			</div>
			<div style="position:relative">
				<c:if test="${article.agree == 1}">
					<button id="disagreebtn" onclick="disagree(${article.id})" class="btn btn-info" ><li class="fa fa-thumbs-up"></li> ${article.agreeCount}</button>
					<button id="agreebtn" onclick="agree(${article.id})" class="btn btn-default" style="border: deepskyblue 1px solid;color: deepskyblue;display:none"><li class="fa fa-thumbs-up"></li> ${article.agreeCount - 1}</button>
				</c:if>
				<c:if test="${article.agree != 1}">
					<button id="disagreebtn" onclick="disagree(${article.id})" class="btn btn-info" style="display:none"><li class="fa fa-thumbs-up"></li> ${article.agreeCount + 1}</button>
					<button id="agreebtn" onclick="agree(${article.id})" class="btn btn-default" style="border: deepskyblue 1px solid;color: deepskyblue;"><li class="fa fa-thumbs-up"></li> ${article.agreeCount}</button>
				</c:if>
				<div style="position:absolute;top:8px;right:10px;">
					<a href="#" class="text-situation">
						<span class="glyphicon glyphicon-star"></span>
						<span>收藏</span>
					</a>
					<a href="#" class="text-situation">
						<span class="glyphicon glyphicon-share-alt"></span>
						<span>分享</span>
					</a>
					<a href="#" class="text-situation">
						<li class="fa fa-exclamation-circle"></li>
						<span>举报</span>
					</a>
				</div>
			</div>
			<div style="position:relative;margin:20px 0">
				<span style="font-size:16px;font-weight:bold">${article.commentCount} 条评论</span>
				<div style="height:1px;background-color:gray;position:absolute;right:0;top:10px;width:85%;"></div>
			</div>
			<div style="margin:30px">
				<div>
					<textarea id="commentinput" class="form-control" rows="4" style="font-size: 18px;" placeholder="写下你的评论..." required=""></textarea>
				</div>
				<div id="commentbtnDiv" style="margin:10px 0;text-align:right;display:none">
					<button id="cancleComment" type="button" class="btn btn-default" >取消</button>
					<button id="submitComment" type="button" class="btn btn-info" disabled="" onclick="submitComment(${article.id})">评论</button>
				</div>
			</div>
			<div id="commentdiv" style="margin-bottom:100px"></div>	
		</div>
		
		
		<!--反馈Modal-->
		<%@ include file="/jsp/feedback.jsp" %>

	</body>
</html>
