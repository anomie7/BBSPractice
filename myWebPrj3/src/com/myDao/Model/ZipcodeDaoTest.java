package com.myDao.Model;

import static org.junit.Assert.*;

import java.util.Collection;

import org.junit.Test;

public class ZipcodeDaoTest {

	@Test
	public void SelectZipcode() {
		ZipcodeDao zipcodeDao = new ZipcodeDao();
		Collection<Zipcode> list = zipcodeDao.selectZipcode("만촌3동");
		
		for(Zipcode i : list) {
			System.out.println(i.getZipcode() + " " + i.getAddress());
		}
		
	}

}
