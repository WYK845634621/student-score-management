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

	<!-- <button id="find">查询</button> -->
	
	<!-- 修改的模态框 -->
	<div class="modal fade" id="stuUpdateModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">学生信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">studentName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="stu_update_static">email@example.com</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">男</label> 
								<label class="radio-inline"> <input type="radio" name="gender" id="gender2_update_input" value="F">女</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="update_email_input" placeholder="邮箱">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">grade</label>
							<div class="col-sm-10">
								<input type="text" name="grade" class="form-control" id="update_grade_input" placeholder="年级">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">clas</label>
							<div class="col-sm-10">
								<input type="text" name="clas" class="form-control" id="update_clas_input" placeholder="班级">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">majorName</label>
							<div class="col-sm-3">
								<select class="form-control" name="mId" id="major_update_select"></select>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="stuAddModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加学生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">studentName</label>
							<div class="col-sm-10">
								<input type="text" name="studentName" class="form-control" id="stu_name_input" placeholder="学生姓名">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男</label> 
								<label class="radio-inline"> <input type="radio" name="gender" id="gender2_add_input" value="F">女</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="stu_email_input" placeholder="邮箱">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">grade</label>
							<div class="col-sm-10">
								<input type="text" name="grade" class="form-control" id="stu_grade_input" placeholder="年级">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">clas</label>
							<div class="col-sm-10">
								<input type="text" name="clas" class="form-control" id="stu_clas_input" placeholder="班级">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">majorName</label>
							<div class="col-sm-3">
								<select class="form-control" name="mId" id="major_add_select"></select>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<!-- 标题 -->
		<div class="row"><div class="col-md-12"><h1 style="text-align: center;">come here hey we girl</h1></div></div>	<br>
		
		<!-- 两个按钮 -->
		<div class="row">
			<div class="col-md-8">
			<form class="form-inline" id="select_form">
			  <div class="form-group">
			    <label>年级</label>
			    <select class="form-control" name="grade" id="grade_select">
			    </select>
			  </div>
			  <div class="form-group">
			    <label>专业</label>
			    <select class="form-control" name="mId" id="major_select"></select>
			  </div>
			  <div class="form-group">
			    <label>班级</label>
			    <select class="form-control" name="clas" id="clas_select"></select>
			  </div>
			  <div class="form-group">
			    <label>学号</label>
			    <input type="text" class="form-control" name="studentId">
			  </div>
			</form>
			</div>
			<div class="col-md-4">
			  <button class="btn btn-warning" id="select">查询</button>
				<button class="btn btn btn-success" id="find">查询所有</button>
				<button class="btn btn-primary" id="stu_add_modl_btn">添加</button>
				<button class="btn btn-danger" id="stu_del_all_btn">批量删除</button>
			</div>
			<!-- <div class="col-md-4 col-md-offset-8">
			</div> -->
		</div>
		<br>
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
	
	<script type="text/javascript">
	var totalRecord, currentPage;
	
		//获取三个下拉列表信息
		$(function () {
			getMajor("#major_select");
			getGrade("#grade_select");
			getClas("#clas_select");
		});	
		
		$("#select").click(function () {
			$.ajax({
				url:"${PATH}/stuSelect",
				data:$("#select_form").serialize(),
				type:"GET",
				success:function(result){
					build_stus_table(result);
					build_page_info(result);
					build_page_nav(result);
					
				}
				
			});
		}); 
	
		//发送Ajax请求，要到分页数据
		 $("#find").click(function () {
			$.ajax({
				url:"${PATH}/stus",
				data:"pn=1",
				type:"GET",
				success:function(result){
					build_stus_table(result);
					build_page_info(result);
					build_page_nav(result);
					
				}
				
			});
		}); 
		 /* $(function () {
			 to_page(1);
		});  */
		
		function to_page(pn) {
			$.ajax({
				url:"${PATH}/stus",
				data:"pn=" + pn,
				type:"GET",
				success:function(result){
					build_stus_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
				
			});
		}
		
		//构建表格信息函数
		function build_stus_table(result) {
			$("#stus_table tbody").empty();
			var stus = result.extend.pageInfo.list;
			$.each(stus,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var studentIdTd = $("<td></td>").append(item.studentId);
				var studentNameTd = $("<td></td>").append(item.studentName);
				var genderTd = $("<td></td>").append(item.gender == 'M'?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var gradeTd = $("<td></td>").append(item.grade);
				var clasTd = $("<td></td>").append(item.clas);
				var majorNameTd = $("<td></td>").append(item.major.majorName);
				/*<button class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
						<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
				*/
				var editBtn = $("<button></button>").addClass("btn btn-info btn-xs edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				editBtn.attr("edit_id",item.studentId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs del_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				delBtn.attr("del_id",item.studentId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkBoxTd).append(gradeTd).append(majorNameTd).append(clasTd).append(studentIdTd).append(studentNameTd).append(genderTd).append(emailTd).append(btnTd).appendTo("#stus_table tbody");
			});
		}
		//构建分页信息函数
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum +"页,共"+result.extend.pageInfo.pages+"页,存在"+result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//构建分页导航
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function () {
					to_page(1);
				});
				prePageLi.click(function () {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			} 
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else {
				
				lastPageLi.click(function () {
					to_page(result.extend.pageInfo.pages);
				});
				nextPageLi.click(function () {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				}
			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);
			//遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function () {
					to_page(item);
				});
				
				ul.append(numLi);
			});
			//添加下一页和尾页
			ul.append(nextPageLi).append(lastPageLi);
			//把ul加入nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		//清空表单内容及样式
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增弹出模态框	表单重置来清空表单数据内容 因为reset只有dom对象才可以使用	发送Ajax请求获取major信息
		$("#stu_add_modl_btn").click(function () {
			reset_form("#stuAddModel form");
			getMajor("#stuAddModel select");
			$("#stuAddModel").modal({
				backdrop:"static"
			});
		});
		
		//查出所有专业信息并显示下拉列表
		function getMajor(ele) {
			$(ele).empty();
			$.ajax({
				url:"${PATH}/majors",
				type:"GET",
				success:function(result){
					//{"code":100,"msg":"处理成功","extend":{"majors":[{"majorId":1,"majorName":"软件工程"},{"majorId":2,"majorName":"机械自动化"},{"majorId":3,"majorName":"理学院"},{"majorId":4,"majorName":"仪器与电子"},{"majorId":5,"majorName":"经济管理"},{"majorId":6,"majorName":"国际学院"},{"majorId":7,"majorName":"材料科学与功能工程"}]}}
					$.each(result.extend.majors,function(){
						var optionEle = $("<option></option>").append(this.majorName).attr("value",this.majorId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		function getGrade(ele) {
			$(ele).empty();
			$.ajax({
				url:"${PATH}/grades",
				type:"GET",
				success:function(result){
					$.each(result.extend.grades,function(){
						var optionEle = $("<option></option>").append(this.grade).attr("value",this.grade);
						optionEle.appendTo(ele);
					});
				}
			});
		} 
		function getClas(ele) {
			$(ele).empty();
			$.ajax({
				url:"${PATH}/clases",
				type:"GET",
				success:function(result){
					$.each(result.extend.clases,function(){
						var optionEle = $("<option></option>").append(this.clas).attr("value",this.clas);
						optionEle.appendTo(ele);
					});
				}
			});
		} 
		
		
		//校验方法		
		function validate_add_form() {
			var stuName = $("#stu_name_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,4})$/;
			if (!regName.test(stuName)) {
				show_validate_msg("#stu_name_input","error","姓名可以是2-4个汉字或者6-16英文数字组合");
				return false;
			}else {
				show_validate_msg("#stu_name_input","success","");
			};
			
			var email = $("#stu_email_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#stu_email_input","error","邮箱格式不正确");
				return false;
			}else {
				show_validate_msg("#stu_email_input","success","");
			}
			
			
			return true;
		}
		
		//封装的校验方法	前端校验是很容易被一些懂的人轻易躲过的 比方直接在网页查看元素把class内容改成success
		function show_validate_msg(ele,status,msg) {
			//清除校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		$("#stu_name_input").change(function() {
			var stuName = this.value;
			$.ajax({
				url:"${PATH}/checkName",
				data:"stuName="+stuName,
				type:"POST",
				success:function(result){
					if (result.code==100) {
						show_validate_msg("#stu_name_input","success","名字可以进行使用");
						$("#stu_save_btn").attr("ajax-validate","success");
					}else {
						$("#stu_save_btn").attr("ajax-validate","error");
						show_validate_msg("#stu_name_input","error",result.extend.validate_msg);
					}
				}
			});
		});
		
		//点击新增按钮处理事件	先校验 然后提交
		$("#stu_save_btn").click(function () {
			/* if (!validate_add_form()) {
				return false;
			} */
			if ($(this).attr("ajax-validate") == "error") {
				return false;
			}
			console.log($("#stuAddModel form").serialize());
			$.ajax({
				url:"${PATH}/stu",
				type:"POST",
				data:$("#stuAddModel form").serialize(),
				success:function(result){
					if (result.code==100) {
						//学生保存成功以后  关闭模态框并且跳到最后一页
						$("#stuAddModel").modal('hide');
						to_page(totalRecord);
					}else {
						if (undefined != result.extend.errorFields.email) {
							show_validate_msg("#stu_email_input","error",result.extend.errorFields.email);
						}
						if (undefined != result.extend.errorFields.studentName) {
							show_validate_msg("#stu_name_input","error",result.extend.errorFields.studentName);			
						}
					}
				}
			});
		});
		
		
		//点击编辑弹出模态框	然后把id传给更新按钮
		$(document).on("click",".edit_btn",function(){
			getMajor("#stuUpdateModel select");
			getStu($(this).attr("edit_id"));
			$("#stu_update_btn").attr("edit_id",$(this).attr("edit_id"));
			$("#stuUpdateModel").modal({
				backdrop:"static"
			});
		});
		
		//表单回显
		function getStu(id) {
			$.ajax({
				url:"${PATH}/getStu/"+id,
				type:"GET",
				success:function(result){
					var stuData = result.extend.stu;
					$("#stu_update_static").text(stuData.studentName);
					$("#stuUpdateModel input[name=gender]").val([stuData.gender]);
					$("#update_email_input").val(stuData.email);
					$("#update_grade_input").val(stuData.grade);
					$("#update_clas_input").val(stuData.clas);
					$("#stuUpdateModel select").val([stuData.mId]);
				}
			});
		}
		
		//校验	然后更新
		$("#stu_update_btn").click(function () {
			 var email = $("#update_email_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#update_email_input","error","邮箱格式不正确");
				return false;
			}else {
				show_validate_msg("#update_email_input","success","");
			} 
			$.ajax({
				url:"${PATH}/stu/"+$(this).attr("edit_id"),
				type:"PUT",
				data:$("#stuUpdateModel form").serialize(),
				success:function(result){
					//$("#stuUpdateModel").modal('hide');
					//alert(result.msg);
					$("#stuUpdateModel").modal('hide');
					to_page(currentPage); 
				}
			});
		});
		
		
		//单个删除		
		$(document).on("click",".del_btn",function(){
			var studentName = $(this).parents("tr").find("td:eq(5)").text();
			var studentId = $(this).attr("del_id");
			if (confirm("确认删除【" + studentName +"】同学的信息吗？")) {
				$.ajax({
					url:"${PATH}/stu/"+studentId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
					
				});
			}
		});
		
		
		//完成全选和全不选
		$("#check_all").click(function () {
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//每一个分别选中后   总的也自动选中
		$(document).on("click",".check_item",function(){
			//alert($(".check_item:checked").length);
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
			
		
		$("#stu_del_all_btn").click(function () {
			var stuNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				stuNames += $(this).parents("tr").find("td:eq(5)").text()+ ",";
				del_idstr +=  $(this).parents("tr").find("td:eq(4)").text()+ "-";
			});
			stuNames = stuNames.substring(0,stuNames.length-1);
			del_idstr = del_idstr.substring(0,del_idstr.length-1);
			if (confirm("确认删除【" + stuNames +"】同学的信息吗？")) {
				$.ajax({
					url:"${PATH}/stu/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
					
				});
			}
		});
	
	</script>

</body>
</html>