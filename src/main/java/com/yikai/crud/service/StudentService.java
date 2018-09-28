package com.yikai.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.crud.bean.Student;
import com.yikai.crud.dao.StudentMapper;

@Service
public class StudentService {
	
	@Autowired
	StudentMapper studentMapper;

//	查询所有
	public List<Student> getAll() {
		
		return studentMapper.selectByExampleWithMajor(null);
	}

	public void saveStu(Student student) {
		studentMapper.insertSelective(student);
	}
	
	
	

}
