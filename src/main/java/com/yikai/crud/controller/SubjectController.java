package com.yikai.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yikai.crud.bean.ComMsg;
import com.yikai.crud.bean.Student;
import com.yikai.crud.bean.Subject;
import com.yikai.crud.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	private SubjectService service;
	
//	不能随便用Ajax发送PUT请求		Tomcat一看是PUT请求便不会进行封装对象
	@ResponseBody
	@RequestMapping(value="/sub/{sId}",method=RequestMethod.PUT)
	public ComMsg saveSub(Subject subject){
		System.out.println("更新的信息:" + subject);
		service.updateSub(subject);
		return ComMsg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/getSub/{id}",method=RequestMethod.GET)
	public ComMsg getSub(@PathVariable("id") Integer id){
		Subject subject = service.getSub(id);
		System.out.println("获取的课程"+subject);
		return ComMsg.success().add("sub", subject);
	}
}
