<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/html2canvas.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/frontend.js" type="text/javascript"></script>
<title>反馈</title>
</head>
<body>
	<!--feedBack -->
	<span class="feedback" data-toggle="modal" data-target="#feedBackModal">
		<button class="btn btn-default" style="font-size: 18px; color: gray;">
			<span class="glyphicon glyphicon-briefcase" onclick="snapscreen()"></span>
		</button>
	</span>
	
	<!--反馈Modal-->
	<div id="feedBackModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">提交反馈</h4>
				</div>
				<form action="${pageContext.request.contextPath}/" method="get">
					<div class="modal-body" style="text-align: left; margin: 0 20px 0 20px;">
						<div style="margin-top: 20px;">
							<textarea class="form-control" rows="4" style="font-size: 18px;" placeholder="告诉我们你的建议或遇到的问题" required=""></textarea>
						</div>
						<br /><br />
						<label>屏幕截图(可选):</label>
						<div id="showScreen" style="width: 530px;height: 280px;"></div>
						<div class="checkbox">
							<br />
							<label>
    									<input type="checkbox" checked=""> 提交屏幕截图<br />
  								</label>
						</div>
					</div>
					<div class="modal-footer" style="text-align: center;">
						<!--需要给此按钮绑定ajax事件-->
						<button type="submit" class="btn btn-info btn-lg " style="width: 250px;" data-dismiss="modal">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>