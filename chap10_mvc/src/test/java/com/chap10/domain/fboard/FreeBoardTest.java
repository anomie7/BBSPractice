package com.chap10.domain.fboard;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FreeBoardTest {
	SqlSession session;
	FreeBoard testfb;
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardTest.class);
	@Before
	public void setUp() throws IOException {
		String resource = "fboard-mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		session = sqlSessionFactory.openSession();
		testfb = new FreeBoard(5, "password", "minu@dbs8481", "응", "테스트", null, "테스트", 0, 0, 5, 0);
	}
	
	@Test
	public void selectAll() throws Exception {
		List<FreeBoard> list = session.selectList("selectAll");
		for (FreeBoard freeBoard : list) {
			logger.debug(freeBoard.getSubject());
		}
	}
	
	@Test
	public void selectById() throws Exception {
		FreeBoard fb = session.selectOne("selectById", testfb.getId());
		logger.debug(fb.getId() + " " + fb.getSubject() + " " + fb.getReadcount());
	}
	
	@Test
	public void updateReadCount() throws Exception {
		session.update("updateReadCount", testfb);
	}
	
	@Test
	public void update() throws Exception {
		session.update("update", testfb);
	}
	
	@Test
	public void insert() throws Exception {
		FreeBoard upfb = new FreeBoard(100, "test", "test@test", "test", "test", "1011", "test", 0, 0, 0, 0);
		session.insert("insert", upfb);
	}
}
