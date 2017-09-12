<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//点击提问
	function writeQuestioin(){
		if("${user}" == null) {
			$('#loginModal').modal();
		} else {
			$("#askModal").modal();
		}
	}
	
	$(function() {
		$("#topicselect").change(function() {
			if(this.value != 0) {
				$("#submitbtn").attr("disabled", false);
			} else {
				$("#submitbtn").attr("disabled", true);
			}	
		});
		
		$.getJSON("${pageContext.request.contextPath}/topicServlet", {"method": "findAll"}, function(result) {
			$(result).each(function(index, object) {
				$("#topicselect").append("<option value='" + object.id + "'>" + object.name + "</option>");
			});
		});	
		
		$("#submitbtn").click(function() {
			$("#hideContent").val(askUE.getContentTxt());
			$("#questionForm").submit();
		});
	});
</script>
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
						<form id="questionForm" action="${pageContext.request.contextPath}/questionServlet" method="post">
							<input type="hidden" name="method" value="addQuestion" />
							<input id="hideContent" type="hidden" name="pureContent"/>
							<div>
								<textarea name="title" class="form-control" rows="3" placeholder="问题标题" required ></textarea>
								<select id="topicselect" name="tid" class="form-control input-lg" style="margin-top: 12px;" required>
									<option value="0">请选择话题</option>
								</select>
								<h5 style="margin-top: 30px;margin-left: 10px;">问题描述（可选）：</h5>
	
								<!--问题描述(使用editor)-->
								<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
								<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js">
								</script>
								<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
								<div id="editordiv" style="margin-bottom: 15px;">
									<script id="editor" name="content" type="text/plain" style="width:568px;height:150px;">写下你的问题</script>
								</div>
								<script type="text/javascript">
									var askUE = UE.getEditor('editor', {
								        autoClearinitialContent:true, //focus时自动清空初始化时的内容
								        wordCount:false, //关闭字数统计
								        elementPathEnabled:false,//关闭elementPath
								        saveInterval:30000,		//自动保存
								        toolbars: [
										           	['bold', 'italic','horizontal', 'justifycenter', '|', 'blockquote','insertorderedlist','insertunorderedlist', 
										           	'removeformat', '|','simpleupload']
										       	  ]
								    });
									
								</script>
	
								<div class="checkbox">
									<label><input type="checkbox" name="anonymous" value="1">匿名提交</label>
								</div>
							</div>
							<div style="text-align: center;">
								<!--需要给此按钮绑定ajax事件-->
								<button id="submitbtn" class="btn btn-info" disabled style="width: 250px;" type="button">提交问题</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>