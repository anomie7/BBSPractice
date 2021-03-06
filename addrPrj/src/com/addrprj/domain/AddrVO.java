package com.addrprj.domain;

public class AddrVO {
	private int id;
	private String name;
	private String email;
	private String comdept;
	private String birth;
	private String tel;
	private String memo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComdept() {
		return comdept;
	}

	public void setComdept(String comdept) {
		this.comdept = comdept;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "AddrVO [id=" + id + ", name=" + name + ", email=" + email + ", comdept=" + comdept + ", birth=" + birth
				+ ", tel=" + tel + ", memo=" + memo + "]";
	}

}
