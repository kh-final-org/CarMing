package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;

public interface CartDao {
	String NAMESPACE = "cart.";
	public List<CartListDto> cartList();
	public void insertCart(CartDto cart);
	public void deleteCart(CartDto cart);
}
