package com.yikai.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.crud.bean.Grade;
import com.yikai.crud.dao.GradeMapper;

@Service
public class GradeService {
	
	@Autowired
	private GradeMapper gradeMapper;
	
	public List<Grade> findAll(){
		return gradeMapper.selectByExample(null);
	}
}
