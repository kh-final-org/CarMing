package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.AdmMemberDto;
import com.finalPJ.carming.model.dto.AdmRentDto;
import com.finalPJ.carming.model.dto.ProductDto;


public interface adminDao {
	
	String NAMESPACE = "admin.";
	
	public AdmMemberDto selectOne(int memNo);
	public int insert(AdmMemberDto dto);
	public int delete(int memNo);
	public int deleteRep(int memNo);
	public int deleteList(int memNo);
	public AdmRentDto selectOneRent(int cartNo);
	public int returnRent(int cartNo);
	public int sendRent(int cartNo);
	public int deleteRent(int cartNo);
	
	/* 검색, 페이징을 포함한 member select */
	public List<AdmMemberDto> getMemList(String search, int page);
	public int getMemCount(String search);


	/* 검색, 페이징을 포함한 rent select */
	public List<AdmRentDto> RentList(String search, int page);
	public int rentListCnt(String search);
	
	/* 검색, 페이징을 포함한 product select */
	public List<ProductDto> ProductList(String search, int page);
	public int ProductCnt(String search);
	
//	delete product 
	public int deleteProduct(int pNo);
	
	
}
