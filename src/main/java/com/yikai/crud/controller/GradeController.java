package com.yikai.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yikai.crud.bean.ComMsg;
import com.yikai.crud.bean.Grade;
import com.yikai.crud.service.GradeService;

@Controller
public class GradeController {
	
	@Autowired
	private GradeService gradeService;
	
	@RequestMapping("/grades")
	@ResponseBody
	public ComMsg getGrades(){
		List<Grade> grades = gradeService.findAll();
		return ComMsg.success().add("grades", grades);
	}

}
