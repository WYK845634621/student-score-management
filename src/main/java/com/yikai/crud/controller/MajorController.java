package com.yikai.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yikai.crud.bean.ComMsg;
import com.yikai.crud.bean.Major;
import com.yikai.crud.service.MajorService;

@Controller
public class MajorController {
	
	@Autowired
	private MajorService majorService;
	
	@RequestMapping("/majors")
	@ResponseBody
	public ComMsg getCommunitys(){
		List<Major> list =  majorService.getMajors();
		return ComMsg.success().add("majors", list);
	}
}
