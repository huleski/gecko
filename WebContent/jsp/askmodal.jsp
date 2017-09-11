<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--提问Modal-->
	<div id="askModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<div style="margin-top: 40px;text-align: center;">
						<h3>写下你的问题</h3>
						<span style="color: darkgray;">描述精确的问题更易得到解答</span>
					</div>
					<div>
						<form action="${pageContext.request.contextPath}/" method="post">
							<div>
								<textarea class="form-control" rows="3" placeholder="问题标题"></textarea>
								<input class="form-control input-lg" style="font-size: 15px;margin-top: 12px;" name="topic" placeholder="添加话题" />
								<h5 style="margin-top: 30px;margin-left: 10px;">问题描述（可选）：</h5>
	
								<!--问题描述(使用editor)-->
								<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
								<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js">
								</script>
								<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
								<div id="editordiv" style="margin-bottom: 15px;">
									<script id="editor" type="text/plain" style="width:568px;height:150px;"></script>
								</div>
								<script src="${pageContext.request.contextPath}/js/editorInstance.js" type="text/javascript"></script>
	
								<div class="checkbox">
									<label>
								    <input type="checkbox" name="anonymous" value="1">
								    匿名提交
								  </label>
								</div>
							</div>
							<div style="text-align: center;">
								<!--需要给此按钮绑定ajax事件-->
								<button type="submit" class="btn btn-info" style="width: 250px;" data-dismiss="modal">提交问题</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>