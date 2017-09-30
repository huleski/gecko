<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>写文章</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/bi.ico" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#titlepic").hover(function() {
					$("#addpic").slideToggle(50);
				});
				
				//发表文章
				$("#publish").click(function(){
					//判断输入是否为空, 非空才能上传
					$("#hidePureContent").val(articleUE.getContentTxt());
					var content = articleUE.getContentTxt();
					var titlevalue = $("#titleInput").val();
					var topicId = $("#topicselect").val();
					var titlePic = $("#hideTitlePictrue").val();
					if(content != "" && titlevalue != "" && topicId != 0 && titlePic != "") {
						$("#articleForm").submit();
					}
					
				});
				//打开文件上传选择框
				$("#titlepic").click(function() {
					$("#picture").click();
				});
				
				//上传图片
				$("#picture").change(function() {
					var formData = new FormData();
					var file = this.files[0];
					formData.append("titlePicture", file);
					if(!/\.(gif|jpg|jpeg|png|GIF|JPG|JPEG|PNG)$/.test(this.value)) {
						alert("请选择gif,jpg,jpeg,png等格式的图片文件");
						return;
					}
					if(file.size/1024 > 500) {
						alert("图片大小不超过500K");
						return;
					}
					$.ajax({
						url:"${pageContext.request.contextPath}/uploadServlet",
						type:"post",
						data: formData,
						processData:false,
						contentType:false,
						success:function(result) {
							$("#titlepic").attr("src", "/gecko/" + result);
							$("#hideTitlePictrue").val(result);
						},
						error: function(errMsg) {
							console.log(errMsg);
						}
					});
				});
				
				//话题选择框
				$.getJSON("${pageContext.request.contextPath}/topicServlet", {"method": "findAll"}, function(result) {
					$(result).each(function(index, object) {
						$("#topicselect").append("<option value='" + object.id + "'>" + object.name + "</option>");
					});
				});	
			
			});
		</script>
	</head>
	<body>
		
		<!--页面顶部导航栏-->
		<nav class="navbar navbar-default" role="navigation">
		  <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header">
		    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
		      <span class="sr-only">Toggle navigation</span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		    </button>
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="font-size: 30px;">逼</a>
		  </div>
		
		  <!-- Collect the nav links, forms, and other content for toggling -->
		  <div class="collapse navbar-collapse navbar-ex1-collapse">
		  	
		    <ul class="nav navbar-nav navbar-brand" style="margin-left: 400px;">
		      <li style="font-size: 17px;font-weight: bold;color: black;">写文章</li>
		      <li style="font-size: 16px;margin-left: 20px;">草稿自动保存</li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		      <li><button id="publish" class="btn btn-default" href="#" style="margin-top: 8px;">发布</button></li>
		      <li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> ○○○ </a>
		        <ul class="dropdown-menu nav nav-pills nav-stacked">
		          <li><a href="#">草稿</a></li>
		          <li><a href="#">我的文章</a></li>
		          <li><a href="#">专栏.发现 </a></li>
		        </ul>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<div style="margin: auto;width: 660px;position:relative">
			<form id="articleForm" action="${pageContext.request.contextPath}/articleServlet" method="post">
				<input type="hidden" name="method" value="add"/>
				<input id="hidePureContent" type="hidden" name="pureContent"/>
				<input id="hideTitlePictrue" type="hidden" name="titlePicture"/>
				<!--点击上传图片-->
				<input id="picture" type="file" style="display:none"/>
				<img id="titlepic" style="background: #F2F2F2;width: 660px;height: 190px;cursor: pointer;"/>
				<span class="glyphicon glyphicon-camera" style="font-size:30px;position:absolute;top:60px;left:315px;"></span><br/>
				<span id="addpic" style="font-size: 17px;display: none;position:absolute;top:100px;left:295px;">添加题图</span>
				
				<div class="row" style="margin: 15px 0;">
					<div class="col-lg-9">				
						<input class="form-control input-lg" id="titleInput" name="title" type="text" placeholder="请输入标题">
					</div>
					<div class="col-lg-3">	
						<select id="topicselect" name="tid" class="form-control input-lg">
							<option value="0">选择话题</option>
						</select>
					</div>
				</div>
				
				<!--写答案-->
				<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
				<div id="editordiv" style="margin-bottom: 90px;">
					<script id="editorArticle" name="content" type="text/plain" style="width:660px;height:200px;"></script>
				</div>
			</form>
			<script type="text/javascript" >
				var articleUE = UE.getEditor('editorArticle', {
			        autoClearinitialContent:true, //focus时自动清空初始化时的内容
			        wordCount:false, //关闭字数统计
			        elementPathEnabled:false,//关闭elementPath
			        saveInterval:30000,		//自动保存
			        toolbars: [
					           	['bold', 'italic','horizontal', 'paragraph', 'justifycenter', '|', 'blockquote','insertorderedlist','insertunorderedlist', 
					           	'link','removeformat', '|','simpleupload', 'insertimage', 'insertvideo', 'music', 'fullscreen' ]
					       	  ]
			    });
			</script>			
		</div>
		
		
		<!--反馈Modal-->
		<%@ include file="/jsp/feedback.jsp" %>

	</body>
</html>
