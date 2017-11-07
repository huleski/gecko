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

		<script type="text/javascript">
			$(function() {
				$(".takebackspan").click(function() {
					$(this).hide(1);
					var $textBlock = $(this).parents(".text-block");
					$textBlock.find(".text-all").hide(1, function() {
						$textBlock.find(".text").show();
						$textBlock.bind("mouseout", function() {
							$textBlock.find(".hidelabel").hide();
						});
					});
				});

				$(".text").click(function() {
					$(this).hide();
					var $block = $(this).parent(".text-block");
					//					$block.css("background-color", "pink");
					$block.find(".text-all").show();
					$block.find(".hidelabel").show();
					$block.find(".takebackspan").show();
					$block.unbind("mouseout");
				});

				$(".text-block").bind({
					/*click: function() {
						$(this).find(".text").hide();
						$(this).find(".text-all").show();
						$(this).find(".hidelabel").show();
						$(this).find(".takebackspan").show();
						$(this).unbind("mouseout");
					},*/
					mouseover: function() {
						$(this).find(".hidelabel").show();
					},
					mouseout: function() {
						$(this).find(".hidelabel").hide();
					}
				});

				$(".text").hover(function() {
						$(this).find(".showall").css("background-color", "#EFF6FA");
					},
					function() {
						$(this).find(".showall").css("background-color", "white");
					});
				$(".thinking").hover(function() {
						$(this).css({ color: "#EFF6FA", background: "steelblue" });
					},
					function() {
						$(this).css({ color: "steelblue", background: "#EFF6FA" });
					});

				$(".topmenu").hover(function() {
						$(this).css("color", "white");
					},
					function() {
						$(this).css("color", "#F5F5F5");
					});

				$(".focusedtopic").bind({
					click: function() {
						$(this).css({ color: "white", background: "steelblue" });
						var $btns = $(".focusedtopic:disabled");
						$btns.prop("disabled", false)
						$btns.mouseout();
						$(this).prop("disabled", true);
					},
					mouseover: function() {
						$(this).css({ color: "white", background: "steelblue" });
					},
					mouseout: function() {
						$(this).css({ color: "steelblue", background: "white" });
					}
				});
				
				/*返回顶部*/
				$("#gotobtn").click(function() {
					$('body,html').animate({ scrollTop: 0 }, 500);
				});

			});

			window.onscroll = function() {
				if(document.body.scrollTop > 600) {
					$("#gotobtn").show();
				}
				if(document.body.scrollTop < 600) {
					$("#gotobtn").hide();
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
							<a href="#" style="position:absolute;right: 0;">更多推荐</a>
						</div>
						<div style="height: 1px;background-color: darkgray;margin-top: 10px;"></div>
						<div style="position: relative;padding: 12px 0;">
							<a href="#" style="font-size: 13px;font-weight: bold;">如何看待程序化购买?</a>
							<span style="color: darkgray;position: absolute;right: 0;">问答</span>
						</div>
						<div style="height: 1px;background-color: lightgray;"></div>
						<div style="position: relative;padding: 12px 0;">
							<a href="#" style="font-size: 13px;font-weight: bold;">顶级运动员能做出哪些让人惊叹的特技？</a>
							<span style="color: darkgray;position: absolute;right: 0;">问答</span>
						</div>
						<div style="height: 1px;background-color: lightgray;"></div>
						<div style="position: relative;padding: 12px 0;">
							<a href="#" style="font-size: 13px;font-weight: bold;">明清皇帝的寝宫到底有多奢华？跟欧洲王室皇宫相比呢?</a>
							<span style="color: darkgray;position: absolute;right: 0;">问答</span>
						</div>
						<div style="height: 1px;background-color: lightgray;"></div>
						<div style="position: relative;padding: 12px 0;">
							<a href="#" style="font-size: 13px;font-weight: bold;">什么是心理距离？是什么导致了人们在心理距离上的差异？</a>
							<span style="color: darkgray;position: absolute;right: 0;">问答</span>
						</div>
						<div style="height: 1px;background-color: lightgray;"></div>
						<div style="position: relative;padding: 12px 0;">
							<a href="#" style="font-size: 13px;font-weight: bold;">你心目中顶尖的汽车设计大师都是哪几位？</a>
							<span style="color: darkgray;position: absolute;right: 0;">问答</span>
						</div>
						<div style="height: 1px;background-color: lightgray;"></div>
					</div>

					<div>
						<div>
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#hotday" data-toggle="tab">今日最热</a>
								</li>
								<li>
									<a href="#hotmonth" data-toggle="tab">本月最热</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" style="padding-top: 20px;">
							<!--今日最热-->
							<div class="tab-pane active" id="hotday">
								<div class="text-block">
									<div class="question">
										<a href="answer1.html">如何看待ti7之后存在一些wings清流粉无脑吹wings并且贬低其他队伍的现象？</a>
									</div>
									<div style="position: relative;">
										<button class="thinking">839</button>
										<span class="author-info">
										<a href="#" class="author-name">郭哲彪</a>
										<span class="author-signal">, 逗比的泪窦久泽可乐喝了</span>
										</span>
									</div>
									<div class="text">
										<span class="word">TI7的评论席上，国土说WINGS是一个前无古人的战队，刷新了职业战队对于BP的理念。即使那些所谓的灵性外国队，例如液体也只是在后期弄出个先知体系的大招。但wings 的感觉是场场都有大招。也许大家都记得wings打MVP放对面PA的大招，用了2套阵容打爆MVP，杀人诛心。但其实第二局的阵容选了 蝙蝠 虚空 JUGG，原本人们都以为会是虚空 1号位 jugg 2号位 蝙蝠三号位（他们当时常用的英雄）。结果是 JUGG 1号位 虚空3 号位 蝙蝠2号位。不能说…</span>
										<span class="showall">显示全部</span>
									</div>
									<div class="text-all">
										<p>TI7的评论席上，国土说WINGS是一个前无古人的战队，刷新了职业战队对于BP的理念。即使那些所谓的灵性外国队，例如液体也只是在后期弄出个先知体系的大招。但wings 的感觉是场场都有大招。</p>
										<p>也许大家都记得wings打MVP放对面PA的大招，用了2套阵容打爆MVP，杀人诛心。但其实第二局的阵容选了 蝙蝠 虚空 JUGG，原本人们都以为会是虚空 1号位 jugg 2号位 蝙蝠三号位（他们当时常用的英雄）。结果是 JUGG 1号位 虚空3 号位 蝙蝠2号位。不能说这个分路的效果有多大，今年TI7 哪个战队敢这么换着玩。</p>
										<p>还有WINGS锤爆 EG的两场，1手拉比克 后面连点 抄袭 和谜团。第二局自己ban了戴泽 拿神灵（所有人都以为他们要拿小黑）。领先一分的时候选个TF炸弹的花活，落后一分的时候保持自己的阵容 SK 大鱼 虚空（这场对面选了小娜迦），所有人都在担心小娜迦是大哥，要是TI7 lgd 和NB 的尿性 选完虚空 肯定要补 克制娜迦的 阵容。 </p>
										<p>所有人都看不懂WINGS的阵容，但他们总是能赢 而且还赢的漂亮。TI6 版本英雄 POM GA. 总决赛pom我放你3场， GA体系， 在我这就没赢过。国外队得ban我的小精灵，我也能玩小精灵。有蝙蝠 以后 最后一手敢补斧王的 队伍，敢让斧王打一号位的队伍。 </p>
										<p>总决赛1-0落后的 卡尔被单杀， 虚空开大被 娜迦破解的时候，经济差8K 了。按照 lgd 和NB 的尿性 1号位和3号位 就要开始怂了，应该不知道 怎么接技能了，3号位 要发呆了。我当时躺着床上 手抓着床单 心跳120.结果WINGS 一波 打回来了，上高了， 对面GG 了，。 </p>
										<p>第4局 对面四核 都肥，小鱼 伐木机 POM 夜魔，2塔没破 小鱼 都到 高低杀人了。按照TI7 lgd 和NB 的尿性 应该是开着 BKB 懵逼 或者 OB 人家拆高 然后跳上去送一波 GG。但wings 是 听说 你有夜魔 听说夜魔有A仗 听说是晚上 听说我落后 15k的经济 ，听说 OB那群burden 说让我晚上怂 白天凶。不好意思 0换3 带盾 扫你外塔。</p>
										<p>听说你PA 不到20分钟 暗灭 带盾 还有双倍。 按照按照TI7 lgd 和NB 的尿性 应该是怂在高低，大哥去刷安全的线，酱油挨个送。不好意思 0换6.</p>
										<p>wings 是那个所有人都在感叹 还能这么玩啊的队，是那个在任何劣势都有可能翻盘的队，是那个敢在TI上选炸弹 TF的队 。 他就像是围棋届的 阿尔法狗一样打破了我们原有对于BP 所有陈旧的认识。</p>
										<p>我和我的老伙伴们多想在 这个夏天的末尾再次 听到 龙弟弟说 ：“ig/NB/LFY/lgd你们准备好了嘛？！”</p>
										<p>再次 听到 胖头鱼说 有深意的说道：奇数年？！ 奶子D激情的 呐喊 ： 炸了 炸了 。生日宝说：这不尊重一下？ DC 呵斥单车：你干什么呀？ 还没破路呢。</p>
										<p>MLGB </p>
										<p>GTMD ACE</p>
										<p></p>
										<p></p>
										<p></p>
									</div>
									<div class="text-footer">
										<a href="#">关注问题</a>
										<a href="#">463 条评论</a>
										<span class="hidelabel">
										<a href="#">感谢</a>
										<a href="#">分享</a>
										<a href="#">收藏</a>
										<a href="#">没有帮助</a> 
										<a href="#">举报</a>
									</span>
										<a href="#">作者保留权利</a>
										<span class="takebackspan"><a>收起</a></span>
									</div>
									<div class="separator"></div>
								</div>

								<div class="text-block">
									<div class="question">
										<a href="answer2.html">关于人性，你最想讲的一个故事是什么？</a>
									</div>
									<div style="position: relative;">
										<button class="thinking">5323</button>
										<span class="author-info">
									<a href="#" class="author-name">张佳玮</a>
									<span class="author-signal">, <a href="#">文学话题优秀回答者</a> 公众号：张佳玮写字的地方</span>
										</span>
									</div>
									<div class="text">
										<img class="graphics" src="${pageContext.request.contextPath}/" />
										<span class="word">谢邀。 十年前吧，我在某网站写了篇游戏文字，虚构了一段贫困的生活。熟我的诸位知道我在开玩笑，在下面跟帖，嬉笑打闹。 有一位仁兄，认认真真地长篇回帖，大概意思：“看来现实生活果然与网络不同啊，在网络上风光的人现实生活未必如意……哎接下来中国互…</span>
										<span class="showall">显示全部</span>
									</div>
									<div class="text-all">
										<p>谢邀。</p>
										<p><br></p>
										<p><br></p>
										<p>十年前吧，我在某网站写了篇游戏文字，虚构了一段贫困的生活。</p>
										<p>熟我的诸位知道我在开玩笑，在下面跟帖，嬉笑打闹。</p>
										<p><br></p>
										<p>有一位仁兄，认认真真地长篇回帖，大概意思：</p>
										<p>“看来现实生活果然与网络不同啊，在网络上风光的人现实生活未必如意……哎接下来中国互联网会日渐式微，张佳玮这样不肯跟传统圈子打好关系的人，会越来越艰难吧……看了张佳玮的许多文字，早就猜到他实际上生活中会这样了……还是先把自己的生活水平提高点吧，毕竟虚拟世界都是假的……”</p>
										<p><br></p>
										<p>这个回帖理所当然遭到了大家的围观和嘻嘻哈哈。我始终没说话。这且罢了。</p>
										<p>之后，这位仁兄给我发了网站私信。大意是：</p>
										<p>“哈哈哈哈好尴尬呀，我只想着自己想表达的意思了，就没仔细看你的文。”</p>
										<p>“哎其实我之前看你的文时，以为你年纪比我大，知道你比我小之后，有点不爽，所以说了这些话，这也算是文人相轻吧哈哈哈哈。”</p>
										<p><br></p>
										<p>我觉得他话里话外透出的意思，很微妙：</p>
										<p>——他因为不喜欢我，所以，<b>很希望</b>我过得不顺。</p>
										<p>——当他发现我疑似有不顺的可能时，<b>就相信</b>我真的过得不顺，赶紧出来评点一番。</p>
										<p>——当他发现评点错误时，又跟我长篇解释；其实我对他的看法，对他并不重要，他自己解释为“文人相轻”，似乎更像是，<b>给自己找个台阶下</b>。</p>
										<p><br></p>
										<p>我对这种心态很有兴趣。之后某篇文里，完全匿名，也没有引用原句，只是讲了遍这个故事。</p>
										<p>结果讲完后，这位仁兄又给我发私信。对我大肆辱骂一番。还说一定不会放过我的——虽然我文里还特意遮掉了他的名字，也没有摘引原话，但似乎对他而言，单是提及这件事，就是对他的绝大侮辱了。</p>
										<p><br></p>
										<p><br></p>
										<p>我通过这个案例，明白了人性一些微妙所在。</p>
										<p>一个人，可能因为各种莫名其妙的原因，仇视另一个人。这很正常。</p>
										<p>这种仇视会使他丧失中立与客观，一门心思希望他过得不好。即所谓，<b>“人只肯相信自己愿意相信的”。</b></p>
										<p>但许多人是无法接受自己的这种倾向的，于是会给自己找台阶下。</p>
										<p>这种找台阶的迫切，会让他<b>不肯面对自己</b>。当疑似真实的自己被揭穿时，便会恼羞成怒。</p>
										<p>归根结底，人是会被情绪左右的；而许多情绪，都出于一种<b>优越感</b>的需求。</p>
										<p><b>一旦这种优越感受损，便会不惜一切代价，通过丑化他人与给自己找台阶下，来达成满足。他人是否那么糟糕根本不重要，重要的是：</b></p>
										<p><b>“我不了解你，但是我希望你这么糟糕，我猜你过得很糟糕，好的，我已经相信你是这么糟糕的人啦！”</b></p>
										<p><b>世上绝大多数的争执与无缘无故的憎恨，大概都出于此。</b></p>
									</div>
									<div class="text-footer">
										<a href="#">关注问题</a>
										<a href="#">424 条评论</a>
										<span class="hidelabel">
									<a href="#">感谢</a>
									<a href="#">分享</a>
									<a href="#">收藏</a>
									<a href="#">没有帮助</a> 
									<a href="#">举报</a>
								</span>
										<a href="#">作者保留权利</a>
										<span class="takebackspan"><a class="takeback">收起</a></span>
									</div>
									<div class="separator"></div>
								</div>

								<div class="text-block">
									<div class="question">
										<a href="#">学生如何在淘宝上买到好看便宜质量好的衣服和鞋子？</a>
									</div>
									<div style="position: relative;">
										<button class="thinking">2453</button>
										<span class="author-info">
									<a href="#" class="author-name">白玉豆腐</a>
									<span class="author-signal">, 撸卷狂魔（做梦</span>
										</span>
									</div>
									<div class="text">
										<span class="word">穷狗答题，大部分20-60区间~基本每家店都买过~日系小清新欧美重口暗黑古着晚晚风什么的都有~对原单有好感，仁者见仁智者见智啦~ PS：答主只是一个年龄还没到能打工的穷狗，积蓄烧在鞋子上了，虽然推荐的便宜，但都是我买过或者持续观望很久的店~ —————…</span>
										<span class="showall">显示全部</span>
									</div>
									<div class="text-all">
										<p>穷狗答题，大部分20-60区间~基本每家店都买过~日系小清新欧美重口暗黑古着晚晚风什么的都有~对原单有好感，仁者见仁智者见智啦~</p>
										<p>PS：答主只是一个年龄还没到能打工的穷狗，积蓄烧在鞋子上了，虽然推荐的便宜，但都是我买过或者持续观望很久的店~</p><br />

										<p>——————更新一家店——————</p>
										<p>✔港味潮人馆</p>
										<p>最近淘到的，衣服种类非常非常多，但我最推荐她家的裙，性价比超级高，和那种两百多的没差别~</p>
										<p>就是第一张里的小绿裙~</p><br />

										<p>——————原答案——————</p><br />

										<p>【重口暗黑风】</p>
										<p>✔小野古着</p>
										<p>以前挺多原单货，现在多自制。</p><br />

										<p>(里面的卫衣这家买的，三十多，超级棒。)</p><br /><br />

										<p>✔EOHSTUDIO地狱急诊室</p>
										<p>肉叔家的衣服帅哭了，还有纹身贴！等我有米就拔草！</p><br />

										<p>【原单】</p>
										<p>✔大大叔外贸原单女装店</p>
										<p>他家的牛仔真的超级好，便宜好穿，就是快递要十块！</p>
										<p>(牛仔外套他家买的，old navy原单，二十多，整个春天穿过来的。)</p>
										<p>有妹砸说找不到店?</p>
										<p>http://m.tb.cn/3srjm (二维码自动识别)</p><br /><br />

										<p>✔岳纳珊</p>
										<p>她家的白T便宜又好穿，我自己撸了两件。</p>
										<p>还卖杂七杂八的小玩意儿，适合慢慢淘。</p><br />

										<p>【晚晚风】</p>
										<p>✔乌山楂</p>
										<p>入过吊带和阔腿裤，挺好的。</p><br />

										<p>✔晚时光</p>
										<p>款式比较多。</p><br />

										<p>【小清新】</p>
										<p>✔没烦恼很幸福</p>
										<p>白菜价呀，质量又好，挺有名的一家店了。</p>
										<p>(买过好几件毛衣和T，强推)</p><br />

										<p>✔咩咩家清新文艺女装</p>
										<p>褒贬不一，我觉得还好，不过大多均码，对我这大高个不太友好(￣_￣ )</p><br />

										<p>✔乌77 wu77style</p>
										<p>买了一件T一条裤子，挺好的，但是发货真是慢哭了，五六天才到。</p><br />

										<p>♞♞♞♞♞♞♞♞♞♞</p><br />

										<p>码字好苦，你们不留一个赞再走？！</p><br />

									</div>
									<div class="text-footer">
										<a href="#">关注问题</a>
										<a href="#">225 条评论</a>
										<span class="hidelabel">
									<a href="#">感谢</a>
									<a href="#">分享</a>
									<a href="#">收藏</a>
									<a href="#">没有帮助</a> 
									<a href="#">举报</a>
								</span>
										<a href="#">作者保留权利</a>
										<span class="takebackspan"><a>收起</a></span>
									</div>
									<div class="separator"></div>
								</div>
							</div>

							<!--本周最热-->
							<div class="tab-pane" id="hotmonth">
								<div class="text-block">
									<div class="question">
										<a href="#">网吧里发生过哪些“惊为天人”的事?</a>
									</div>
									<div style="position: relative;">
										<button class="thinking">5314</button>
										<span class="author-info">
										<a href="#" class="author-name">Salvador君</a>
										<span class="author-signal">, 没事就写写。</span>
										</span>
									</div>
									<div class="text">
										<span class="word">不知道大家知道黑网吧吗？就是那种早年间没有营业执照，环境差、卫生差、空间小的网吧，唯一的好处就是未成年上网不用身份证。 网吧在一栋居民楼里，对的，就是那种破破烂烂的居民楼，整栋楼都没有几户人家，在那上网的大多都是附近居民楼的小孩。 老板叫做…</span>
										<span class="showall">显示全部</span>
									</div>
									<div class="text-all">
										不知道大家知道黑网吧吗？就是那种早年间没有营业执照，环境差、卫生差、空间小的网吧，唯一的好处就是未成年上网不用身份证。<br><br>网吧在一栋居民楼里，对的，就是那种破破烂烂的居民楼，整栋楼都没有几户人家，在那上网的大多都是附近居民楼的小孩。<br><br>老板叫做“龅牙，是个三十多岁的大叔，为人挺和善的，经常和我们这些去上网的小屁孩开玩笑。<br><br>暑假，记得那是一个风和日丽的下午，从家偷拿我妈二十块钱，准备好好的“潇洒”一把，带上两个狐朋狗友，高高兴兴的开了三台机子，打着魔兽争霸。<br><br>突然老板冲进来，慌张的叫我们快上楼，语气特别焦急，虽然不知道发生了什么事，但我们一群七八个孩子都上楼了，楼指的是网吧内部的小阁楼，楼梯是那种可以移动的，来这里上网挺久了，但上楼还是第一次，楼上空间很小，堆满了杂物。<br><br>老板千叮咛万嘱咐叫我们千万不要出声，下次来上网全部免费，于是我们七八孩子就挤在小阁楼里大眼瞪小眼，都不明所以。<br><br>下面的网吧里好像是有人来检查，说是要查封老板的网吧，老板说这是他自己的杂物间不是网吧，那工作人员说：你家挺有钱哈，杂物间放十多台电脑？还有冰箱？<br><br>反正叽叽喳喳说了十来分钟，然后老板就跟几个工作人员走了。<br><br>这时候我们都懵逼了，因为走的时候老板把网吧的门锁了，那时候还小心眼大，愣了一会，一群小孩就开始瞎闹，有人提议开机子继续上网，还有胆子大的孩子直接开始从冰箱里拿喝的了。<br><br>有个稍微大点的孩子会用前台的电脑充钱，于是每人开了一台机子上网，开始大家都特别开心，像这种免费上网还有免费饮料的好事可不多。<br><br>慢慢的天开始黑了，老板还没有回来，想早点回家的有些谎了，过了一会晚上9点了，老板还是没有回来，大家都慌了，一群人也不上网了，开始讨论再不回家可能会被家人如何毒打。<br><br>到了10点钟的时候，有人开始拍门大叫，有两个胆子小的开始哭了起来，又过了半个小时大家是真急了，开始拿凳子砸门，疯狂的大喊。<br><br>但门外还是毫无回音，再加上有孩子开始说不想死在这里面，带动着一群孩子的恐惧心理，一片绝望的气息在一群孩子中间弥漫开来，那时候我就在想不可不能就这么死在这里面啊，就喝了两瓶饮料，上了几个小时的网，就把命搭进去，怎么想怎么不值得啊。<br><br>就在大家都绝望的时刻，门开了，老板回来了。<br><br>老板看起来一脸疲惫，手上还拿了一袋子烧烤，看着我们一群眼睛都哭肿的孩子，连连道歉，然后把烧烤拿出来给我们分了，大概就是想收买我们。<br><br>想回家的孩子就自己直接拿着烧烤回家，不急着回家的就在网吧一起吃烧烤，我和两个发小选择留下来，因为回去家里也没人，还不如一起吃着烧烤聊下天。<br><br>无聊就问起老板今天去那了，老板也没说，只是看着他身上有挺多擦伤的，应该是路上出了什么事故，不然也不会这么晚回来，聊着聊着老板说他这网吧要关门了，叫我们三个走的时间拿些零食饮料回去，看着老板有些失落的样子，我也有些舍不得。<br><br>我不禁回想起关于这家网吧，暑假这两个月，我每天呆在这家网吧的时间比在家里还多，那时候父母都忙，每天早出晚归，也没人管我，我就天天在这家网吧上网，我其实并不是特别喜欢玩游戏，只是喜欢这家网吧的氛围，大家彼此之间都认识，也没有陌生人来，与其说这是家网吧，不如说是个聚会场所。<br><br>每天熟练的进来打一圈招呼，和老板寒暄几句，然后来开台机子，还没有坐下就会有人和你约架魔兽争霸，一群围观者就开始起哄，两个人的对决，其他人也放下手中的游戏，来围观着你们约架的结果。<br><br>网吧又响起一首熟悉的《哥只是个传说》，一群孩子围着两个孩子的对决目不转睛，有大呼小叫的，有好为人师的，每个人都很忘我，那怕网吧空间很小，电风扇风力不足，但也不会影响那些忘我的孩子们，这就是网吧的记忆，它总是莫名的给你归属感，让你觉得你并不孤单。<br><br>发个回答，延迟了一个小时，也是醉了
									</div>
									<div class="text-footer">
										<a href="#">关注问题</a>
										<a href="#">295 条评论</a>
										<span class="hidelabel">
										<a href="#">感谢</a>
										<a href="#">分享</a>
										<a href="#">收藏</a>
										<a href="#">没有帮助</a> 
										<a href="#">举报</a>
									</span>
										<a href="#">作者保留权利</a>
										<span class="takebackspan"><a>收起</a></span>
									</div>
									<div class="separator"></div>
								</div>
								<div class="text-block">
									<div class="question">
										<a href="#">拥有稀有的姓，是种怎样的体验？</a>
									</div>
									<div style="position: relative;">
										<button class="thinking">3327</button>
										<span class="author-info">
										<a href="#" class="author-name">仲树</a>
										<span class="author-signal">, 生于杭城，居于巴厘岛，学在波士顿</span>
										</span>
									</div>
									<div class="text">
										<span class="word">姓诸葛，祖籍浙江。浙江有个兰溪八卦村，是诸葛亮后裔的最大聚居地，我有一些远房亲戚就住在那里。每一个知道我姓诸葛的人，都会下意识地问：“哇，那你该不是诸葛亮的后代吧？”这种无心问题的正确回答方式，自古以来都是：低头莞尔一笑，随之连连摆手“哪… </span>
										<span class="showall">显示全部</span>
									</div>
									<div class="text-all">
										<p>姓诸葛，祖籍浙江。</p>
										<p>浙江有个兰溪八卦村，是诸葛亮后裔的最大聚居地，我有一些远房亲戚就住在那里。</p>
										<p>每一个知道我姓诸葛的人，都会下意识地问：“哇，那你该不是诸葛亮的后代吧？”</p>
										<p>这种无心问题的正确回答方式，自古以来都是：低头莞尔一笑，随之连连摆手“哪有哪有不是不是，您见笑了”，这样就可以迅速转移到下一个话题。</p>
										<p>但是我每次只能尴尬地笑，“您别说，还真是哦！”</p>
										<p>那完了，从小到大，认识所有人的前十分钟，就是讨论诸葛亮后代的故事，比如诸葛亮世孙为什么会迁居到浙江，比如家族谱长什么样，比如我去八卦村要不要付门票。我不太喜欢和别人交流的时候一直占据对话的中心，但是每次都摆脱不了。</p>
										<p>而且上课的时候干了什么很蠢的事情，做错了题目，老师都会说：你怎么能给诸葛亮丢脸呢？</p>
										<p>小学最沉重的偶像光环，就是不能给诸葛亮丢脸。我还记得小时候根深蒂固的恐惧，每次考试没考好，就会诚惶诚恐地在心里拜一拜老祖宗，觉得自己给祖上丢脸了。</p>
										<p>诸葛笔画超多，每次考试写名字比别人慢很多。而且按照字母排队的时候，我永远都是最后一位，还没遇见比我还靠后的姓氏。</p>
										<p>从小到大大家都记得我的名字，每次认识新朋友的时候，我总是那个忘记别人叫什么的人。记得自己一直以来因此特别特别愧疚。</p>
										<p>初中时候最好的朋友姓端木 ，一开始大家都是复姓四字名，惺惺相惜。记得我们班一直到分班我和端木双双出国前，都是诸葛班长和端木副班长。^_^</p>
										<p>因为不想引人注目，我初中一毕业，就开始用假名。健身房、补习班、注册会员，所有不需要看证件的地方，从来不用真名。现在如果有人在街上大叫我的名字，会吓一跳，有一种做错大事的感觉。</p>
										<p>（所以！请不要叫我真名了！谢谢侬！）</p>
										<p>在国外，zhuge虽然是一个看起来挺奇怪的姓，而且没有人知道怎么发音，但是起码不需要在见面的时候跟人报族谱，为此我还松了一口气。</p>
										<p>但一直到几年前的夏天的一件小事，我才因为自己的姓氏，意识到中华文化的传播之广扎根之深。</p>
										<p>那时侯我在巴厘岛，帮一个朋友跟当地名望很高的婆罗门氏族的家庭做生意。谈了几次都有点不了了之，双方有些僵持不下。跟我见面的是那个婆罗门氏族家的大儿子，他娶了一个老婆是华裔印尼人（第五代了，只会讲福建话不会讲普通话）。我们谈判陷入僵局准备下次再来的时候，他妻子突然带着儿子女儿出来问我：“你的姓是不是诸葛亮的诸葛？”</p>
										<p>然后我发现他们家虽然不是中国人，只沾了一点点华裔的边儿，但是非常注重中华文化的教育。家里的小孩从小就读四大名著，三国演义读得滚瓜烂熟。第一次在现实生活中碰到姓诸葛的人，小孩激动得眼泪都下来了。</p>
										<p>最后，这笔生意就在我是武侯后裔的前提之上，被他老婆大力促成了。</p>
									</div>
									<div class="text-footer">
										<a href="#">关注问题</a>
										<a href="#">638 条评论</a>
										<span class="hidelabel">
										<a href="#">感谢</a>
										<a href="#">分享</a>
										<a href="#">收藏</a>
										<a href="#">没有帮助</a> 
										<a href="#">举报</a>
									</span>
										<a href="#">作者保留权利</a>
										<span class="takebackspan"><a>收起</a></span>
									</div>
									<div class="separator"></div>
								</div>
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

		<!--提问Modal-->
		<%@ include file="/jsp/askrule.jsp" %>

		<!--反馈Modal-->
		<%@ include file="/jsp/feedback.jsp" %>

		</div>
	</body>

</html>