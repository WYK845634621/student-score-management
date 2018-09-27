package com.yikai.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.yikai.crud.bean.Student;


//使用spring测试模块提供的测试请求模拟controller跳转
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MvcPageTest {

//	传入springmvc的ioc
	@Autowired
	WebApplicationContext context;
	
	MockMvc mockMvc;
	@Before
	public void initMockMvc(){
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	
	
	
	
	@Test
	public void testPage() throws Exception{
//		模拟请求
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/stus").param("pn", "1")).andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码: " + pageInfo.getPageNum());
		System.out.println("总页码: " + pageInfo.getPages());
		System.out.println("总记录数: " + pageInfo.getTotal());
		System.out.println("需要连续显示的页码: ");
		int[] nums = pageInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(i + " - ");
		}
		List<Student> list = pageInfo.getList();
		for (Student student : list) {
			System.out.println("名字： " + student.getStudentName() + "  学号： " + student.getStudentId());
		}
		
	}
}
