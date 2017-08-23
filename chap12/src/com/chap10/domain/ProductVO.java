package com.chap10.domain;

public class ProductVO {
	private long id;
	private String category;
	private String wname;
	private String pname;
	private String sname;
	private int price;
	private int downprice;
	private String inputdate;
	private int stock;
	private String description;
	private String small;
	private String large;
	private int quantity;

	// 생성자(모든 필드를 포함)
	public ProductVO(long id, String category, String wname, String pname, String sname, int price, int downprice,
			String inputdate, int stock, String description, String small, String large) {
		super();
		this.id = id;
		this.category = category;
		this.wname = wname;
		this.pname = pname;
		this.sname = sname;
		this.price = price;
		this.downprice = downprice;
		this.inputdate = inputdate;
		this.stock = stock;
		this.description = description;
		this.small = small;
		this.large = large;
	}

	// 리스트 출력용 생성자 id, category, pname, sname, downprice, inputdate, stock
	public ProductVO(long id, String category, String pname, String sname, int downprice, String inputdate, int stock) {
		super();
		this.id = id;
		this.category = category;
		this.pname = pname;
		this.sname = sname;
		this.downprice = downprice;
		this.inputdate = inputdate;
		this.stock = stock;
	}

	// 상품 상세 보기용 생성자(large, small, wname, pname, id, description, sname, price, downprice
	public ProductVO(long id, String wname, String pname, String sname, int price, int downprice, String description,
			String small, String large) {
		super();
		this.id = id;
		this.wname = wname;
		this.pname = pname;
		this.sname = sname;
		this.price = price;
		this.downprice = downprice;
		this.description = description;
		this.small = small;
		this.large = large;
	}
	
	//장바구니용 생성자
	public ProductVO(long id, String category, String pname, String sname, int downprice, String inputdate, int stock, int quantity) {
		super();
		this.id = id;
		this.category = category;
		this.pname = pname;
		this.sname = sname;
		this.downprice = downprice;
		this.inputdate = inputdate;
		this.stock = stock;
		this.quantity = quantity;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDownprice() {
		return downprice;
	}

	public void setDownprice(int downprice) {
		this.downprice = downprice;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSmall() {
		return small;
	}

	public void setSmall(String small) {
		this.small = small;
	}

	public String getLarge() {
		return large;
	}

	public void setLarge(String large) {
		this.large = large;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", category=" + category + ", wname=" + wname + ", pname=" + pname + ", sname="
				+ sname + ", price=" + price + ", downprice=" + downprice + ", inputdate=" + inputdate + ", stock="
				+ stock + ", description=" + description + ", small=" + small + ", large=" + large + "]," + "quantity=" + quantity;
	}
}
