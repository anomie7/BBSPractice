package com.chap10.dao;

import java.util.List;

import com.chap10.vo.Person;

public interface PersonDAO {
	List selectAll();
	Person selectById(int id);
	int insert(Person person);
	void update(Person person);
	void delete(int id);
}
