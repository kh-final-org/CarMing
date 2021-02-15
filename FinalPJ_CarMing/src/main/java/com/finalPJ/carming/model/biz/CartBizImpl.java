package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.CartDao;
import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.PayDto;

@Service
public class CartBizImpl implements CartBiz{

	@Autowired
	private CartDao dao;
	@Override
	public List<CartListDto> cartList(){
		return dao.cartList();
	}

	@Override
	public void insertCart(CartDto cart) {
		dao.insertCart(cart);
	}

	@Override
	public void deleteCart(CartDto cart) {
		dao.deleteCart(cart);
	}

	@Override
	public List<CartListDto> rentperiod(List<CartListDto> cartList) {
		return dao.rentperiod(cartList);
	}

	@Override
	public int countProduct(int payNo) {
		return dao.countProduct(payNo);
	}

	@Override
	public String pName(PayDto pDto) {
		return dao.pName(pDto);
	}

	@Override
	public void updateCart(int cartNo) {
		dao.updateCart(cartNo);
	}

	@Override
	public List<CartListDto> orderList() {
		return dao.orderList();
	}

	@Override
	public List<CartListDto> orderList(String search, int page) {
		return dao.orderList(search, page);
	}

	@Override
	public int getOrderCnt(String search) {
		return dao.getOrderCnt(search);
	}

}
