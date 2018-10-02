package com.yikai.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.crud.bean.Clas;
import com.yikai.crud.dao.ClasMapper;

@Service
public class ClasService {
	@Autowired
	private ClasMapper clasMapper;
	
	public List<Clas> findAll(){
		return clasMapper.selectByExample(null);
	}
}
