package com.myDao.Model;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.Collection;

import org.junit.Test;


public class UserDaoTest {
	final static User TEST_USER = new User("test", "test", "test", "test", "test", "test", "test", "test");
	
	
	@Test
	public void findByUserId(){
		UserDao userdao = new UserDao();
		  try {
			assertTrue(userdao.findByUserId(TEST_USER.getUserid(), TEST_USER.getPassword()));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@Test(expected=SQLException.class)
	public void insertUser() {
		UserDao userdao = new UserDao();
		userdao.insertUser(TEST_USER);
	}
	
	@Test
	public void UpdateUser() {
		UserDao userdao = new UserDao();
		userdao.updateUser(new User("test", "test1", "test1", "test1", "test1", "test1", "test1", "test1"));
	}
	
	@Test
	public void DeleteUser() {
		UserDao userdao = new UserDao();
		System.out.println(userdao.deleteUser(TEST_USER.getUserid()));
	}
	
	@Test
	public void SelectAll() {
		UserDao userdao = new UserDao();
		Collection<User> list = userdao.selectAllUser();
		
		for(User i : list) {
			System.out.println(i.getUserid() + " " + i.getUsername() + " " + i.getZipcode());
		}
	}
}
