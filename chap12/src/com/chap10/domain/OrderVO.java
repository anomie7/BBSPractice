package com.chap10.domain;

public class OrderVO {
	private int orderId;
	private String orderDate;
	private String wname;
	private String pay;
	private String addr;
	private String tel;
	private int prodCount;
	private int total;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getProdCount() {
		return prodCount;
	}

	public void setProdCount(int prodCount) {
		this.prodCount = prodCount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", orderDate=" + orderDate + ", wname=" + wname + ", pay=" + pay
				+ ", addr=" + addr + ", tel=" + tel + ", prodCount=" + prodCount + ", total=" + total 
				+ "]";
	}

}
