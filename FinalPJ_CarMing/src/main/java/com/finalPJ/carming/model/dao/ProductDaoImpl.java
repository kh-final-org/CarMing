package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	@Override
//	public List<ProductDto> selectAll() {
//		List<ProductDto> productList = new ArrayList<ProductDto>();
//		
//		try {
//			productList = sqlSession.selectList(NAMESPACE+"selectAll");
//		} catch (Exception e) {
//			System.out.println("[ERROR: PRODUCT LIST]");
//			e.printStackTrace();
//		}
//		return productList;
//	}
	
	@Override
	public ProductDto selectOne(int pNo) {
		ProductDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", pNo);
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT DETAIL]");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertProduct(ProductDto dto) {
		int insertRes = 0;
		
		try {
			insertRes = sqlSession.insert(NAMESPACE+"insertProduct", dto);
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT INSERT]");
			e.printStackTrace();
		}
		
		return insertRes;
	}

	@Override
	public void deleteProduct(ProductDto dto) {
		try {
			sqlSession.delete(NAMESPACE+"deleteProduct", dto);
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT DELETE]");
			e.printStackTrace();
		}
	}

	@Override
	public int countListTotal() {
		int ctn = 0;
		
		try {
			ctn = sqlSession.selectOne(NAMESPACE+"countListTotal");
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT LIST COUNTTOTAL]");
			e.printStackTrace();
		}
		return ctn;
	}

	@Override
	public void changeAmount(CartListDto cDto) {
		try {
			sqlSession.update(NAMESPACE+"changeAmount", cDto);
		} catch (Exception e) {
			System.out.println("[ERROR: CHANGE STOCK]");
			e.printStackTrace();
		}
	}

	@Override

	public int returnProduct(int cartNo) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"return", cartNo);
		} catch (Exception e) {
			System.out.println("[error]: returnProduct");
			e.printStackTrace();
		}
		return res;
		}

	public List<ProductDto> selectAll(String search, int page) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		//검색어, 페이지 데이터를 Map에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("page", Integer.toBinaryString(page));
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectAll", map);
		} catch (Exception e) {
			System.out.println("[ERROR: SELECT PRODUCTLIST]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getProductCnt(String search) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectProductCnt", search);
		} catch (Exception e) {
			System.out.println("[ERROR: SELECT PRODUCTCNT]");
			e.printStackTrace();
		}
		return res;
	}
	
}
