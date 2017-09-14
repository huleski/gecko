<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>个人主页</title>
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
				height: 130px;
				background-color: darkgray;
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
			
			#uploadphotobtn {
				position: absolute;
				right: 25px;
				top: 25px;
				padding-left: 15px;
				padding-right: 15px;
				background-color: darkgray;
				border: 1px solid #F3F3F3;
				color: #F3F3F3;
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
			
			#editpersonal {
				position: absolute;
				right: 0px;
				bottom: 0px;
				border: deepskyblue 1px solid;
				color: deepskyblue;
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

		<script type="text/javascript">
			$(function() {
				$(".topmenu").hover(function() {
						$(this).css("color", "lightslategray");
					},
					function() {
						$(this).css("color", "darkgray");
					});

				$("#uploadphotobtn").hover(function() {
					$("#uploadphotobtn").css("background-color", "#C1C1C1");
				}, function() {
					$("#uploadphotobtn").css("background-color", "darkgray");
				});
				
				$(".text-content").hover(function() {
					$(this).css("color", "darkgray");
				}, function() {
					$(this).css("color", "black");
				});

				$(".answerblock").hover(function() {
					$(this).find(".closeblock").show();
				}, function() {
					$(this).find(".closeblock").hide();
				});

				$(".text-content").click(function() {
					$(this).hide();
					var $answer = $(this).parent(".answerblock");
					$answer.find(".text-all").show();
					$answer.find(".takeback").show();
				});
				$(".takeback").click(function() {
					$(this).hide();
					var $answerblock = $(this).parents(".answerblock");
					$answerblock.find(".text-all").hide();
					$answerblock.find(".text-content").show();
				});
				$(".closeblock").click(function() {
					$(this).parents(".answerblock").hide();
				});
				
				$(".report").popover();
				
				$(".text-comment").click(function() {
					$(this).parents(".answerblock").find(".commentdiv").toggle();
					$(this).find(".comment-count").toggle();
					$(this).find(".hidecomment").toggle();
				});
				
				$(".comment-replybtn").click(function() {
					$(this).parent(".comment-situation").hide();
					$(this).parent(".comment-situation").next(".comment-reply").show();
				});
				
				$(".comment-cancel").click(function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
				/*回到顶部*/
				$("#gotobtn").click(function() {
					 $('body,html').animate({scrollTop:0}, 500);
				});
				
				$(window).scroll( function() {
					if($(this).scrollTop() > 1000) {
						$("#gotobtn").show();
					} else {
						$("#gotobtn").hide();
					}
				});
				
				//查看详细资料
				$("#moreMsg").click(function() {
					$(this).hide();
					$("#scrollMsg").show();
					$("#simpleInfo").hide();
					$("#completedInfo").show();
				});
				//收起详细资料
				$("#scrollMsg").click(function() {
					$(this).hide();
					$("#moreMsg").show();
					$("#simpleInfo").show();
					$("#completedInfo").hide();
				});
				
				// 滑动到页面底部实现自动加载
				var totalheight = 0;
				var question_index = 0;
				$(window).scroll(function() {
					totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
					if((totalheight >= $(document).height()) && question_index >= 0) {
						var tabId = $(".tab-pane:visible").attr("id");
						if(tabId == "question") {
							$.getJSON("${pageContext.request.contextPath}/questionServlet", 
									{"method":"ajaxLoad","currentPage": ++question_index, "personId":"${person.id}"}, 
									function(result) {
										if(result != "") {
											$("#noQuestion").css("display", "none");
											$(result).each(function(i, obj) {
												$("#question").append(
													"<div class='question-div'>"+
													"<div><a class='question-title' href='${pageContext.request.contextPath}/questionServlet?method=findById&id=${obj.id}'>" + obj.title + "</a></div>" +
													"<div class='question-state'>"+
													"<span>" + new Date(obj.date.time).format("yyyy-MM-dd") +"</span>"+
													"<span>" + obj.answerList.length + " 个回答</span>"+
													"<span>" + obj.watchCount + " 个关注</span>"+
													"</div></div>" + 
													"<div class='separator'></div>"
												);
											});
										} else {
											$("#question").append("<h4 style='margin:80px 0;text-align:center'>全部装填完毕,没有更多了</h4>");
											question_index = -1;
										}
							});
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
			});
		</script>
	</head>

	<body>
		<div>
			<!-- 引入导航栏 -->
			<%@ include file="/jsp/header1.jsp" %>

			<!--个人展示div-->
			<div id="personalshow">
				<div id="topdiv">
					<button class="btn" id="uploadphotobtn">
						<span class="glyphicon glyphicon-camera" ></span>
						上传封面图片
					</button>
				</div>
				<div id="bottomdiv">
					<div id="photoback">
						<img src="${pageContext.request.contextPath}/img/defaultbig.jpg" id="personalimg" />
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
							<c:if test="${count < 3}">
								<c:if test="${not empty person.description}"><div><i class="fa fa-info-circle fa-fw fa-lg"></i><span class="icoValue">${person.description }</span></div><c:set value="${count + 1 }" var="count"/></c:if>
							</c:if>		
						</div>
						
						<div id="completedInfo">
							<c:if test="${not empty person.sex}"><div><label>性别</label><span class="icoValue">${person.sex }</span></div></c:if>
							<c:if test="${not empty person.sentence}"><div><label>一句话介绍</label><span class="icoValue">${person.sentence }</span></div></c:if>
							<c:if test="${not empty person.address}"><div><label>居住地</label><span class="icoValue">${person.address }</span></div></c:if>
							<c:if test="${not empty person.industry}"><div><label>所在行业</label><span class="icoValue">${person.industry }</span></div></c:if>
							<c:if test="${not empty person.profession}"><div><label>职业经历</label><span class="icoValue">${person.profession }</span></div></c:if>
							<c:if test="${not empty person.education}"><div><label>教育经历</label><span class="icoValue">${person.education }</span></div></c:if>
							<c:if test="${not empty person.description}"><div><label>个人简介</label><span class="icoValue">${person.description }</span></div></c:if>
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
							<button type="button" class="btn btn-default" id="editpersonal" onclick="window.location.href='${pageContext.request.contextPath}/userServlet?method=editUserUI'">编辑个人资料</button>
						</c:if>
						<c:if test="${user.id != person.id}">
							<button type="button" class="btn btn-default" id="editpersonal" onclick="window.location.href='#'">关注他</button>
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
							<a href="#dynamic" data-toggle="tab">动态</a>
						</li>
						<li>
							<a href="#answer" data-toggle="tab">回答 0</a>
						</li>
						<li>
							<a href="#question" data-toggle="tab">提问 0</a>
						</li>
						<li>
							<a href="#article" data-toggle="tab">文章 0</a>
						</li>
						<li>
							<a href="#column" data-toggle="tab">专栏 0</a>
						</li>
						<li>
							<a href="#share" data-toggle="tab">分享 0</a>
						</li>
						<li class="btn-group">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								更多 <span class="glyphicon glyphicon-chevron-down"></span>
							</a>
							<ul class="dropdown-menu nav nav-pills nav-stacked" role="menu">
								<li>
									<a href="#">收藏 5</a>
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
				<div class="tab-content">
					<!-- 动态板块 -->
					<div class="tab-pane active" id="dynamic">
						<div style="height: 1px;background-color: #F0F2F7;"></div>
						<div style="padding: 12px 0 12px 20px;font-weight: bold;font-size: 15px;">我的动态</div>
						
						<div class="separator"></div>
						<div class="answerblock">
							<div class="text-dynamic">
								赞同了回答
								<span style="float: right;top: -10px;right: -10px;">5天前</span>
							</div>
							<div class="text-title">
								<a href="#" class="text-title-a">你有哪些一鸣惊人的操作？</a>
							</div>
							<div class="text-author">
								<a href="#"><img class="photo" src="${pageContext.request.contextPath}/img/dynamic01.jpg" /></a>
								<span class="personalmsg">
									<div class="name">
										<a href="#" style="color: black;">Seasee Youl</a>
									</div>
									<div class="signal">
										为何中意我我这种无赖，是话你蠢还是太伟大
									</div>
								</span>
							</div>
							<div class="text-status">16188 人也赞同了该回答</div>
							<div class="text-content">
								某个远房亲戚，因为在某个国营企业里当个小领导有点钱，所以经常做一些仗势欺人的事。 比如吃饭的时候，他就大咧咧的坐在上席（也就是对着门的那个位置），但是懂礼数的人都知道那个位置一般是给家里老人坐的，他却一副老子天下第一的姿态坐那谈笑风生。 吃完饭后别人给他敬烟，一看别人发的是十几块钱的，就用手挡回去说不想抽，别人刚走开就拿出
								<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
							</div>
							<div class="text-all">
								<p>因为毛子能死磕</p>
								<p>上大学（哈工大计算机）的时候老师讲过一个段子：我系自然语言识别团队搞了一套语音识别，准确率还可以，就是这个性能实在是差，识别普通长度的话要10秒，这边的团队死活优化不了了。然后送给了毛子的科学家去优化，优化了2个月性能提高到了1.2秒。</p>
								<p>然后我校师生们就好奇TMD毛子怎么干的啊，就开始撸毛子改过的C语音代码，然后就发在代码里现了一堆类似这样的东西：* * * * *struct —— 5层指针，懂C语言的都知道这意味着什么。代码的原作者们一脸懵逼——因为完全看不出来这特么是我写的代码。</p>
								<p><br></p>
								<p>而实际上毛子们在各个领域都有这种死磕精神：</p>
								<p>航空：</p>
								<blockquote>米格-25为了使速度达到3马赫， 至今仍是人类仅有的两种闯过热障的大气层内飞行器。那问题就来了，3.2马赫的速度造成了空气与机体强烈摩擦，温度可以达到300摄氏度以上，而当时最好的铝合金的工作温度也就130度。毛子是怎么解决这个问题的呢？美国科学家仿佛找到了一个答案:那就是苏联人一定是突破了大型钛合金部件的加工技术，使得米格25使用了大量钛合金材料。如果这是真的，那在当时的轰动程度不亚于中国队勇夺世界杯。不过美国科学家还是too young too simple，sometimes naive了，毛子自有毛子的解决方法，那就是，前无古人后无来者的使用不锈钢。真的太好了，完全没有烦恼了。不锈钢上千度都没事，怕他300度个卵。但是，不锈钢比铝合金要重好多，造成了米格25空重就达到20吨以上。<br>但是要把20吨重的【战斗机】推上天，发动机产生的热量会把发动机仓融化——丧心病狂的毛子工程师竟然为发动机外面加上了银网来把热辐射给反射回发动机。。。</blockquote>
								<p>只能说毛子确实是开挂的民族。。。</p>
								<p></p>
							</div>
							<div class="text-end">
								<button class="btn btnpressed">
							<span class="glyphicon glyphicon-chevron-up"><span class="keepgap">10K</span></span>
						</button>
								<button class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-down opinion"></span>
						</button>
								<span>
								<a class="text-situation text-comment">
									<span class="glyphicon glyphicon-comment"></span>
									<span class="comment-count">900条评论</span>
									<span class="hidecomment" style="display: none;">收起评论</span>
								</a>
								<a class="text-situation">
									<span class="glyphicon glyphicon-share-alt"></span>
									<span>分享</span>
								</a>
								<a class="text-situation">
									<span class="glyphicon glyphicon-star"></span>
									<span>收藏</span>
								</a>
								<a class="text-situation">
									<span class="glyphicon glyphicon-heart"></span>
									<span>感谢</span>
								</a>
								<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
									···
								</a>
								</span>
								<button class="takeback btn btn-info btn-xs">收起</button>
							</div>
							
						<div class="commentdiv">
							<div class="comment-title">
								<span style="font-weight: bold;">11条评论</span>								
								<a style="cursor: pointer;position: absolute;right: 20px;">切换为时间顺序</a>
							</div>
							<div class="separator" style="width: 100%;"></div>
							
							<!--用户评论-->
							<div class="user-comment">
								<div style="position:relative">
									<a href="#">
										<img class="comment-user-photo" src="${pageContext.request.contextPath}/img/default.jpg" />
										<span style="margin-left: 10px;color: black;">you conquer</span>
									</a>
									<span class="comment-time">2年前</span>
								</div>
								<div style="margin: 10px 0;">
									阿法狗,阿萨德立即;ad离开家阿斯蒂芬;啊看见的
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
										<span style="margin-left: 10px;color: black;">you conquer</span>
									</a>
									<span class="comment-time">2年前</span>
								</div>
								<div style="margin: 10px 0;">
									阿法狗,阿萨德立即;ad离开家阿斯蒂芬;啊看见的
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
										<span style="margin-left: 10px;color: black;">you conquer</span>
									</a>
									<span class="comment-time">2年前</span>
								</div>
								<div style="margin: 10px 0;">
									阿法狗,阿萨德立即;ad离开家阿斯蒂芬;啊看见的
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
							
							<!--回复评论-->
							<div>
								<form action="${pageContext.request.contextPath}/" method="post">
									<input class="form-control commentAnswer" type="input" placeholder="写下你的评论"/>
									<button class="btn btn-info" type="submit">评论</button>
								</form>
							</div>
						</div>
							
					</div>
						
						<div class="separator"></div>
						<div class="answerblock">
							<div class="text-dynamic">
								赞同了回答
								<span style="float: right;top: -10px;right: -10px;">14天前</span>
							</div>
							<div class="text-title">华为做了哪些恶？</div>
							<div class="text-author">
								<img class="photo" src="${pageContext.request.contextPath}/img/dynamic02.png" />
								<span class="personalmsg">
								<div class="name">
									阿噗
								</div>
								<div class="signal">
									你才傲娇哼
								</div>
								</span>
							</div>
							<div class="text-status">23874人也赞同了该回答</div>
							<div class="text-content">
								由于供应链牛肉的严重缺货，我们不得不用猪肉代替！一顿火锅的整体口感不是某一种食材决定的,我们已经从火锅的底料、蘸料等环节进行了口味的优化调理，所以即使用猪肉甚至鸡肉都可以让您吃到正宗牛肉的味道！！！希望广大客户不要轻信友商的挑唆，一如既往的支持我们的火锅店！
								<a href="#" class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span>
								</a>
							</div>
							<div class="text-end">
								<button class="btn btn-default active">
							<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">1.8K</span></span>
						</button>
								<button class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-down opinion"></span>
						</button>
								<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
								<span>102条评论</span>
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
								<a href="#" class="text-situation" style="font-size: 16px;font-weight: bold;">
									···
								</a>
								</span>
							</div>
						</div>
						<div class="answerblock">
							<div class="separator"></div>
							<div class="text-dynamic">
								路人甲 赞同了回答1 天前
								<span style="float: right;top: -10px;right: -10px;">15天前</span>
							</div>
							<div class="text-title">你最庆幸自己当初做了什么事？</div>
							<div class="text-author">
								<img class="photo" src="${pageContext.request.contextPath}/img/dynamic01.jpg" />
								<span class="personalmsg">
								<div class="name">
							Seasee Youl
						</div>
								<div class="signal">
							为何中意我我这种无赖，是话你蠢还是太伟大
						</div>
						</span>
							</div>
							<div class="text-status">5234人也赞同了该回答</div>
							<div class="text-content">
								半年前，我和朋友看完话剧出来，广州的友谊剧院离火车站很近，我们路过火车站附近的天桥时见到一个奇怪的人。 一个十七八岁的少年，蹲在地上哭泣。 他留着长头发，背着一个破旧的双肩包，把脸埋在头发之中，偶尔擦一下眼泪。周围的行人来来往往，注意到他这种奇怪的行径后拉着同伴匆匆而行。那时已经十点多了，这孩子蹲在天桥上无助的样子让我觉得
								<a href="#" class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
							</div>
							<div class="text-end">
								<button class="btn btn-default active">
									<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">19K</span></span>
								</button>
								<button class="btn btn-default">
									<span class="glyphicon glyphicon-chevron-down opinion"></span>
								</button>
								<span>
									<a href="#" class="text-situation">
										<span class="glyphicon glyphicon-comment"></span>
										<span>1120条评论</span>
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
									<a href="#" class="text-situation" style="font-size: 16px;font-weight: bold;">
										···
									</a>
								</span>
							</div>
						</div>
						

						<div class="separator"></div>
						<div class="answerblock">
							<div class="text-dynamic">
								来自话题: 互联网
								<span style="float: right;top: -10px;right: -10px;">20天前</span>
							</div>
							<div class="text-title">你为什么卸载美团？</div>
							<div class="text-author">
								<img class="photo" src="${pageContext.request.contextPath}/img/annoymouse.jpg" />
								<span class="personalmsg">
								<div class="name">
							杨剑锋
						</div>
								<div class="signal">
							 &nbsp;
						</div>
						</span>
							</div>
							<div class="text-status">5234人也赞同了该回答</div>
							<div class="text-content">
								<img src="${pageContext.request.contextPath}/img/wudi.png" width="190" height="105" /> 凭这个
								<a href="#" class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
							</div>
							<div class="text-end">
								<button class="btn btn-default active">
							<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">19K</span></span>
						</button>
								<button class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-down opinion"></span>
						</button>
								<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
								<span>738条评论</span>
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
								<a href="#" class="text-situation" style="font-size: 16px;font-weight: bold;">
									···
								</a>
								</span>
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
						<div style="height: 280px;padding-top: 80px;">
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
						<div style="height: 280px;padding-top: 80px;">
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
						<span style="margin-left: 10px;">获得 1 次赞同</span>
					</div>
				</div>
				<div id="subscribe">
					<span style="position:relative;left: 50px;">
						<span style="color: darkgray;">关注了</span>
					<span style="font-size: 19px;position: relative;top: 25px;left: -35px;">16</span>
					</span>
					<span style="position:relative;left: 100px;">
						<span style="color: darkgray;">关注者</span>
					<span style="font-size: 19px;position: relative;top: 25px;left: -48px;">1848</span>
					</span>
				</div>
				<div id="navDiv">
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="#">
							关注的话题
							<span class="navtitle">9</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="#">
							关注的专栏
							<span class="navtitle">2</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="#">
							关注的问题
							<span class="navtitle">89</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<a href="#">
							关注的收藏夹
							<span class="navtitle">0</span>
						</a>
					</div>
					<div class="navseparator"></div>
					<div class="navlayer">
						<span style="color: #337AB7;">个人主页被浏览 239</span>
					</div>
					<div class="navseparator"></div>
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
		
			<!--回到顶部-->
			<a id="gotobtn" style="position: fixed;bottom: 120px;right: 400px;display: none;">
				<button class="glyphicon glyphicon-arrow-up btn" style="font-size: 20px;padding: 5px 10px;"></button>
			</a>
		
			<!--反馈Modal-->
			<%@ include file="/jsp/feedback.jsp" %>
		</div>
	</body>

</html>