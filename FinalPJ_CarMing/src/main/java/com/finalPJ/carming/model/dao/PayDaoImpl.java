package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.PayDto;

@Repository
public class PayDaoImpl implements PayDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PayDto> selectPay() {
		List<PayDto> payList = new ArrayList<PayDto>();
		
		try {
			payList = sqlSession.selectList(NAMESPACE+"selectpay");
		} catch (Exception e) {
			System.out.println("[ERROR: SELECT PAY]");
			e.printStackTrace();
		}
		return payList;
	}

	@Override
	public void insertPay(PayDto pDto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insertpay", pDto);
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("[ERROR: INSERT PAY]");
			e.printStackTrace();
		}
	}

	@Override
	public int selectPaySeq() {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"pay_currval");
			System.out.println("res:"+res);
			
		} catch (Exception e) {
			System.out.println("[ERROR: PAY SEQ]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public PayDto selectOnePay(PayDto pDto) {
		try {
			pDto = sqlSession.selectOne(NAMESPACE+"selectonepay", pDto);
		} catch (Exception e) {
			System.out.println("[ERROR: SELECTONE PAY]");
			e.printStackTrace();
		}
		return pDto;
	}
	
}
