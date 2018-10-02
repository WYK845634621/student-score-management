package com.yikai.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.crud.bean.Student;
import com.yikai.crud.bean.StudentExample;
import com.yikai.crud.bean.StudentExample.Criteria;
import com.yikai.crud.dao.StudentMapper;

@Service
public class StudentService {
	
	@Autowired
	StudentMapper studentMapper;
	
//	有选择性的查询
	public List<Student> getSelective(Student student){
		System.out.println(student);
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andGradeEqualTo(student.getGrade());
		criteria.andMIdEqualTo(student.getmId());
		criteria.andClasEqualTo(student.getClas());
		if (student.getStudentId()!= null) {
			criteria.andStudentIdEqualTo(student.getStudentId());
		}
		List<Student> list = studentMapper.selectByExampleWithMajor(example);
		return list;
	}
	

//	查询所有
	public List<Student> getAll() {
		return studentMapper.selectByExampleWithMajor(null);
	}

	public void saveStu(Student student) {
		studentMapper.insertSelective(student);
	}

//	检验用户名是否可用	返回true代表可用
	public Boolean checkName(String stuName) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentNameEqualTo(stuName);
		long count = studentMapper.countByExample(example);
		return count==0;
	}

	public Student getStu(Integer id) {
		Student student = studentMapper.selectByPrimaryKey(id);
		return student;
		
	}

	public void updateStu(Student student) {
		studentMapper.updateByPrimaryKeySelective(student);
		
	}

	public void deleteStu(Integer id) {
		studentMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> ids) {
		StudentExample studentExample = new StudentExample();
		Criteria criteria = studentExample.createCriteria();
		criteria.andStudentIdIn(ids);
		studentMapper.deleteByExample(studentExample);
	}
	
	
	

}
