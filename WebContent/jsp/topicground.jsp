<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>话题广场</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
				color: deepskyblue;
			}
			
			.separator {
				height: 1px;
				background-color: lightgray;
			}
			.rightseparator {
				height: 1px;
				background-color: lightgray;
				margin: 20px;
			}
			#topicground {
				width: 270px;
			}
			.topicphoto {
				width: 40px;
				height: 40px;
				margin-right: 10px;
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
				top:9px
			}
			.topic-outdiv {
				position: relative;
				width: 660px;
				height: 100px;
			}
			.topic-leftdiv {
				width: 320px;
				margin: 20px 0;
				position: absolute;
				left: 0;
			}
			.topic-rightdiv {
				width: 320px;
				margin: 20px 0;
				position: absolute;
				right: 0;
			}
			.topic-img {
				border-radius: 5px;
				width: 50px;
				height: 50px;
			}
			.topic-info {
				position: absolute;
				top: 0;
				left: 60px;
				font-size: 13px;
			}
			.topic-msg {
				font-weight: bold;
				position: relative;
			}
			.topic-introduction {
				line-height: 1.6;
				margin-top: 5px;
				position: relative;
			}
			.topic-foucus {
				position: absolute;
				right: 0;
			}
			#rootDiv a {
				margin-right: 15px;
			}
			#ADpic {
				width: 270px;
				height: 270px;
				border-radius: 6px;
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
				
				/*回到顶部*/
				$("#gotobtn").click(function() {
					 $('body,html').animate({scrollTop:0}, 500);
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
			
			<!--话题展示-->
			<div style="width: 1000px;margin: auto;margin-top: 80px;">
				<div style="width:650px;float: left;">
					<div>
						<span style="font-weight: bold;margin-left: 20px;">话题广场</span>
						<a href="#" style="margin-left: 475px;">已关注8个话题</a>
					</div>
					<div style="height: 1px;background-color: darkgray;margin-top: 10px;"></div>
					<div style="padding: 15px 0;">
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=1"><button class="focusedtopic">游戏   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=2"><button class="focusedtopic">运动   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=3"><button class="focusedtopic">互联网  </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=4"><button class="focusedtopic">艺术   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=5"><button class="focusedtopic">阅读   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=6"><button class="focusedtopic">美食   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=7"><button class="focusedtopic">动漫   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=8"><button class="focusedtopic">汽车   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=9"><button class="focusedtopic">生活方式 </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=10"><button class="focusedtopic">教育   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=11"><button class="focusedtopic">摄影   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=12"><button class="focusedtopic">历史   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=13"><button class="focusedtopic">文化   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=14"><button class="focusedtopic">旅行   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=15"><button class="focusedtopic">职业发展 </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=16"><button class="focusedtopic">经济学  </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=18"><button class="focusedtopic">足球   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=19"><button class="focusedtopic">篮球   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=20"><button class="focusedtopic">投资   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=17"><button class="focusedtopic">音乐   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=26"><button class="focusedtopic">电影   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=27"><button class="focusedtopic">法律   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=28"><button class="focusedtopic">科学 </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=29"><button class="focusedtopic">设计   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=30"><button class="focusedtopic">创业   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=21"><button class="focusedtopic">健康   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=22"><button class="focusedtopic">商业   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=23"><button class="focusedtopic">体育   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=24"><button class="focusedtopic">科技   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=25"><button class="focusedtopic">化学   </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=31"><button class="focusedtopic">物理学  </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=32"><button class="focusedtopic">生物学  </button></a>
						<a href="${pageContext.request.contextPath}/topicServlet?method=findById&id=33"><button class="focusedtopic">金融   </button></a>
					</div>
					
					
					<div class="topic-outdiv">
						<div class="separator"></div>
						<div class="topic-leftdiv">
							<a href="#"><img class="topic-img" src="${pageContext.request.contextPath}/img/game.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">游戏</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									游戏 是一种在特定时间、空间范围内遵循某种特定规则的，追求精神…
								</div>
							</div>
						</div>
						<div class="topic-rightdiv">
							<a href="#"><img src="${pageContext.request.contextPath}/img/singlegame.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">单机游戏</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									单机游戏（Single-Player Game），相对于联网游…
								</div>
							</div>
						</div>
					</div>
					
					<div class="topic-outdiv">
						<div class="separator"></div>
						<div class="topic-leftdiv">
							<a href="#"><img class="topic-img" src="${pageContext.request.contextPath}/img/electricgame.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">电子竞技</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									电子竞技 是指使用电脑游戏来比赛的体育项目。随着游戏对经济、社…
								</div>
							</div>
						</div>
						<div class="topic-rightdiv">
							<a href="#"><img src="${pageContext.request.contextPath}/img/netgame.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">网络游戏</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									网络游戏，也称在线游戏（Online Game），一般指多名玩…
								</div>
							</div>
						</div>
					</div>
					
					<div class="topic-outdiv">
						<div class="separator"></div>
						<div class="topic-leftdiv">
							<a href="#"><img class="topic-img" src="${pageContext.request.contextPath}/img/phonegame.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">手机游戏</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									手机游戏是指运行在手机等移动设备上的游戏软件。
								</div>
							</div>
						</div>
						<div class="topic-rightdiv">
							<a href="#"><img src="${pageContext.request.contextPath}/img/lol.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">英雄联盟(LOL)</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									英雄联盟（LoL） 是由美国 Riot Games 开发，中国…
								</div>
							</div>
						</div>
					</div>
					
					<div class="topic-outdiv">
						<div class="separator"></div>
						<div class="topic-leftdiv">
							<a href="#"><img class="topic-img" src="${pageContext.request.contextPath}/img/gamedesign.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">游戏设计</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									游戏 是一种在特定时间、空间范围内遵循某种特定规则的，追求精神…
								</div>
							</div>
						</div>
						<div class="topic-rightdiv">
							<a href="#"><img src="${pageContext.request.contextPath}/img/iosgame.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">iOS游戏</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									iOS 平台的游戏，安装在 iPod touch 或 iPho…
								</div>
							</div>
						</div>
					</div>
					
					<div class="topic-outdiv">
						<div class="separator"></div>
						<div class="topic-leftdiv">
							<a href="#"><img class="topic-img" src="${pageContext.request.contextPath}/img/gameplan.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">游戏策划</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									游戏策划师，即是游戏的产品经理。
								</div>
							</div>
						</div>
						<div class="topic-rightdiv">
							<a href="#"><img src="${pageContext.request.contextPath}/img/wow.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">魔兽世界</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									魔兽世界（World of Warcraft， WoW ，魔兽…
								</div>
							</div>
						</div>
					</div>
					
					<div class="topic-outdiv">
						<div class="separator"></div>
						<div class="topic-leftdiv">
							<a href="#"><img class="topic-img" src="${pageContext.request.contextPath}/img/DotA.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">DotA</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									DotA（Defense of the Ancients） 一…
								</div>
							</div>
						</div>
						<div class="topic-rightdiv">
							<a href="#"><img src="${pageContext.request.contextPath}/img/DOTA 2.jpg" /></a>
							<div class="topic-info">
								<div class="topic-msg">
									<a href="#">刀塔（DOTA 2）</a>
									<a href="#" class="topic-foucus">关注</a>
								</div>
								<div class="topic-introduction">
									刀塔（DOTA 2） 是一款由 Valve 公司以及 DotA…
								</div>
							</div>
						</div>
					</div>
					
					<button class="btn btn-block btn-default" style="margin: 50px 0 120px 0;">更多</button>
				</div>

				<!--右边div-->
			<div style="float:left;margin-left: 50px;">
				<div id="topicground">
					<div><img id="ADpic" src="${pageContext.request.contextPath}/img/LL.jpg"/></div>
					<div style="position: relative;margin: 15px;">
						<span style="font-weight: bold;">热门话题</span>
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
						<div class="rightseparator"></div>
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
						<div class="rightseparator"></div>
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
						<div class="rightseparator"></div>
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
			<button class="glyphicon glyphicon-arrow-up btn" style="font-size: 20px;padding: 5px 10px;" ></button>
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