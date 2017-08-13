package com.chap10.mybatis.mapper;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyBatisConnectionFactory {
	
	private static SqlSessionFactory sqlSessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(MyBatisConnectionFactory.class);
	
	 public MyBatisConnectionFactory() {
		try {
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				logger.debug("sqlSessionFactory 인스턴스화 성공!");
			}
		}catch(FileNotFoundException e) {
			logger.debug(e.getMessage());
		}catch(IOException e) {
			logger.debug(e.getMessage());
		}
	}
	
	public SqlSessionFactory getSessionFactory() {
		logger.debug("sqlSessionFactory를 불러옵니다.");
		return sqlSessionFactory;
	}
}
