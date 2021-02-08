package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;

@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CartListDto> cartList() {
		List<CartListDto> cartList = new ArrayList<CartListDto>();
		
		try {
			cartList = sqlSession.selectList(NAMESPACE+"cartlist");
		} catch (Exception e) {
			System.out.println("[ERROR: CART LIST]");
			e.printStackTrace();
		}
		
		return cartList;
	}

	@Override
	public void insertCart(CartDto cart) {
		try {
			sqlSession.insert(NAMESPACE+"insertcart", cart);
		} catch (Exception e) {
			System.out.println("[ERROR: INSERT CART]");
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCart(CartDto cart) {
		try {
			sqlSession.delete(NAMESPACE+"deletecart", cart);
		} catch (Exception e) {
			System.out.println("[ERROR: DELETE CART]");
			e.printStackTrace();
		}
	}

	@Override
	public List<CartListDto> rentperiod(List<CartListDto> cartList) {
		List<CartListDto> list = new ArrayList<CartListDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"rentperiod", cartList);
		} catch (Exception e) {
			System.out.println("[ERROR: RENT PERIOD]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countProduct(int payNo) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"countproduct", payNo);
		} catch (Exception e) {
			System.out.println("[ERROR: COUNT PRODUCT]");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public String pName(int payNo) {
		String res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE+"pname", payNo);
		} catch (Exception e) {
			System.out.println("[ERROR: SELECT PNAME]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public void updateCart(int cartNo) {
		try {
			sqlSession.update(NAMESPACE+"changestate", cartNo);
		} catch (Exception e) {
			System.out.println("[ERROR: UPDATE STATENO]");
			e.printStackTrace();
		}
	}

	@Override
	public List<CartListDto> orderList() {
		List<CartListDto> orderList = new ArrayList<CartListDto>();
		
		try {
			orderList = sqlSession.selectList(NAMESPACE+"orderlist");
		} catch (Exception e) {
			System.out.println("[ERROR: ORDER LIST]");
			e.printStackTrace();
		}
		return orderList;
	}
	
	
}
