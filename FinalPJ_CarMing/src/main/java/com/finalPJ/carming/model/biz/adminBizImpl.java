package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.adminDao;
import com.finalPJ.carming.model.dto.AdmMemberDto;
import com.finalPJ.carming.model.dto.AdmRentDto;
import com.finalPJ.carming.model.dto.ProductDto;


@Service
public class adminBizImpl implements adminBiz{
	
	@Autowired
	private adminDao dao;

	@Transactional
	@Override
	public int delete(int memNo) {
		dao.delete(memNo);
		return dao.deleteRep(memNo);
	}

	@Override
	public List<AdmRentDto> RentList() {
		return RentList("",1);
	}
	
	@Override
	public List<AdmRentDto> RentList(int page) {
		return RentList("",page);
	}

	@Override
	public List<AdmRentDto> RentList(String search, int page) {
		return dao.RentList(search, page);
	}

	@Override
	public int rentListCnt() {
		return dao.rentListCnt("");
	}

	@Override
	public int rentListCnt(String search) {
		return dao.rentListCnt(search);
	}
	
	@Override
	public AdmRentDto selectOneRent(int cartNo) {
		return dao.selectOneRent(cartNo);
	}

	@Override
	public int returnRent(int cartNo) {
		return dao.returnRent(cartNo);
	}
	
	/* 페이징 처리를 위한 select member list */
	@Override
	public List<AdmMemberDto> getMemList() { 
		return getMemList("", 1);
	}

	@Override
	public List<AdmMemberDto> getMemList(int page) {
		return getMemList("", page);
	}

	@Override
	public List<AdmMemberDto> getMemList(String search, int page) {
		return dao.getMemList(search, page);
	}
	
	/* 현재 페이지 구하기 위함 */
	@Override
	public int getMemCount() {
		return dao.getMemCount(""); 
	}

	@Override
	public int getMemCount(String search) {
		return dao.getMemCount(search);
	}

	@Override
	public int deleteRent(int cartNo) {
		// TODO Auto-generated method stub
		return dao.deleteRent(cartNo);
	}

	@Override
	public int sendRent(int cartNo) {
		// TODO Auto-generated method stub
		return dao.sendRent(cartNo);
	}

	@Override
	public List<ProductDto> ProductList() {
		return ProductList("",1);
	}

	@Override
	public List<ProductDto> ProducutList(int page) {
		return ProductList("",page);
	}

	@Override
	public List<ProductDto> ProductList(String search, int page) {
		return dao.ProductList(search, page);
	}

	@Override
	public int ProductCnt() {
		return dao.ProductCnt("");
	}

	@Override
	public int ProductCnt(String search) {
		return dao.ProductCnt(search);
	}

	@Override
	public int deleteProduct(int pNo) {
		return dao.deleteProduct(pNo);
	}


}
