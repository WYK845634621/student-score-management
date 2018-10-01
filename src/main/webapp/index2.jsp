<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<!-- 引入jQuery -->
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap -->
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

		<div class="container">
		<!-- 标题 -->
		<div class="row"><div class="col-md-12"><h1 style="text-align: center;">come here hey we girl</h1></div></div>	<br>
		
		<!-- 两个按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<form action="index.jsp">
				<button class="btn btn-primary" >查询所有</button></form>
				<button class="btn btn-primary" id="stu_add_modl_btn">添加</button>
				<button class="btn btn-danger" id="stu_del_all_btn">删除</button>
			</div>
		</div>
		
		<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="stus_table">
					<thead>
					<tr><th><input type="checkbox" id="check_all"></input></th>
					<th>grade</th>
					<th>majorName</th>
					<th>clas</th>
					<th>studentId</th>
					<th>studentName</th>
					<th>gender</th>
					<th>email</th>
					<th>操作</th></tr>
					</thead>
					<tbody>
						
					</tbody>
					
				</table>
			</div>
		</div>
		
		<!-- 分页 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>


</body>
</html>