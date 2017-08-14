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
		testfb = new FreeBoard(5, "password", "minu@ddd", "테스트", "테스트", "2011", "테스트", 0, 0, 0, 0);
	}
	
	@Test
	public void selectAll() throws Exception {
		List<FreeBoard> list = session.selectList("selectAll");
		for (FreeBoard freeBoard : list) {
			logger.debug(freeBoard.getId() + " " + freeBoard.getSubject());
		}
	}
	
	@Test
	public void selectById() throws Exception {
		FreeBoard fb = session.selectOne("selectById", testfb.getId());
		logger.debug(fb.getId() + " " + fb.getSubject() + " " + fb.getReadcount());
	}
	
	@Test
	public void updateReadCount() throws Exception {
		session.update("FreeBoardMapper.updateReadCount", testfb);
		session.commit();
	}
	
	@Test
	public void update() throws Exception {
		session.update("FreeBoardMapper.update", testfb);
		session.commit();
	}
	
	@Test
	public void insert() throws Exception {
		int n = session.insert("FreeBoardMapper.insert", testfb);
		logger.debug(n + "");
		session.commit();
	}
	
	@Test
	public void delete() throws Exception {
		int n = session.delete("FreeBoardMapper.deletef", 5);
		logger.debug(n + "");
		session.commit();
	}
}
