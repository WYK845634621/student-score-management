package com.yikai.crud.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yikai.crud.bean.ComMsg;
import com.yikai.crud.bean.Student;
import com.yikai.crud.bean.Subject;
import com.yikai.crud.service.StudentService;
import com.yikai.crud.service.SubjectService;

@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	@Autowired
	SubjectService subjectService;
	
//	单个多个二合一删除
	@ResponseBody
	@RequestMapping(value="/stu/{ids}",method=RequestMethod.DELETE)
	public ComMsg deleteStu(@PathVariable("ids") String ids){
		if (ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			studentService.deleteBatch(del_ids);
		}else {
			Integer id = Integer.parseInt(ids);
			studentService.deleteStu(id);
		}
		return ComMsg.success();
	}
	
//	不能随便用Ajax发送PUT请求		Tomcat一看是PUT请求便不会进行封装对象
	@ResponseBody
	@RequestMapping(value="/stu/{studentId}",method=RequestMethod.PUT)
	public ComMsg saveStu(Student student){
		System.out.println("更新的信息:" + student);
		studentService.updateStu(student);
		return ComMsg.success();
	}
	
	
	@RequestMapping(value="/getStu/{id}",method=RequestMethod.GET)
	@ResponseBody
	public ComMsg getStu(@PathVariable("id") Integer id){
		Student student = studentService.getStu(id);
		
		return ComMsg.success().add("stu", student);
	}
	
	
//	进行JSR303校验  先导入hiberate-validate包
	@ResponseBody
	@RequestMapping("/checkName")
	public ComMsg checkName(@RequestParam("stuName") String stuName){
//		先对合法性进行校验  然后针对重复性就行校验
		String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,4})$";
		if (!stuName.matches(regex)) {
			return ComMsg.fail().add("validate_msg", "学生姓名必须是6-16位或者2-4中文");
		}
		boolean b = studentService.checkName(stuName);
		if (b) {
			return ComMsg.success();
		}else {
			
			return ComMsg.fail().add("validate_msg", "此姓名不可用");
		}
	}
	
	
	@RequestMapping(value="/stu",method=RequestMethod.POST)
	@ResponseBody
	public ComMsg saveStu(@Valid Student student,BindingResult result){
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段: " + fieldError.getField());
				System.out.println("错误的信息: " + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return ComMsg.fail().add("errorFields", map);
		}else {
			studentService.saveStu(student);
			System.out.println("需要保存的学生"+student);
			List<Student> list = studentService.getSelective(student);
			Student newStudent = list.get(0);
			subjectService.saveSub(new Subject(newStudent.getStudentId(), 0, 0, 0, 0, 0, 0));
			return ComMsg.success();
		}
	}
	
	@ResponseBody
	@RequestMapping("/stus")
	public ComMsg getStusWithJason(@RequestParam(value="pn", defaultValue="1") Integer pn){
//		使用分页插件进行设置  每页大小  起始页
		PageHelper.startPage(pn, 12);
		List<Student> stus = studentService.getAll();
		//用PageInfo对结果进行包装
		PageInfo page = new PageInfo(stus,5);
		return ComMsg.success().add("pageInfo", page);
	}
	
//	有选择性的查询
	@ResponseBody
	@RequestMapping(value = "/stuSelect")
	public ComMsg getStuWithJason(@RequestParam(value="pn", defaultValue="1") Integer pn,Student student){
//		使用分页插件进行设置  每页大小  起始页
		PageHelper.startPage(pn, 12);
		List<Student> stus = studentService.getSelective(student);
		for (Student studen : stus) {
			System.out.println(studen);
		}
		//用PageInfo对结果进行包装
		PageInfo page = new PageInfo(stus,5);
		return ComMsg.success().add("pageInfo", page);
	}


	
	
	
}
