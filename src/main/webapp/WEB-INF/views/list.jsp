<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有学生列表</title>
<%  pageContext.setAttribute("PATH",request.getContextPath()); %>
<!-- 引入jQuery -->
<script type="text/javascript" src="${PATH }/static/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap -->
<link href="${PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<br>
	<div class="container">
		<!-- 标题 -->
		<div class="row"><div class="col-md-12"><h1 style="text-align: center;">come here hey we girl</h1></div></div>	<br>
		
		<!-- 两个按钮 -->
		<div class="row">
			<div class="col-md-2 col-md-offset-9">
				<button class="btn btn-primary">添加</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		
		<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr><th>#</th>
					<th>grade</th>
					<th>majorName</th>
					<th>clas</th>
					<th>studentId</th>
					<th>studentName</th>
					<th>gender</th>
					<th>email</th>
					<th>操作</th></tr>
					
					<c:forEach items="${pageInfo.list }" var="stu">
					<tr>
						<td>${stu.studentId }</td>
						<td>${stu.grade }</td>
						<td>${stu.major.majorName }</td>
						<td>${stu.clas }</td>
						<td>${stu.studentId }</td>
						<td>${stu.studentName }</td>
						<td>${stu.gender =="M"?"男":"女" }</td>
						<td>${stu.email }</td>
						<td>
						<button class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
						<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!-- 分页 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6">当前第${pageInfo.pageNum }页,总共${pageInfo.pages }页,存在${pageInfo.total }条记录</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
				<li><a href="${PATH }/stus?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="${PATH }/stus?pn=${pageInfo.pageNum - 1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${pageInfo.pageNum == page_Num }">
						<li class="active"><a href="#">${page_Num }</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum != page_Num }">
						<li><a href="${PATH }/stus?pn=${page_Num }">${page_Num }</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
					<li><a href="${PATH }/stus?pn=${pageInfo.pageNum + 1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
				<li><a href="${PATH }/stus?pn=${pageInfo.pages}">尾页</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

</body>
</html>