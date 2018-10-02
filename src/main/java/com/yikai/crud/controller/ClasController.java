package com.yikai.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yikai.crud.bean.Clas;
import com.yikai.crud.bean.ComMsg;
import com.yikai.crud.service.ClasService;

@Controller
public class ClasController {
	@Autowired
	private ClasService clasService;
	
	@RequestMapping("/clases")
	@ResponseBody
	public ComMsg getClases(){
		List<Clas> list = clasService.findAll();
		return ComMsg.success().add("clases", list);
	}
}
