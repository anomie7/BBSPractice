package com.myDao.Model;

public class Zipcode {
	String zipcode;
	String address;
	
	public Zipcode(String zipcode, String address) {
		this.zipcode = zipcode;
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
