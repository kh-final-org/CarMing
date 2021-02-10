package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.PayDto;

public interface CartDao {
	String NAMESPACE = "cart.";
	public List<CartListDto> cartList();
	public List<CartListDto> orderList();
	public void insertCart(CartDto cart);
	public void deleteCart(CartDto cart);
	public List<CartListDto> rentperiod(List<CartListDto> cartList);
	public int countProduct(int payNo);
	public String pName(PayDto pDto);
	public void updateCart(int cartNo);
}
