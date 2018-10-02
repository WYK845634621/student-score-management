package com.yikai.crud.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.crud.bean.Subject;
import com.yikai.crud.dao.SubjectMapper;

@Service
public class SubjectService {

	@Autowired
	private SubjectMapper subjectMapper;
	
	public Subject getSub(Integer id){
		return subjectMapper.selectByPrimaryKey(id);
	}
	
	public void updateSub(Subject subject){
		subjectMapper.updateByPrimaryKeySelective(subject);
	}
	
	public void saveSub(Subject subject){
		System.out.println("需要保存的sub"+subject);
		subjectMapper.insertSelective(subject);
	}
}
