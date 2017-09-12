<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>关于人性，你最想讲的一个故事是什么？</title>
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
			
		</script>
	</head>

	<body>
		<div class="">
			<!--导航栏-->
			<div id="topbar">
				<div id="navbar" style="position: relative;margin: auto;width: 1010px;">
					<span style="font-size: 15px;">
						<a href="index.html" style="font-size: 32px; color: deepskyblue;font-family: '黑体';">逼乎</a>
						<span style="position: relative;top: -5px;">
							<a class="topmenu" href="index.html" style="margin-left: 30px;">首页</a>
							<a class="topmenu" href="topic.html" style="margin-left: 30px;">话题</a>
							<a class="topmenu" href="find.html" style="margin-left: 30px;">发现</a>
							<form action="#" method="get" style="display: inline;">
								<input type="text" placeholder="搜索你感兴趣的内容..." style="width: 315px;height: 35px;border-top-left-radius: 3px;border-bottom-left-radius: 3px;border: 0;
									position: relative;left: 30px;top: 2px;padding-left: 10px;background-color: #F7F8FA;"/>
								<button type="submit" class="btn btn-default" style="background-color: #F7F8FA;height: 35px;width:40px;border: 0;position: relative;left: -15px;">
			  						<span class="glyphicon glyphicon-search" style="color: lightgray;font-size: 18px;"></span>
								</button>
							</form>
							<button type="button" onclick="fnc()" class="btn btn-info" style="width:60px;font-size: 14px;">提问</button>
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
							<img src="${pageContext.request.contextPath}/img/photo.jpg" height="30px" />
						</a>
					</span>
				</div>	
				<div id="outline" style="position: relative;margin: auto;width: 1010px;display: none;">
					<div style="position: absolute;top:10px;text-align: left;font-weight: bold;font-size: 22px;width: 700px;">
						关于人性，你最想讲的一个故事是什么？
					</div>
					<span style="position: absolute;top:8px;right: 20px;">
						<button type="button" class="btn btn-info" id="focusquestion" onclick="">关注问题</button>
						<button type="button" class="btn btn-default" id="writeanswer" onclick="location.href='#editordiv'">
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
							<a href="#">社交网络</a>
							<a href="#">故事</a>
							<a href="#">心理</a>
							<a href="#">人</a>
							<a href="#">社会心理</a>
						</div>
						<div id="questiontitle">关于人性，你最想讲的一个故事是什么？</div>
						<div style="font-size: 15px;line-height:1.7;margin-top: 10px;">
							人性有性善论、性恶论等等，不做限制，仅仅讲一件你所经历或听闻的关乎人性的故事，尽量是印象最深刻的！
							<a href="#"></a></div>
						<div id="titlelabelcolumn" style="margin: 15px 0;padding-bottom: 20px;">
							<a href="#" class="titlelabel">
								<span class="glyphicon glyphicon-comment"></span>
								<span>61条评论</span>
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
							<div style="font-size: 18px;">86463</div>
						</div>
						<div style="float: left;width: 100px;text-align: center;">
							<div style="color: darkgray;">被浏览</div>
							<div style="font-size: 18px;">19945473</div>
						</div>
					</div>
					<div style="position: absolute;bottom: 15px;right: 20px;">
						<button type="button" class="btn btn-info" id="focusquestion" onclick="">关注问题</button>
						<button type="button" class="btn btn-default" id="writeanswer" onclick="location.href='#editordiv'">
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
						<span style="font-weight: bold;font-size: 15px;">3755 个回答</span>
						<span style="position: absolute;right: 20px;">默认排序</span>
					</div>
					
					<!--用户个人回答板块-->
					<div class="answerblock">
						<div class="separator"></div>
						<div class="text-author">
							<a href="#">
								<img class="photo" src="${pageContext.request.contextPath}/img/hanshuo.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										韩烁
									</div>
								</a>
									<div class="signal">
										具有负能量阴影的正能量的人
									</div>
								</span>
						</div>
						<div class="text-status">34888 人也赞同了该回答</div>
						<div class="text-content">
							我大二的时候，每一天的新闻里几乎都有关于大学生失踪、被杀、强奸的字眼，有一天自己去买东西，一个四十左右岁的叔叔把我拦住，问我是哪里的学生，拦着我不让我走，因为受新闻的影响，我感到的只有恐惧，慌不择路的拉住旁边爷爷的胳膊，跟男人说我和爷爷还要买东西，那个男人疑惑的看了男人一眼“他是你孙女”，我心里发慌时，爷爷拉着我，中气十足的说“孙女，咱们走”，边走边小声地对我说“别怕，我保护你”，走到一个拐角，我给爷爷深深鞠了一躬，爷爷说“快走吧，我帮你看着，不要怕”，我走了一段距离，回头看了爷爷一眼，满头银发，依旧站在那里，见我回头，向我挥了挥手，像一个英雄一样。
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">34K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>900条评论</span>
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
								<img class="photo" src="${pageContext.request.contextPath}/img/sagiri.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										Scalpel
									</div>
								</a>
									<div class="signal">
										不接合作，别烦我
									</div>
								</span>
						</div>
						<div class="text-status">15372 人也赞同了该回答</div>
						<div class="text-content">
							<p>我念初一那会儿，为了拉开分差，许多家长周末都把孩子送到老师家里补课，我自然也不例外。</p>
							<p>有天补完课，我照常骑车，与两名同学结伴而行。</p>
							<p>骑行至某一段街道，前方巷口隐隐传来喇叭的嗡鸣声。</p><p>我们意识到前面可能有车要倒出来，扭头回望，不见车来，隐隐还能看见上个十字口仍亮红灯，于是朝机动车道靠了靠。</p><p>我清晰记得，那个下午，光线充盈，柳叶缠风，路边行人三三两两，双实线那边，车辆携灰尘次第驶来，一切都显得稀松平常。</p><p>我是说在这一刻之前——</p><p>漆蓝的车尾从巷口探出，随之是车箱、车头。这是一辆重卡，却好像一道流光。它紧贴着路牙的弧线，以一种不可思议的速度朝这边推来。</p><p>好像为排练已久的剧本走流程一般，一切都在瞬息之间完成，行云流水到我来不及反应，就和自行车一齐滑进卡车底下。</p><br><br><br><p>当我恢复意识，艰难地从地上爬起来时，卡车早已经无影无踪。</p><p>我甩了甩有些疼得发晕的脑袋，眼前瞬间洇上一片暗红。</p><p>伸手摸额头，发际线下约一厘米处，温热的血汩汩涌出。那有一道豁口，我伸大拇指探去，印象中竟有一个指节深。</p><p>我突然想起，我的同学呢，他们没事吧？<br></p><p>这时我才注意到，以我为圆心的半径两三米外，早已围满人，我的两个同学也在里面。</p><p>你没事吧？一个同学问，语气有点慌。</p><p>我说：没事。</p><p>哦..... 他顿了顿，说：那我们去网吧了，你快回去吧。</p><p>我愣了好一会儿，没有接话。</p><p>我不知道该怎么接。<br></p>
							<p>我怀疑是我听错了，忍着头疼去回想他在上一秒刚说的话。</p><p>但事实上我没有听错，他见我不说话，拉了拉另一个同学，两个人交流了几句，又试探着问我：我们走了？</p><p>我看着两张稚嫩的面孔，只觉得突然陌生起来，我感觉有些冷，如芒刺在背，毛骨悚然一般的冷。</p><p>我以为我会挽留，会怒斥，甚至嚎啕大哭，但我没有。</p><p>走吧。</p><p>我的声音异常平静。<br></p><p>他们如获大赦般调转车头，卖力地蹬车，很快就不见了。</p><br><br><p>这么多人，应该有好心人吧？</p><p>我鼓起勇气环视人群一圈，却扑灭了心底最后一丝希冀。</p><p>骑车的走路的，散步的遛狗的，无论男女老幼，脸上都挂着一样的从容与冷漠，以及深藏在眼底的一丝愉悦。</p><p>一个老人挖着鼻孔，不断调整最舒服的站姿。一个父亲一边给孩子剥着棒棒糖，一边说些什么。一个中年妇女拿起自己的直板诺基亚正对着我，手机卖力地发出咔擦声。</p><p>还有更多的人，我没有看清。</p><p>又或许是我不愿去看。</p><p>我收起可笑的希冀，在人群里找寻自行车，却发现它早被压成废铁，一个车轱辘都飞没了。</p><p>摸摸身上，没有钱，于是朝回走，准备步行去医院。</p><p>人群如潮退般向两边散去，留出一条阔路，我一瘸一拐地走，每一步都尽量走的坚定。</p><p>走出一段距离，我微微侧头朝后看，人已经散了大半，还有少数，仍驻足观望，好像在看一条狗。</p><br><p>我继续朝前走。</p><p>血流个不停，从脸上一路蔓延到脖颈再到衣襟，最后啪嗒啪嗒砸在地上，蜿蜒成一路的稀稀疏疏。</p><p>或许是两百米，或许是五百米。</p><p>我沿着马路牙子逆行，迎面来过无数人，又走了无数人，具体多少，我数不清，但委实没有一个人停下。</p>
							<p>顶多看两眼，便继续赶路。</p><p>当我头晕到再也走不动的时候，我终于选择躺在地上，像一条不幸被浪花拍上岸的濒死的鱼，大口大口的喘气。</p><p>吸附在柏油马路上的焦灼炽热柏油从后背导入进来，努力平衡我身体的凉意。</p><p><br></p><p><br></p><p>妈妈你看那个哥哥…</p><p>不要多管闲事。</p><p>有位母亲载孩子骑电瓶车过去。</p><p>诶诶你看那个人……</p><p>哎呀好吓人，走吧走吧，不要看了。</p><p>两个女孩从边上走过。</p><p>还有更多的汽车从边上碾过，激起一路灰尘。</p><p>我闭着眼，静静想，如果我一直躺这，死了也躺在这，那些扑在我身上的灰尘最终能否将我完全覆盖，裹成一个厚厚的茧。一段时间后茧里爬出一只巨型蜘蛛，刀劈不断，火烧不烂。但它没有锋利爪牙，也不能喷洒毒液，于是它四处爬窜，挨个挨个找到那些目睹我惨状却不救我的人，把他们全部吓昏过去。</p><p>想着想着我竟然笑出了声。</p><p>我大概是要死了。</p><br><br><br><br><p>隐约间听到近处有轮胎摩擦地面的声音，我微微睁眼，是一辆出租车，上面下来一个戴黑框眼镜的瘦弱的中年男人。</p><p>我听他似乎和司机在交涉什么，又吼了几句，最后重重关上车门，在出租车扬长而去后走到我身边，脱下外套裹住我，略微吃力地抱起来。</p><p>还是有人愿意救我吗？</p><p>一束阳光打进心房，心底那个孕育蜘蛛的茧蓦然破裂，满地鲜花恣意盛开。</p><p>我艰难地开口:谢谢你叔叔。</p><p>小朋友你听叔叔说，觉得困也不要闭眼，和叔叔多聊聊天，你叫什么名字？你住哪？知道爸爸妈妈电话吗？</p><p>男人说了一堆。</p><p>我强打起精神，回答他的问题。</p><p>一连过去好几辆出租车后，终于有一辆愿意载我们，司机打开车门，帮男人把我送进后排，朝医院疾驰。<br></p>
							<p>在经过缝针输血等一系列烦琐的过程后，我终于忍不住倦意沉沉睡去，再次醒来已是次日上午。</p><p>母亲坐在病床边，握着我的手，泪水涟涟，妆容都哭花了。</p><p>她大概是从外地赶回来不久，样子异常疲惫。</p><p>我说:妈，你啥时候来的，那个叔叔呢。</p><p>我妈说:早上回来的，妈妈担心死你了，我一听到你出车祸心都凉了……那个叔叔应该已经走了。早上他看到我来了，交代了一堆就说出去买点早饭，结果护士送来牛奶和果篮，说他买的，让转交一下。</p><p>直到我出院，那个男人都没有再来过。<br></p><p>母亲专程找人做了面锦旗，说一定要感谢他，最少也得把垫付的看病钱还了。</p><p>听医生说，男人有提到自己是保险公司的。</p><p>于是我和母亲找遍本市所有的保险公司，却再也没有见到他。</p><br><br><br><br><p>15年初，我独身在外地生活。</p><p>一个男孩去家旁的便利店购物，被一辆闯红灯的轿车撞飞，导致右小腿胫骨骨折，身上多出擦伤。</p><p>我路过的时候，他无助的躺在地上哀嚎，血淌了一地。不少路人在远处张望，却没有一人上前。</p><p>看到他的一瞬间，我仿佛看到了数年前无助的自己。</p><p>我冲上前去，打了急救电话，并从便利店拿了些厚纸板和撕成条的浴巾，一边固定骨折处，一边如当年那个男人安慰我一般去安慰他。</p><p>男孩似乎找到了宣泄口，哇的一声哭出来，抽噎着讲述事情经过，说:那个叔叔开车撞我，还骂我不长眼。</p><p>最后，男孩成功接受治疗。他的父亲一个劲对我表示感谢，并且，在了解到事情经过后，果断发动自己的人脉关系，将肇事司机抓了回来。</p><p>听说，司机见到男孩后掩面痛哭，不断道歉，说自己良心上受到谴责，也愿意接受处罚。</p><br><br><br><br><br>
							写下这些东西，并非我想诉苦、标榜自己有多善良，或是抨击那些视而不见的人。<br><br>我仅仅是感到幸福，在我困难的时候有人愿意伸出援手。并且我能够将男人的精神继续传递下去，我甚至会自作多情地想，那个小男孩是不是也会因为我的举动，温柔地帮助别人，温柔地看待这个世界。<br><br><br><br><p>网上经常能看到披露社会冷漠，人情冷暖的新闻。</p><p>但这并不能成为人心善恶的依凭。</p><p>人出生时都是一张白纸，只是随着生活环境不同，养育出百样性格。</p><p>我很感谢当初救我的男人，假如当时他没出现，不仅是我的生命，我心中滋生出的恶，想必也不会得到救赎。</p><br><p>至于当初那些没有对我施予援手的人，我感到难过，却不会去恨，更多的，是理解。</p><p>这世上绝大多数人，都处在一种向善却混沌的状态。</p><p>由于社会现状，每个人都为自己那摊事忙得焦头烂额，无暇顾及他人，不得不选择明哲保身。</p><p>我因得到过帮助，得到过救赎，所以我会把那个男人对我的善，去转赠给其他更多的人，褰裳涉水也在所不辞。</p><p>他大概不会知道，在自己看来理所当然的善举，对当年那个小男孩产生了何等巨大的影响。<br></p><p>我不知道他现在过着怎样的生活，又是否顺意。世间若真有神明，想必会给一个行善者好的果报。</p><p>绝大多数冷漠现场的人，只是缺一点拥抱世界的机会，一点破土而出的勇气。<br></p><p>所以我由衷钦佩那些支教，献血，捐赠器官，维护和平以及做慈善事业的人。他们像那个男人一样，都在所处的位置上，尽力去做能做的事。</p><p>这个社会需要更多这样的人发声，去引导舆论，去扭正观点，去切实行动，去将人性的善发扬传承。</p><p>哪怕我们所贯彻的善良，在现阶段还不够成熟，甚至只是形式上的伪善。但它确确实实，是在引领我们走向更好的世界。</p>
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">15K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>584条评论</span>
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
								<img class="photo" src="${pageContext.request.contextPath}/img/annoymouse.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										匿名用户
									</div>
								</a>
									<div class="signal">
										
									</div>
								</span>
						</div>
						<div class="text-status">6588 人也赞同了该回答</div>
						<div class="text-content">
							<p>我大学寒假的时候曾经到一家高档餐厅做服务员。</p>
							<p>一天给客人上菜，客人是一桌西装革履的男性，从他们的对话可以听出应该是本地市政府的官员，在我上最后一道菜的时候，是一人一碗的主食拉面，碗很烫，并不好端。</p><p>结果我为其中一位中年男子上面的时候把汤洒了出来，很多汤都撒在了他座椅靠背上搭的衣服上面，我真的好蠢，哪有从客人头上上菜的道理，我甚至都能感到有一些汤溅到了他后面的脖子上。</p><p>当时一桌人都惊呆了，而我真的吓坏了，彼时的我刚从农村出来考上大学，真的好害怕。</p>
							<p>但是他瞬间站起来问我，你有没有被烫到手，我低头一看，我的手已经红了。</p><p>他马上说，快去用凉水冲一下，快。</p><p>当时我一点都顾不上手痛，因为我知道这种衣服，我必然是赔不起，所以我低着头说，对不起对不起，您的衣服...</p><br><p>他马上说，破衣服有什么好心疼的，洗一洗就行了，烫到了人，那才要紧，快去冲下手。 </p><p>然后他继续坐下拿一张纸巾擦了擦脖子后面，继续和其他人交谈，这一切发生得太快导致话题都还在继续，其他人也迅速恢复了平静开始继续聊天，我的心里充满了愧疚，但我知道他绝不会告诉我的经理了。</p><p>时至今日，再想起他，我的心里都是暖的。<br>
							--------------------------------------------------/</p><p>后来我工作了，恋爱了，有一天我和男朋友去吃饭，我的男朋友是金融从业者，所以他也常年西装革履的。</p>
							<p>那天下着雨，所以我们去吃火锅，因为下雨所以生意火爆，不停的翻台，但那个火锅店不知道怎么回事二楼只有一个服务员，是一个小姑娘。</p><p>所以她非常的忙，不停的有人叫她服务员来点菜，服务员拿盒纸巾，服务员倒点水，她明显忙不过来，一路小跑还一头汗。</p><p>又有人喊服务员加点汤，那客人已经开始明显的不耐烦，语气非常差，刚好我们也要加汤，我的男朋友就自己拎起服务台的汤给我们倒。</p><p>倒完之后我男朋友对着那位客人说，刚才是谁说要加汤来着，我来，他拎着汤壶帮那一桌也加了汤。</p><p>过了一会，那个服务员在给我男朋友上加的蘸汁时，突然手一滑，洒出来好多，香油辣椒蒜泥汁呀，刚好洒在我男朋友白衬衣的袖口上。</p>
							<p>服务员吓了一跳，赶紧道歉，手忙脚乱的拿纸巾，这时，我男朋友说，没事没事，多大点事，衣服弄脏洗干净就是了，我媳妇会给我洗的，你快去忙吧，不用管我。然后冲我说，媳妇，对不对。 </p><p>后来，在我男朋友的自助行为下，整个火锅店二楼变成了自助火锅，大家加汤自己加，开火自己开，也没人催服务员了。</p>
							于我而言，我很高兴我遇到了真正有风度的人，并且不止一位，我衷心的希望人人都能多一些善意，使自己和身边的人都能更快乐一点。</span>
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">6K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>374条评论</span>
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
								<img class="photo" src="${pageContext.request.contextPath}/img/wangraw.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										王瑞恩
									</div>
								</a>
									<div class="signal">
										法律、律师 话题的优秀回答者
									</div>
								</span>
						</div>
						<div class="text-status">21394 人也赞同了该回答</div>
						<div class="text-content">
							英国有一个叫做Golden Ball的娱乐节目，节目内容很俗套，无非是参与挑战赢大奖之类，<br>有趣的在于，当只剩下两名参与者时，会进入一个叫做"Split or Steal" （平分或偷取）的环节，<br>面对十几万英镑的高额奖金，两名参与者各自选择“split”或者“steal”<br>有以下几种可能:<br>如果两人都选择split，则两人平分奖金；<br>如果一人选择split，一人选择steal，则选择steal的人获得全部奖金，另一个人一分钱也拿不到，<br>如果两人都选择steal，则都空手回家。
							显然，如果能够达成两人都split的结果，当然不错，
							<p>显然，如果能够达成两人都split的结果，当然不错，<br>但难道让对方选择split而我选择steal不是更好吗？<br>这个节目开播以来，催生了很多不共戴天的仇人，<br>多少人编出好听的故事，承诺自己会选择split，<br>诸如什么父母双亡，从小接受无数人帮助才到了今天，因此要把感恩之心传递下去，<br>
							什么曾经奇迹般地从车祸中幸存，感到自己被老天保佑，因此愿意从此做个好人，<br>什么自己孩子刚刚出生，希望自己能为孩子做一个榜样，<br>什么自己是个虔诚的信仰者，不会做出违背主的旨意的事情。<br>
							但其中很多很多人，最后违背承诺选择了steal，独自把奖金全数收入囊中。</p>直到有一个人的出现改变了这个游戏，<br> Nick Corrigan<br>当主持人说，二位选手，现在你们可以讨论一下自己的选择时，<br>Nick毫不犹豫地说，<br>“我希望你相信一件事情，我向你保证，无论你做出什么选择，我都会坚定地选择steal.”<br>对面的人一下子懵了。“什么？你再说一遍？！”
							<p>对面的人一下子懵了。“什么？你再说一遍？！”<br>
							Nick说，“对的，我会选择steal，如果你也选择steal的话，我们都空手回家，但如果你选择split，那我会拿到全部的钱，然后分一半给你”<br>观众都哄笑起来：第一次见到这么厚颜无耻的人！<br>对面的人问，“那我们为什么不一开始就商量好，都选择split呢？为什么还有这么麻烦等节目之后再分。”<br>Nick说，我不管，我就是要选择steal。<br>对面的人接着说"可是我会选择split，我保证，我爸爸从小就教育我，一个不会信守诺言的人不配做人，所以我会守信的。”<br>Nick说，我也是个守信的人，我保证会选steal，你就相信我吧，<br>对面的人直接发飙了，大骂Nick傻逼，</p><p>主持人说，好了，请公布你的选择，<br>
							两人同时亮出自己手中写好的答案<br>。<br>。<br>。<br><b>
								两人都选择了Split </b></p><br><p>那期节目过后，对面的人，Abraham，接受了采访，<br>他承认说，自己本来想好了一个故事，想让Nick相信自己会选择spilt，而自己实际打算选择steal拿走全部的钱，<br>但没想到对方一开口就说了这样一番话，<br>想了一下，眼前只有两条路：<br>如果自己选择steal，那么铁定一分钱也拿不到，<br>如果选择split呢，说不定还有一点可能Nick会良心发现分一些给他，<br>反正总比一分钱没有要好吧，因此选择了split. </p>为什么说这个故事关于人性呢？ <br>人性到底是善还是恶，人到底是天使还是魔鬼，上千年来有过无数的讨论，两种观点都能有自己的论据，
							<br>但还有另一种可能，人性既不是善，也不是恶，人性的根本就在于“趋利避害”的理性，<br>如果能够巧妙地利用理性，<br>那么，不管对方是一诺千金的君子，<br>还是见利忘义的小人，<br>都有可能不知不觉中实现了最完美的结果。<br>--<br>
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">21K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>722条评论</span>
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
								<img class="photo" src="${pageContext.request.contextPath}/img/dotokl.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										郭渣渣
									</div>
								</a>
									<div class="signal">
										我给女神写故事
									</div>
								</span>
						</div>
						<div class="text-status">10089 人也赞同了该回答</div>
						<div class="text-content">
							<p>发生在本市某医院的一件事情，其中滋味，自己体会。</p>
							<p>这一天产科来了一对年轻的农村小夫妻。衣着很朴素，家里经济条件并不是特别好。妇女在下一级医院保胎，效果欠佳。为了自己的孩子，俩个人来到了这家医院，满心希望的能够顺利迎接着自己爱情的结晶。产科的医生安排妇女住院，完善各项化验检查。</p><p>但是，妇女早产了。生了个极不健康女孩儿，肺不成熟，而且是个兔唇。是个学医的都懂得，如果孩子的肺不成熟，在十年前要治疗是要花的一个农村普通家庭家破人亡的，而且还不一定能保证治好。何况还有一个兔唇，如果要做手术修补的话要花不少的钱，对于这个家庭来说是一个很大的负担。如果不做修补，这个兔唇对于一个女孩子的伤害，可想而知。</p><p>产科主任向小两口交代病情：患儿呼吸衰竭，随时有可能死去。如果治疗，花费很高，而且效果无法保证。</p><p>再然后，这小两口可能是觉得自己还年轻，认为自己还是有机会再生一个健康的。所以，决定放弃这个孩子，并请求当时的产科主任开一张死亡证明，证明孩子出生后夭折。</p><p>在这里，我要补充说明一下。这种行为看起来虽然非常残忍，但是在当时产科，这种情况还是很常见的。是的，没错，父母会请求他人帮忙处理掉自己的嫌弃孩子。具体处理的方法，这里我就不透露了。</p><p>这位产科主任有一个乡下的表侄女，婚后几年，没有孩子。正好此时来找产科主任，看看有没有什么好办法。产科主任说：你看，这里有一个弃婴，你要不回去养养看？</p><p>产科主任在开了死亡证明的第二天，又开了一张出生证明。</p><p>表侄女把孩子带回乡下，给孩子保温，喝着红糖水。万幸，孩子竟然奇迹般活了下来。孩子再大一些，主任的表侄女又花了很多钱，给孩子做了修补手术。</p><p>也许是老天真的是公平的，那小两口，真的再没有孕育一个生命。</p><p>有一天，那个产妇到邻村去赶集，正好看到一个墙角边，一个小女孩在踢毽子。这个小女孩看着好眼熟，好眼熟，好眼熟，上嘴唇上还有淡淡的粉红色的瘢痕。</p>
							<p>产妇一下子就想起了自己多年前的那个孩子，马上就托人打听消息。然后发现，这个孩子的生日和自己当年的孩子只差一天，而且，这个孩子的母亲，多年前就被诊断不孕，从外面抱回一个兔唇的女孩子，这个女孩子和自己的孩子还是同一年出生！！！</p><p>这小两口就找到了这个产科主任，这个主任很痛快的就把当时发生的事情告诉他们了。</p><p>这个小两口决定要回自己的孩子。当然结果可想而知，表侄女一家肯定是不给的。怎么办，诉诸公堂。</p><p>法院判决：<br>1、孩子归小两口；<br>2、小两口要补给表侄女家这几年的抚养费及其他相关费用；<br>3、产科主任触犯刑法，犯拐卖人口罪。</p><p>后来上诉，因为没有金钱交易，拐卖人口的罪名不成立。但是任然判刑入狱数年。</p><p>故事的结局是非常凄惨的。小女孩根本就不认自己的亲生父母天天哭着闹着要回自己妈妈那里。小两口去找到表侄女那里，送回孩子，希望得到一家人和孩子的原谅，并且请求表侄女一家能够帮自己劝导孩子，承认自己才是孩子的亲生父母，并表示孩子可以放在表侄女家，我们一起抚养孩子，让她作为我们两家共同的孩子。</p><p>表侄女一家拒绝了：我的大姑还因为这件事被关在牢里呢，当初孩子最需要你们的时候，你们在哪里呢？</p><p>故事的结局：产科主任脱下了白大衣，穿上了囚服，带着手铐脚镣，来到医院门口，手指着医院大门：这就是我当年的犯罪现场。警察在嘁哩喀喳的拍照。秋风死，残阳照进主任银白色的头发，散发出血红色的光芒。</p><p>其中滋味，自己体会。</p><br><p>--------------------------------------------------------------------------------------------------------------------------------------------<br>
							承蒙各位厚爱，两天之内居然赞数过千。我看了一下大家的评论，各种观点的都有。这很好，知乎本来就是一个开放的不记名的讨（tu）论（cao）社群。</p><p>1、题主问道关于人性的故事，那我就写一个关于人性的事。记得前些年，郭德纲备受抨击的时候。老郭在一次相声返场的时候说：天下人分两种，一种是喜欢郭德纲的，一种是不喜欢郭德纲的。这都没有错。但是不喜欢郭德纲的说喜欢郭德纲的人错了，那才是错了。一个理性的决定能不能说是一个正确的决定呢？这要看他所处的环境。故事中每一个人的决定，都不能说是错的，也不能说是对的，如果站在道德的至高点上去抨击他人，那才是错了。人性是及其复杂的，善恶存乎于一念之间。这就是我想说的人性。</p><p>2、关于客观的那句话，我承认我错了，其实个人根本无法做到客观。正如一位知友所提到的：只有证据是客观的。其实我觉得，只有数据才是客观的。信息也不客观，更别提一个故事了。是不是主观，很好判定。是不是客观，根本不是一个人能说了算的，只能尽到一个人的能力所及。</p><p>3、关于故事的真实性。我曾经和产科主任所在科室的一个大夫在一起吃饭，听到的这个故事，在饭桌上，我还追问了一些细节。关于那个死亡证明，当时是小两口请求开的。这个应该没有逻辑上的漏洞。试想，如果没有这个死亡证明，就算政府不追究弃婴，村里面老百姓的口水就能淹死他们。正规医院里面，不存在医生与他人勾结卖儿童的行为，再次，请不要怀疑产科主任的动机。至于一些知友提问到的更多的细节，包括判了几年，具体的谈话内容，确实不是我有意隐瞒。是我疏忽了，当时根本就没有有意识的去问。就算是我在编造一个故事，或者一个劣质的小说吧。知乎上抖机灵博赞的人多了去了，又何必在意我这个渣渣呢？</p>4、感谢逼友
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">10K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>932条评论</span>
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
								<img class="photo" src="${pageContext.request.contextPath}/img/yewind.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										野风
									</div>
								</a>
									<div class="signal">
										野风怒见不平事 磨损胸中万古刀
									</div>
								</span>
						</div>
						<div class="text-status">3135 人也赞同了该回答</div>
						<div class="text-content">
							<p>我们这边某族（地）小偷特别多，泛滥成灾。</p><p>14年，经过火车站天桥，被两学生妹子迎面拦住，央我帮她们去追小偷，要回刚被偷走的手机。</p><p>我本不想管这破事儿，但看丢手机那姑娘眼泪都快下来了……想必手机对她来说是很重要的吧。</p><p>于是回头，带着她们追不多远就拦住那几个小偷。</p><p>没错，是几个。</p><p>三男两女，其中一个抱着个孩子。</p><p>我伸手过去，拿来。</p><p>为首的小个子男人（他们个头都小。哦，对了，我身高一米八五）挤出一脸凶相试图吓退我，其余人见我一个人，就围了上来想动手。</p><p>我拉住小个子胳膊，一脚踹在他小腿上，他躺在地上杀猪般惨叫起来。</p><p>天桥上来来往往的人都吓了一跳，但却都远远的看着指指点点。</p><p>我又给了小个子小腹一脚，伸手过去，拿来。</p><p>那抱着孩子的女人楞了一小会儿，从怀里掏出部手机。嗯，破小米。学生一把夺过去，转头就走。</p><p>尼玛，好吧。我还是办我的事去吧。</p><p>另一个学生跟在后面刚道了声谢，就见迎面赶过来两个大呼小叫的警察嚷嚷着要抓小偷。</p><p>我站在一边，看两黑皮匆匆过去，两个学生妹子跟在后面，激动得脸色通红。</p><p>然而他们不过是看了两眼那小个子就转头冲着我来了，说我好像踹断了人骨头。什么协助调查、医药费巴拉巴拉的……</p><p>我去尼玛勒个B的。</p><p>两学生妹子也一句话都不说了，居然转身就走了。</p><p>两黑皮扶起那小个子，让我一起回所里。</p><p>你大爷吧，我转头就逃。</p><p>长期锻炼果然不是盖的，那两个蠢货追了我两条街就不见了踪影。</p><p>后来说起这事儿，闻者却无一例外指责我是蠢蛋，脑子坏了。管这种闲事，万一被那帮人捅几刀怎么办……</p><p>————</p><p>忽然想起太史公所言：</p><p>自秦以降，匹夫之侠湮灭不见，余甚恨之！</p><p>————</p><p>多谢各位好意！</p><p>其实我也并不是什么好人。</p><p>我们这边民风彪悍，我自小不知打过多少次架，身经百战见得多了。在这个城市没多少人会主动招惹我的，注意安全一说，言重了。</p>不过还是要感谢各位，愿你们都开心！
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">3.1K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>932条评论</span>
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
								<img class="photo" src="${pageContext.request.contextPath}/img/zhan.jpg" />
							</a>
							<span class="personalmsg">
								<a href="#" style="color: black;">
									<div class="name">
										张佳玮
									</div>
								</a>
									<div class="signal">
										文学 话题的优秀回答者
									</div>
								</span>
						</div>
						<div class="text-status">5215人也赞同了该回答</div>
						<div class="text-content">
							<p>谢邀。</p><p><br></p><p><br></p><p>十年前吧，我在某网站写了篇游戏文字，虚构了一段贫困的生活。</p><p>熟我的诸位知道我在开玩笑，在下面跟帖，嬉笑打闹。</p><p><br></p><p>有一位仁兄，认认真真地长篇回帖，大概意思：</p><p>“看来现实生活果然与网络不同啊，在网络上风光的人现实生活未必如意……哎接下来中国互联网会日渐式微，张佳玮这样不肯跟传统圈子打好关系的人，会越来越艰难吧……看了张佳玮的许多文字，早就猜到他实际上生活中会这样了……还是先把自己的生活水平提高点吧，毕竟虚拟世界都是假的……”</p><p><br></p><p>这个回帖理所当然遭到了大家的围观和嘻嘻哈哈。我始终没说话。这且罢了。</p><p>之后，这位仁兄给我发了网站私信。大意是：</p><p>“哈哈哈哈好尴尬呀，我只想着自己想表达的意思了，就没仔细看你的文。”</p><p>“哎其实我之前看你的文时，以为你年纪比我大，知道你比我小之后，有点不爽，所以说了这些话，这也算是文人相轻吧哈哈哈哈。”</p><p><br></p><p>我觉得他话里话外透出的意思，很微妙：</p><p>——他因为不喜欢我，所以，<b>很希望</b>我过得不顺。</p><p>——当他发现我疑似有不顺的可能时，<b>就相信</b>我真的过得不顺，赶紧出来评点一番。</p><p>——当他发现评点错误时，又跟我长篇解释；其实我对他的看法，对他并不重要，他自己解释为“文人相轻”，似乎更像是，<b>给自己找个台阶下</b>。</p><p><br></p><p>我对这种心态很有兴趣。之后某篇文里，完全匿名，也没有引用原句，只是讲了遍这个故事。</p><p>结果讲完后，这位仁兄又给我发私信。对我大肆辱骂一番。还说一定不会放过我的——虽然我文里还特意遮掉了他的名字，也没有摘引原话，但似乎对他而言，单是提及这件事，就是对他的绝大侮辱了。</p><p><br></p><p><br></p><p>我通过这个案例，明白了人性一些微妙所在。</p><p>一个人，可能因为各种莫名其妙的原因，仇视另一个人。这很正常。</p><p>这种仇视会使他丧失中立与客观，一门心思希望他过得不好。即所谓，<b>“人只肯相信自己愿意相信的”。</b></p><p>但许多人是无法接受自己的这种倾向的，于是会给自己找台阶下。</p><p>这种找台阶的迫切，会让他<b>不肯面对自己</b>。当疑似真实的自己被揭穿时，便会恼羞成怒。</p><p>归根结底，人是会被情绪左右的；而许多情绪，都出于一种<b>优越感</b>的需求。</p><p><b>一旦这种优越感受损，便会不惜一切代价，通过丑化他人与给自己找台阶下，来达成满足。他人是否那么糟糕根本不重要，重要的是：</b></p><p><b>“我不了解你，但是我希望你这么糟糕，我猜你过得很糟糕，好的，我已经相信你是这么糟糕的人啦！”</b></p><p><b>世上绝大多数的争执与无缘无故的憎恨，大概都出于此。</b></p>
						</div>
						<div class="edit-time">编辑于<span> 2016-03-28</span></div>
						<div class="text-end">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">5.2K</span></span>
							</button>
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-down opinion"></span>
							</button>
							<span>
							<a href="#" class="text-situation">
								<span class="glyphicon glyphicon-comment"></span>
							<span>414条评论</span>
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
				<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
				<div id="editordiv" style="margin-bottom: 90px;">
					<script id="editAnswer" type="text/plain" style="width:700px;height:200px;"></script>
				</div>
				<script type="text/javascript">
					UE.getEditor('editAnswer');
				</script>
			</div>


			<!--右侧导航栏div-->
			<div id="rightDiv">
				<div id="icoDiv">
					<div style="font-weight: bold;padding: 13px;">相关问题</div>
					<div style="background-color: #F0F2F7;height: 1px;"></div>
					<div style="padding:8px 15px;font-size: 14px;">
						<a href="#" style="">如何成为一个会讲故事的人？</a>
						<span style="color: darkgray;"> 346 个回答</span>
					</div>
					<div style="padding:8px 15px;font-size: 14px;">
						<a href="#" style="">有哪些堪称神转折的故事？</a>
						<span style="color: darkgray;"> 3763 个回答</span>
					</div>
					<div style="padding:8px 15px;font-size: 14px;">
						<a href="#" style="">有哪些可怕的故事？</a>
						<span style="color: darkgray;"> 1695 个回答</span>
					</div>
					<div style="padding:8px 15px;font-size: 14px;">
						<a href="#" style="">有哪些讲无限循环故事的作品？ </a>
						<span style="color: darkgray;"> 3290 个回答</span>
					</div>
					<div style="padding:8px 15px;font-size: 14px;">
						<a href="#" style="">你见过最心酸的事是什么？ </a>
						<span style="color: darkgray;"> 2126 个回答</span>
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
		
		<!--反馈模态框-->
		<%@ include file="/jsp/feedback.jsp" %>
		
		<!--回到顶部-->
		<div id="gotobtn" style="position: fixed;right: 30px;bottom: 80px;display:none" >
			<button class="glyphicon glyphicon-arrow-up btn btn-default" style="font-size: 20px;padding: 5px 10px;" ></button>
		</div>
		
		<!--提问模态框-->
 		<%@ include file="/jsp/askmodal.jsp" %>
		
		
		</div>
	</body>

</html>