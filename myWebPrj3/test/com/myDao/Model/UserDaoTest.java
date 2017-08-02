package com.myDao.Model;

import static org.junit.Assert.*;

import org.junit.Test;

import com.sun.xml.internal.ws.policy.spi.AssertionCreationException;

public class UserDaoTest {

	@Test
	public void findByUserId(){
		User user = new User("test", "test", "test", "test", "test", "test", "test", "test");
		UserDao userdao = new UserDao();
		  try {
			assertTrue(userdao.findByUserId(user.getUserid(), user.getPassword()));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
