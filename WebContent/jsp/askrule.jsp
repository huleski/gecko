<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提问须知模态框</title>
</head>
<body>
	<!--提问Modal-->
	<div id="askModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: deepskyblue;border-top-left-radius: 6px;border-top-right-radius: 6px;height: 35px;
					padding: 5px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin:3px 8px 0 0;">×</button>
					<span style="color: white;margin-left: 10px;font-weight: bold">提问</span>
				</div>
				<div class="modal-body" style="text-align: left; margin: 0 20px 0 20px;">
					<p>
						逼乎是一个真诚、友善、认真、互助的社区<br> 我们希望每一个疑惑都有解答，好的问题更容易得到好答案
						<a href="#">如何提一个好问题？</a>
					</p>
					<p>
						<b>提问应遵循真实、客观、简洁、明确、规范的原则</b><br> 1、提问应尽可能简洁明了，避免「请问」「有谁知道」「谢谢！」等与问题本身无关的附加语。
						<br> 2、应避免使用「为神马」「童鞋」「肿么办」等网络用语。
						<br> 3、基于个人判断或传言的问题，在提问时应在补充说明里详细说明原由
						<br> 4、避免太宽泛问题，如调查性的问题容易变成每个人都可以发表观点，但对其他人没有价值。
						<br>
					</p>
					<p>
						<b>逼乎禁止这些提问</b><br> 1、和已有问题完全重复的问题，
						<b>为避免重复，提问前可以先进行搜索</b><br> 2、招聘 / 求职、交易 / 合作、寻人 / 征友、召集 / 赠送、求码类内容<br> 3、投票类问题。例如：你支持方舟子还是韩寒？
						<br> 4、作业或其他希望代为完成个人任务类的内容，以及针对个人具体病情的求医问药类问题
						<br> 完整的提问建议可查看
						<a href="#">逼乎的提问规范有哪些？</a><br>
					</p>
					<div class="before-ask-form">
						<b>提问前请先搜索</b>
						<div style="position:relative;margin-top:18px;">
							<input type="text" class="form-control" placeholder="请输入你的问题"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>