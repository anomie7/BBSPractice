package com.myDao.Model;

public class User {
	private String userid;
	private String username;
	private String password;
	private String email;
	private String securitynum;
	private String zipcode;
	private String address;
	private String phone;
	
	
	
	public User(String userid, String username, String password, String email, String securitynum, String zipcode,
			String address, String phone) {
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.securitynum = securitynum;
		this.zipcode = zipcode;
		this.address = address;
		this.phone = phone;
	}
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSecuritynum() {
		return securitynum;
	}
	public void setSecuritynum(String securitynum) {
		this.securitynum = securitynum;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
