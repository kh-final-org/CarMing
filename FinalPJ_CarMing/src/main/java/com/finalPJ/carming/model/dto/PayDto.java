package com.finalPJ.carming.model.dto;

import java.util.Date;

public class PayDto {
	private int payNo;
	private int cartNo;
	private String method;
	private String addr;
	private int totalPrice;
	private Date payDay;
	
	public PayDto() {
		super();
	}

	public PayDto(int payNo, int cartNo, String method, String addr, int totalPrice, Date payDay) {
		super();
		this.payNo = payNo;
		this.cartNo = cartNo;
		this.method = method;
		this.totalPrice = totalPrice;
		this.addr = addr;
		this.payDay = payDay;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getPayDay() {
		return payDay;
	}

	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
}
