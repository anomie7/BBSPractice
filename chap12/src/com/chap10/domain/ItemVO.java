package com.chap10.domain;

public class ItemVO {
	private int orderid;
	private int mynum;
	private long prodId;
	private String pname;
	private int quantity;
	private int price;

	
	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getMynum() {
		return mynum;
	}

	public void setMynum(int mynum) {
		this.mynum = mynum;
	}

	public long getProdId() {
		return prodId;
	}

	public void setProdId(long prodId) {
		this.prodId = prodId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ItemVO [mynum=" + mynum + ", prodId=" + prodId + ", pname=" + pname + ", quantity=" + quantity
				+ ", price=" + price + "]";
	}

}
