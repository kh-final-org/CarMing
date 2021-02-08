package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;

public interface CartBiz {
	public List<CartListDto> cartList();
	public List<CartListDto> orderList();
	public void insertCart(CartDto cart);
	public void deleteCart(CartDto cart);
	public List<CartListDto> rentperiod(List<CartListDto> cartList);
	public int countProduct(int payNo);
	public String pName(int payNo);
	public void updateCart(int cartNo);
}
