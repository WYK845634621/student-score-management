package com.yikai.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.crud.bean.Major;
import com.yikai.crud.dao.MajorMapper;

@Service
public class MajorService {

	@Autowired
	private MajorMapper majorMapper;
	
	public List<Major> getMajors(){
		return majorMapper.selectByExample(null);
	}
}
