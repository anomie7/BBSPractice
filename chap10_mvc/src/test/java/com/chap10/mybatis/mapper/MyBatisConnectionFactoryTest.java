package com.chap10.mybatis.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.chap10.vo.Person;

public class MyBatisConnectionFactoryTest {
	SqlSession session;
	private static final Logger logger = LoggerFactory.getLogger(MyBatisConnectionFactoryTest.class);
	
	@Before
	public void getSqlSessionFactory() {
		MyBatisConnectionFactory mbcf = new MyBatisConnectionFactory();
		session = mbcf.getSessionFactory().openSession(true); 
	}
	
	@Test
	public void selectAll() throws Exception {
		List<Person> list = session.selectList("selectAll");
		for (Person o : list) {
			logger.debug(o.toString());
		}
	}
	
	@Test
	public void selectById() throws Exception {
//		Person p1 = new Person(1, "민우");
		Person person = session.selectOne("selectById", 1);
		logger.debug(person.toString());
	}
	
	@Test
	public void update() throws Exception {
		Person person = new Person(1, "삼촌");
		session.update("update",person);
		logger.debug(session.selectOne("selectById", 1).toString());
	}
	
	@Test
	public void insert() throws Exception {
		Person person = new Person(0, "김민우");
		session.insert("insert", person);
	}
}
