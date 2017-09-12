<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>如何看待ti7之后存在一些wings清流粉无脑吹wings并且贬低其他队伍的现象？</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
				height: 50px;
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
			}
			
			.answerblock .text-end {
				padding-bottom: 20px;
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
			
			.separator {
				width: 99%;
				height: 1px;
				background-color: #F0F2F7;
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
				var i = 0;
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
				
			});
			
			//点击回答
			function writeAnswer(){
				if("${user}" == null) {
					$('#loginModal').modal();
				} else {
					$("#answereditordiv").show();
					location.href = "#answereditordiv";
				}
			}
			
		</script>
	</head>
	<body>
		<!--提问模态框-->
 		<%@ include file="/jsp/askmodal.jsp" %>
 		
		<!--反馈模态框-->
		<%@ include file="/jsp/feedback.jsp" %>
		
		<!-- 未登录模态框 -->
		<%@ include file="/jsp/loginmodal.jsp" %>
		
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
							<form action="#" method="get" style="display: inline;">
								<input type="text" placeholder="搜索你感兴趣的内容..." style="width: 315px;height: 35px;border-top-left-radius: 3px;border-bottom-left-radius: 3px;border: 0;
									position: relative;left: 30px;top: 2px;padding-left: 10px;background-color: #F7F8FA;"/>
								<button type="submit" class="btn btn-default" style="background-color: #F7F8FA;height: 35px;width:40px;border: 0;position: relative;left: -15px;">
			  						<span class="glyphicon glyphicon-search" style="color: lightgray;font-size: 18px;"></span>
								</button>
							</form>
							<button onclick="writeQuestioin()" type="button" class="btn btn-info" style="width:60px;font-size: 14px;">提问</button>
						</span>
					</span>
					<span style="margin-left: 150px;">
						<a href="#">
							<span class="glyphicon glyphicon-bell topmenu" style="font-size: 22px;color: lightgray;"></span>
							<span class="markcount">42</span>
						</a>
						<a href="#" style="margin-left: 30px;">
							<span class="glyphicon glyphicon-comment topmenu" style="font-size: 22px;color: lightgray;"></span>
						</a>
						<a href="home.html" style="margin-left: 30px;position: relative;top: -5px;">
							<img src="${pageContext.request.contextPath}/img/default.jpg" height="30px" />
						</a>
					</span>
				</div>	
				<div id="outline" style="position: relative;margin: auto;width: 1010px;display: none;">
					<div style="position: absolute;top:10px;text-align: left;font-weight: bold;font-size: 22px;width: 700px;">
						如何看待ti7之后存在一些wings清流粉无脑吹wings并且贬低其他队伍...
					</div>
					<span style="position: absolute;top:8px;right: 20px;">
						<button type="button" class="btn btn-info" id="focusquestion" onclick="">关注问题</button>
						<button type="button" class="btn btn-default" id="writeanswer" onclick="writeAnswer()">
							<span class="glyphicon glyphicon-pencil"></span>
							写回答
						</button>
					</span>
				</div>
				<div style="position: absolute;top: 50px;height: 1px;width: 100%;background-color: lightgray;"></div>
			</div>

			<!--问题div-->
			<div id="topdiv">
				<div style="width: 1000px;position: relative;margin:auto;">
					<div style="width:700px;">
						<div id="questionResume" style="margin-right: 50px;">
							<a href="#">生活</a>
							<a href="#">人生</a>
							<a href="#">成长</a>
							<a href="#">青春</a>
							<a href="#">苦难</a>
						</div>
						<div id="questiontitle">如何看待ti7之后存在一些wings清流粉无脑吹wings并且贬低其他队伍的现象？</div>
						<div style="font-size: 15px;line-height:1.7;margin-top: 10px;">
							搞不懂了，Ti7都打完了，Wings都快凉了，这时候一堆清流粉还在疯狂吹Wings的BP，把Wings拉出来一遍又一遍鞭尸yy，恨不得Ti7打得都是垃圾局，只有Ti6的Wings古往今来第一吊。题主也打了七年DotA了，作为一个Wings粉和液体粉，我始终认为一代版本一代神，每个Ti冠军都代表当前版本的最高水平，无法进行对比，尤其是Ti6后的7.0，都看到Wings糟糕的表现了吧，我的心里也很难受，却不得不承认Wings已经不适合这个版本了。现在看到这样的问题，真是疯狂给Wings招黑，题主感到悲哀，愤怒，不解。
							<a href="#"></a></div>
						<div id="titlelabelcolumn" style="margin: 15px 0;padding-bottom: 20px;">
							<a href="#" class="titlelabel">
								<span class="glyphicon glyphicon-comment"></span>
								<span>105条评论</span>
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
							<div style="font-size: 18px;">487</div>
						</div>
						<div style="float: left;width: 100px;text-align: center;">
							<div style="color: darkgray;">被浏览</div>
							<div style="font-size: 18px;">749375</div>
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
						<span style="font-weight: bold;font-size: 15px;">285 个回答</span>
						<span style="position: absolute;right: 20px;">默认排序</span>
					</div>
					
					<!--用户个人回答板块-->
					<div class="answerblock">
						<div class="separator"></div>
						<div class="text-author">
							<a href="#">
								<img class="photo" src="${pageContext.request.contextPath}/img/ace.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										郭哲彪
									</div>
								</a>
									<div class="signal">
										逗比的泪窦久泽可乐喝了
									</div>
								</span>
						</div>
						<div class="text-status">793 人也赞同了该回答</div>
						<div class="text-content">
							<p>TI7的评论席上，国土说WINGS是一个前无古人的战队，刷新了职业战队对于BP的理念。即使那些所谓的灵性外国队，例如液体也只是在后期弄出个先知体系的大招。但wings 的感觉是场场都有大招。</p>
							<p>也许大家都记得wings打MVP放对面PA的大招，用了2套阵容打爆MVP，杀人诛心。但其实第二局的阵容选了 蝙蝠 虚空 JUGG，原本人们都以为会是虚空 1号位 jugg 2号位 蝙蝠三号位（他们当时常用的英雄）。结果是  JUGG 1号位 虚空3 号位 蝙蝠2号位。不能说这个分路的效果有多大，今年TI7 哪个战队敢这么换着玩。</p>
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
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">793</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>450条评论</span>
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
						<div class="text-author">
							<a href="#">
								<img class="photo" src="${pageContext.request.contextPath}/img/yeyin.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										叶隐
									</div>
								</a>
									<div class="signal">
										这个人很懒,什么也没留下
									</div>
								</span>
						</div>
						<div class="text-status">278 人也赞同了该回答</div>
						<div class="text-content">
							<p>本人3000分鱼塘虾米，去年ti全是睡醒看战报，一年以来大赛也是有空看几场的节奏，既不是wings粉，也不是NB黑，属于有些回答中比赛没看几场，各大战队的成员都认不全的纯路人一个......TI7的淘汰赛中国队一场不拉，最后2天通宵看完的。几支中国队啥表现，来来去去几个问题，无数答主都写的很透彻了。在无数回答中字里行间流露出的对wings的各种怀念和吹捧，于是我把TI6淘汰赛的11场比赛全都找出来从BP到赛后全看了一遍........然后看到了题主这个问题............</p>
							<p></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>
							<p>这他么就很尴尬了.......你说不吹wings？难道吹NB么？</p>
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">278</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>145条评论</span>
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
						<div class="text-author">
							<a href="#">
								<img class="photo" src="${pageContext.request.contextPath}/img/windsnow.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										风雪
									</div>
								</a>
									<div class="signal">
										老想着做游戏设计的游戏程序员
									</div>
								</span>
						</div>
						<div class="text-status">248 人也赞同了该回答</div>
						<div class="text-content">
							<p>如果不是wings，第一个被破的是偶数年魔咒，哪还有人有精力盯着中国队什么时候破奇数年魔咒。</p>
							<p>液体今年这么强，听到最多的也只是强无敌，但没有出现新的东西。<br>
							所以ti7在整体观赏性上不如ti6，ob解说的时候也说了今年看不到什么新东西，即便英雄的上场数量居高不下，但总给人一种差点什么的感觉。<br>
							wings在ti6获得的评语是什么？是：这tm玩的才是dota。<br>
							曾几何时，我们专注于基本功，执行力，我们每次说外国队的不足就是打的不够稳，而最后呢，在中国dota最危急的时候，打的最不稳的那支中国队打出了其他中国队身上都看不见的上限实力。<br>
							我不怕中国队输，怕的是看不到赢的机会的输，这也是为什么我们都会为老肥羊呐喊助威，输了也不喷的原因吧。</p>
							你以为dota给你设计110个英雄是用来干什么的，又不是靠英雄数量挣钱的，就是tm为了让你们玩的啊。
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">248</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>126条评论</span>
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
						<div class="text-author">
							<a href="#">
								<img class="photo" src="${pageContext.request.contextPath}/img/hui.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										石兰
									</div>
								</a>
									<div class="signal">
										请Wings战队挑选英雄
									</div>
								</span>
						</div>
						<div class="text-status">843 人也赞同了该回答</div>
						<div class="text-content">
							<p>哦？照你这么说，虽然胖头鱼现在一键隐身，精于低调(OB)，隐忍(EM)，杀戮(KS)，但是曾经那个打穿劣势路，三命救主的IG.YYF都不能吹的喽？不能作为现在三号位的标杆的喽？<br>
							现在化身鲷哥，什么团都敢接的周鱼，曾经IG绝境之下的倚仗，IG.Zhou，不能吹的喽？<br>
							现在话都说不清楚，满嘴呜噜噜，被弹幕喷出翔的邹倚天，曾经在DOTA1时代做过传奇队长，打过Carry转过辅助，在TI1拿了亚军，不能吹的喽？<br>
							现在许多人无比厌恶(包括我)的猪肉九，曾经带领LGD开发三核战术，站到世界之巅，不能吹的喽？<br>
							他们都曾在DOTA的历史上留下自己的高光时刻，即便现在变愚了，变菜了，变的无法辨认了，就要抹杀他们的功绩？？？<br>
							想想看Wings干了什么？在TI6正赛阶段，一路在胜者组高歌猛进，只输过两场，还是因为拿了屠夫炸弹，天马行空的BP，精致的团战拉扯，几乎场场精彩的比赛，尤其是和EG的两场比赛，和决赛BO5，Wings的表现甚至征服了全世界的DOTA爱好者，这才过了一年，难道题主都忘了？<br>
							TI6以后变捞了，状态下降了，有谁否认了？<br>
							TI7决赛，Newbee畏首畏尾，怂成一匹马，难免会让人想起曾经的翅膀，想起那个经济劣势人头劣势还敢接团还能赢的Wings。所以才有那个关公战秦琼的问题。<br>
							于是那些所有被TI6的Wings征服的人们都是清流粉喽？
							<br>帽子还是题主扣的好哦</p>
							<img src="${pageContext.request.contextPath}/img/nothingtosay.png" />
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">843</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>83条评论</span>
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
				
				
				<!--写答案-->
				<div id="answereditordiv" style="margin-bottom: 90px;position:relative;display:none">
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

					
					
					  /* ued.ready(function() {
					        ued.addListener("click", function () {
					            alert("登录后才能回答提问");
					        })
					 }); */
					
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
		
		<!--回到顶部-->
		<div id="gotobtn" style="position: fixed;right: 30px;bottom: 80px;display:none" >
			<button class="glyphicon glyphicon-arrow-up btn btn-default" style="font-size: 20px;padding: 5px 10px;" ></button>
		</div>
		
		
		</div>
	</body>

</html>