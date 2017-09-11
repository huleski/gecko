<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>首页</title>
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
				/*height: 50px;*/
				background-color: white;
				width: 100%;
				position: fixed;
				top: 0;
				z-index: 1;
				text-align: center;
			}
			
			.topmenu {
				color: lightgray;
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
				margin: 10px 0;
				background-color: white;
				padding: 16px;
				border-radius: 3px;
				line-height: 1.7;
			}
			
			.closeblock {
				font-size: 15px;
				display: none;
			}
			
			.text-dynamic {
				color: gray;
				font-size: 15px;
			}
			
			.text-author {
				margin-top: 10px;
				margin-bottom: 10px;
			}
			
			.text-author .photo {
				width: 25px;
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
			
			.text-content {
				font-size: 15px;
				margin-bottom: 15px;
				cursor: pointer;
			}
			
			.text-all {
				display: none;
			}
			
			.opinion {
				color: deepskyblue;
				font-size: 14px;
			}
			
			.text-end {
				position: relative;
			}
			
			.takeback {
				position: absolute;
				top: 5px;
				right: 5px;
				display: none;
			}
			
			.text-situation {
				margin-left: 25px;
				cursor: pointer;
			}
			
			.answerblock .text-content .expand {
				font-size: 14px;
			}
			
			.answerblock .keepgap {
				margin-left: 10px;
			}
		</style>
		<style type="text/css">
			#browseDiv {
				width: 700px;
				height: 600px;
				float: left;
			}
			
			#rightDiv {
				float: left;
				width: 300px;
				height: 300px;
				margin-top: 10px;
				margin-left: 10px;
			}
			
			#icoDiv {
				width: 300px;
				height: 175px;
				background-color: white;
				border-radius: 3px;
			}
			
			#navDiv {
				width: 300px;
				height: 260px;
				background-color: white;
				margin-top: 10px;
				border-radius: 3px;
				padding-top: 5px;
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
				width: 95%;
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
		</style>

		<script type="text/javascript">
			$(function() {
				$(".topmenu").hover(function() {
					$(this).css("color", "gray");
				},
				function() {
					$(this).css("color", "lightgray");
				});
				
				
				$(window).scroll( function() {
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
		<script type="text/javascript">
			$(function() {
				$("#alive").hover(function() {
					$("#live").css("color", "#FFCF00");
				}, function() {
					$("#live").css("color", "#337AB7");
				});
				$("#abookstore").hover(function() {
					$("#bookstore").css("color", "#43D480");
				}, function() {
					$("#bookstore").css("color", "#337AB7");
				});
				$("#acircletable").hover(function() {
					$("#circletable").css("color", "deepskyblue");
				}, function() {
					$("#circletable").css("color", "#337AB7");
				});
				$("#acolumn").hover(function() {
					$("#column").css("color", "dodgerblue");
				}, function() {
					$("#column").css("color", "#337AB7");
				});
				$("#apay").hover(function() {
					$("#pay").css("color", "blueviolet");
				}, function() {
					$("#pay").css("color", "#337AB7");
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
//					var $userComment = $(this).parents(".user-comment");
//					$userComment.find(".comment-reply").show();
				});
				
				$(".comment-cancel").click(function() {
					$(this).parents(".comment-reply").hide();
					$(this).parents(".comment-reply").prev(".comment-situation").show();
				});
				
			// 滑动到页面底部实现自动加载
			var totalheight = 0;
			var htm_index = 0;
			$(window).scroll(function() {
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
				if((totalheight >= $(document).height()) && (htm_index < 5)) {
					alert("滑动到页面底部发送ajax自动加载");
					/*$.get("/Load_List.aspx", { page: htm_index++ }, function(data) {
						$("#LoadDIV").before(data);
					});*/
				}
			});
			});
		</script>
	</head>

	<body>
		<div class="">
			<!-- 引入导航栏 -->
			<%@ include file="/jsp/header1.jsp" %>

			<div style="width: 1020px;margin: auto;margin-top: 50px;">
				<!--浏览内容div-->
				<div id="browseDiv">
					<c:if test="${not empty user }">
						<div class="answerblock" style="font-size: 16px;">
							<a href="#" data-toggle="modal" data-target="#askModal">
								<span class="glyphicon glyphicon-question-sign"></span> 提问
							</a>
							<a href="${pageContext.request.contextPath}/jsp/answer.jsp" style="margin-left: 40px;">
								<span class="glyphicon glyphicon-file"></span> 回答
							</a>
							<a href="${pageContext.request.contextPath}/jsp/writearticle.jsp" style="margin-left: 40px;">
								<span class="glyphicon glyphicon-pencil"></span> 写文章
							</a>
							<a href="#" style="margin-left: 360px;">
								草稿
							</a>
						</div>
					</c:if>
						
					<!--关注动态(只有关注了别人才会有内容)-->
					<div class="answerblock">
						<div class="text-dynamic">
							特种作死狗 收藏了回答 1 天前
							<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
						</div>
						<div class="text-author">
							<a href="#">
								<img class="photo" src="${pageContext.request.contextPath}/img/author1.jpg" />
								<span class="name">
								Sean Ye
								</span>
							</a>
							<span class="signal">
								,人力资源（HR）话题优秀回答者 公众号：瞎说职场 HR…
							</span>
						</div>
						<div class="text-title">
							<a href="#" class="text-title-a">三十岁还没有走到管理岗的人，后来都做了什么？</a>
						</div>
						<div class="text-content">
							答：他们可以过得很好，只要做到几点（后面详述）前些年，公司每年都派个美国老大爷要飞一趟上海，做全球人才管理方面的培训，头发花白，感觉要60岁了吧（问他，他总说20出头）。人特别精神，每天早上6点就起床，在酒店泳池游1个小时再来上班。而他每年全球…
							<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
						</div>
						<div class="text-all">
							<p>答：他们可以过得很好，只要做到几点（后面详述）</p>
							<p>前些年，公司每年都派个美国老大爷要飞一趟上海，做全球人才管理方面的培训，头发花白，感觉要60岁了吧（问他，他总说20出头）。人特别精神，每天早上6点就起床，在酒店泳池游1个小时再来上班。</p>
							<p>而他每年全球各地跑，将多年来经验传播给大家。年薪绝对不低，据说这是他舍不得退休的原因之一。</p>
							<p>他是公司这个领域的专家，公司内部职级很高，但他不是经理，不是总监，光杆司令一个。</p>
							<p>后来人不来了，据说实在干不动，退休了。</p>
							<p>--------------------国内的例子-------------------</p>
							<p>在美世中国区，我也有一位老乡，70后，做销售工作，因为经验丰富，对业务的了解很深刻，甚至可以独立做部分咨询工作，客户也很尊重他。大家都叫他崔叔。</p>
							<p>崔叔对当领导一点兴趣也没有，私聊的时候，他说不喜欢管别人，目标就是把自己练成这个领域的专家——给美国老大爷一样。</p>
							<p>他后来辞职高就其他公司，还是销售工作，还是独来独往，还是不带人，也还是受人尊敬。</p>
							<p>说实话，有一天他自己单干，我也不会意外。他有足够的才能和经验，只需要一个平台，而企业绝逼会尽力给这种人才提供足够好的平台，让他发挥才能的。</p>
							<p>在咨询公司，我们常常会讨论未来的职场会怎样，而主流观点是：</p>
							<p><b>传统的工业时代的雇用市场逐渐开始消失，人才作为个体的价值迅速崛起。企业更多是扮演平台的角色</b>。</p>
							<p>未来互联网时代的职场，人才的话语权和自主权远比工业时代产线上的工人来得大，他们足够优秀，可以挑选平台，甚至成为独立第三方，为企业提供服务。</p>
							<p>换句话说，<b>未来将是专家（超级个体）时代</b></p>
							<p>---------------Sean开始查资料了--------------</p>
							<p>很多小伙伴来公众号值乎问我这样一个问题：</p>
							<blockquote>我XX专业，XX二专，XX大学交换，在大学做过XX工作，在X企业实习过X岗位，性格XX，请你为我规划职业发展……</blockquote>
							<p>我很无奈。</p>
							<p>职业发展这事得自己做：</p>
							<ol>
								<li>自己了解自己，更合适，你凭什么愿意相信一个远隔千里的陌生人，而不相信自己？</li>
								<li>自己做规划，遇到困难更能坚持，自己约的炮含泪也得那啥；别人帮你做的，你早不干了。</li>
							</ol>
							<p>而职业生涯的路总的来说，大约是两个方向：</p>
							<p><b>管理者和专家</b>。</p>
							<p>你到底选哪个方向，取决于你的工作价值观。</p>
							<p>工作适应理论（Work Adjustment Theory，明尼苏达大学的两位学者Rene V. Dawis和Lloyd H. Lofquist的研究成果）中把工作价值观细分成：</p>
							<p>成就：你如何看待工作成就感；</p>
							<p>舒适：你是否看重稳定和舒适的工作；</p>
							<p>地位：你是否追求晋升成为管理者；</p>
							<p>利他主义：你是否想做一份帮助他人的工作；</p>
							<p>安全感：你是否希望公司更透明更一视同仁；</p>
							<p>自主权：你是否希望获得更多自由发挥的空间。</p>
							<p>这些因素中的绝大部分和我们最后选择的方向有些关联，比如：</p>
							<ul>
								<li>你如何看待成就感？自己一己之力成就大单更爽？还是看着自己提拔的年轻人拿到大单更爽？</li>
								<li>你是否追求晋升？你是否喜欢管理人？</li>
								<li>你是否希望得到更大的自主权？一般来说，作为专家的身份更具有自主权，我们通常以为做领导就会有自主权，但在很多公司领导被上级的任务压得喘不过气，下属也需要自己带，自己的自主决策空间并没有想象中大。</li>
							</ul>
							<p>你去问一个大学生未来的职业发展计划，绝大多数会告诉你，ta希望毕业5-8年内做到管理者，当然这个时间越短越好。</p>
							<p>这一定好吗？不一定。</p>
							<h2>你是做管理人才的料吗？</h2>
							<p><br></p>
							<p><br></p>
							<p>做管理人才，通常需要点亮整颗技能树</p>
							<p>1.沟通能力</p>
							<p>你不可能总靠自己的权威去压制下属；更别说同级别的经理和上司。你需要有强有力的说服力，也应当有聆听别人给予及时正确反馈的技能，要会演讲，也要会妥协。</p>
							<p>2.利他思维</p>
							<p>领导不是自己成功就可以了，你需要带着整个团队成功；很多成功的职场人一当上经理就变得神经紧张。他们喜欢以己度人，我能这么做，效果很好，为什么你们不行？</p>
							<p>但事实上你那套东西对你有用，对其他人未必。领导者可以从下属角度出发为他们思考分析解决问题，才是真正领导力；</p>
							<p>3.全面的管理技能</p>
							<p>预算安排，组织架构调整，跨部门协作…从事管理岗位要求你能在多项任务间变换角色，灵活应对。</p>
							<p>…</p>
							<p>我见过不少出色的专业人才，在进入管理岗位后变得无所适从，甚至自我质疑。也见过挺漂亮可爱的姑娘一进办公室变得一副全办公室欠我500万的脸色，对着下属吹鼻子瞪眼。</p>
							<p>他们可能很有才华，但至少暂时不适合做领导。</p>
							<h2>你是专家人才的料吗？</h2>
							<p>专家得往某几个专项技能上狠下功夫：</p>
							<p>不停歇的学习精神：</p>
							<p>再牛的专家也要学习，一旦停下脚步或者你的知识过时了，很可能就要被组织淘汰。</p>
							<p>创新精神：</p>
							<p>你的知识领域如何与新的市场结合？如何适应新的环境？一旦有一天新的竞争对手从另一个维度杀来，你是否做好准备？</p>
							<p>共享精神：</p>
							<p>你是否愿意传播自己的知识，是否愿意为人师，是否善于做演讲。公司养专家，是因为脱离技术/知识岗位的管理者不可能再专精于技术/知识，当企业需要技术或者知识分享给普通员工时，就需要专家角色。</p>
							<p>独立解决问题的能力：</p>
							<p>以咨询行业为例，哪位能称之为专家的顾问，不都是曾以一己之力抗着项目朝前走的超人。</p>
							<p><b>职场人常见的误区：</b></p>
							<p>1.<b>以为不做领导就没有出路</b>；实际上以企业金字塔式的结构，真正能坐上去的是极少数；角力过程的失败者，最好的生存方式就是作为专家。而且专家的路更自由更灵活，尤其是咨询公司的顾问们，如今很多是独立的高管教练，比高管还牛还自在。</p>
							<p>2.<b>以为做管理会很轻松</b>：事实上，做专家比做管理要轻松。不用背团队指标，不用挣扎在复杂的人际关系中，不用去做一些违背价值观的事情（比如裁员），有更大的灵活度和自主权。</p>
							<p>3.<b>以为做管理更不容易失业</b>：一旦需要裁员，大家觉得裁人的权利在主管手里，自然不会自裁，专家就不行了，没权利。这就忽视了专家长期浸淫知识/技术/业务第一线，他对风险的敏感度最高，一旦风吹草动他就跳槽了或者转战为独立咨询顾问了，灵活性高；管理层反而容易被蒙在鼓里，等反应过来已经迟了。况且管理层被裁后绝不像专家那么容易再就业。</p>
							<p>4.<b>认为做领导有权威</b>：真正的权威来源自我们的能力和格局。能力，一件棘手的问题你能解决别人当然会服气；格局，是指你如何保护下属，如何帮助你的团队成长。</p>
							<p>有一种说法，一流领导招一流人才，二流领导招三流人才，因为二流领导慌啊，怕一流人才抢了饭碗。他不愿意招牛人，更不愿意把年轻人培养成牛人。<br></p>
							<p>我见过不少所谓的领导只是发号施令的boss，不是帮助人成长的leader。我见过不少领导，虽有实权，但下属视他为笑话，他只能用职位压人干活。</p>
							<p>我也见过毫无实权的专家，他照看好身边的小伙伴，身边人都将他看作leader，尊敬他听从他的建议。</p>
							<p>用美国领导力专家Simon Sinek的话收尾</p>
							<p><b>Leadership is a choice, not a rank.</b></p>
							<p><br></p>
							<p><b>公众号：瞎说职场 （HRInsight）</b></p>
							<p>其他职业发展话题的回答：</p>
						</div>
						<div class="text-end">
							<button class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-up opinion"><span class="keepgap">10K</span></span>
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

					<div class="answerblock">
						<div class="text-dynamic">
							显微无间 赞同了回答1 天前
							<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
						</div>
						<div class="text-author">
							<img class="photo" src="${pageContext.request.contextPath}/img/annoymouse.jpg" />
							<span class="name">
							熊Sir
						</span>
							<span class="signal">
							, 微信公众号【无名老卒】，产品总监
						</span>
						</div>
						<div class="text-title">
							<a href="#" class="text-title-a">俄罗斯人编程为什么那么厉害？</a>
						</div>
						<div class="text-content">
							因为毛子能死磕上大学（哈工大计算机）的时候老师讲过一个段子：我系自然语言识别团队搞了一套语音识别，准确率还可以，就是这个性能实在是差，识别普通长度的话要10秒，这边的团队死活优化不了了。然后送给了毛子的科学家去优化，优化了2个月性能提高到了1…
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
							<button class="btn btn-default">
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
							<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
								···
							</a>
							</span>
							<button class="takeback btn btn-info btn-xs">收起</button>
						</div>
					</div>
					<div class="answerblock">
						<div class="text-dynamic">
							路人甲 赞同了回答1 天前
							<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
						</div>
						<div class="text-author">
							<img class="photo" src="${pageContext.request.contextPath}/img/author2.jpg" />
							<span class="name">
							LuvDDDD
						</span>
							<span class="signal">
							,像个笑话一样自己都嘲讽。公众号：陈阿蛋
						</span>
						</div>
						<div class="text-title">你的好朋友杀了人，向你求救，你会怎么办？</div>
						<div class="text-content">
							真的碰到过。 那年我十九岁，刚放暑假，和朋友出去吃火锅，吃到晚上快十一点他送我到家楼下然后走了，我卸妆换衣服准备睡觉，过了半个小时突然有人敲我的门。 我问是谁，他说蛋蛋是我。 我开门问他干嘛，他说进去说，出事了。 我感到蛮奇怪的，因为他一直是天不怕地不怕的性格，我第一次看见他慌成这样。 我问他出什么事了，他说自己开车撞到人了。 看
							<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
						</div>
						<div class="text-end">
							<button class="btn btn-default">
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
							<a class="text-situation report" data-placement="bottom" data-html="true" data-content='<ul class="nav nav-pills nav-stacked"><li><a href="#">没有帮助</a></li><li><a href="#">举报</a></li></ul>'>
								···
							</a>
							</span>
						</div>
					</div>
					<div class="answerblock">
						<div class="text-dynamic">
							来自话题: 互联网
							<span class="closeblock glyphicon glyphicon-remove btn" style="float: right;top: -10px;right: -10px;"></span>
						</div>
						<div class="text-author">
							<img class="photo" src="${pageContext.request.contextPath}/img/author3.jpg" />
							<span class="name">
							冷漠.jpg
						</span>
							<span class="signal">
							,不入流的程序猿
						</span>
						</div>
						<div class="text-title">迅雷？不，是你的迅雷</div>
						<div class="text-content">
							多图，流量党慎入！！！ 作为一个资深软件控，作者很多时候都被深深软件强大的功能深深吸引，但又痛心于无恶不作的广告，像这样： 网络上流传着各种迅雷的7.9版或者是去广告版， 界面像这样 这种精简版一旦更新，就又回到无恶不作的迅雷，不，是广告无处不在的迅雷。 但很多时候，由于特殊原因，我们总是想要使用最新版，比如，作者的强迫症 所以今
							<a class="expand">…阅读全文<span class="glyphicon glyphicon-chevron-down keepgap"></span></a>
						</div>
						<div class="text-end">
							<button class="btn btn-default">
							<span class="glyphicon glyphicon-thumbs-up opinion"><span class="keepgap">2.9K</span></span>
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
								<span class="glyphicon glyphicon-flag"></span>
								<span>举报</span>
							</a>
							</span>
						</div>
					</div>
				</div>

				<!--右侧导航栏div-->
				<div id="rightDiv">
					<div id="icoDiv">
						<a id="alive" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-flash" style="color: #FFCF00;font-size: 25px;"></span><br />
						<span class="icoexplain" id="live">Live</span>
						</button>
						</a>
						<a id="abookstore" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-book" style="color: #43D480;font-size: 25px;"></span><br />
						<span class="icoexplain" id="bookstore">书店</span>
						</button>
						</a>
						<a id="acircletable" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-asterisk" style="color: deepskyblue;font-size: 25px;"></span><br />
						<span class="icoexplain" id="circletable">圆桌</span>
						</button>
						</a>
						<a id="acolumn" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-pencil" style="color: dodgerblue;font-size: 25px;"></span><br />
						<span class="icoexplain" id="column">专栏</span>
						</button>
						</a>
						<a id="apay" class="iconcls" href="#">
							<button class="icobtn">
						<span class="glyphicon glyphicon-usd" style="color: blueviolet;font-size: 25px;"></span><br />
						<span class="icoexplain" id="pay">付费咨询</span>
						</button>
						</a>
					</div>
					<div id="navDiv">
						<ul class="nav nav-pills nav-stacked">
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-star" style="margin-right: 10px;"></span>
									<span> 我的收藏</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-exclamation-sign"><span/>
 								<span>
 									我关注的问题
 									<button class="btn btn-xs" style="color: white;position: relative;right: -120px;">58</button>
 								</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-glass"><span/>
 								<span>我的邀请</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-cutlery"><span/>
 								<span>社区服务中心</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-bookmark"><span/>
 								<span>版权服务中心</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-transfer"><span/>
 								<span>公共编辑动态</span>
								</a>
							</li>
						</ul>
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
			
			<!-- 提问模态框 -->
			<%@ include file="/jsp/askmodal.jsp" %>
			
			<!-- 反馈模态框 -->
			<%@ include file="/jsp/feedback.jsp" %>
		</div>
	</body>

</html>