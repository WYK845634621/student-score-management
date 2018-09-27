package com.yikai.crud.test;

import java.util.UUID;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yikai.crud.bean.Major;
import com.yikai.crud.bean.Student;
import com.yikai.crud.dao.MajorMapper;
import com.yikai.crud.dao.StudentMapper;


/*
 * spring项目  就可以用speing的单元测试 可以自动注入需要用到的组件:1、pom导包 2.注解
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	
	@Autowired
	MajorMapper majorMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void test(){
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		for(int i =0 ; i < 200; i++){
			String uuid = UUID.randomUUID().toString().substring(0, 6);
			mapper.insertSelective(new Student(1502010222 + i, uuid, "F", "82684511@qq.com", "大一", 2, "15020403"));
		}
		System.out.println("批量执行完毕");
		
	}
}
