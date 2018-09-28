package com.yikai.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yikai.crud.bean.Student;
import com.yikai.crud.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@ResponseBody
	@RequestMapping("/stus")
	public ComMsg getStusWithJason(@RequestParam(value="pn", defaultValue="1") Integer pn){
//		使用分页插件进行设置  每页大小  起始页
		PageHelper.startPage(pn, 12);
		List<Student> stus = studentService.getAll();
		//用PageInfo对结果进行包装
		PageInfo page = new PageInfo(stus,7);
		return ComMsg.success().add("pageInfo", page);
	}
	

//	@RequestMapping("/stus")
	public String getStus(@RequestParam(value="pn", defaultValue="1") Integer pn, Model model){
//		使用分页插件进行设置  每页大小  起始页
		PageHelper.startPage(pn, 12);
		List<Student> stus = studentService.getAll();
		//用PageInfo对结果进行包装
		PageInfo page = new PageInfo(stus,7);
		model.addAttribute("pageInfo", page);
		return "list";
	}
	
	
	
}
