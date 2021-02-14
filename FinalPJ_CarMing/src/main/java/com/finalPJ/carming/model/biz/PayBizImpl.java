package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.PayDao;
import com.finalPJ.carming.model.dto.PayDto;

@Service
public class PayBizImpl implements PayBiz{

	@Autowired
	private PayDao pdao;
	
	@Override
	public List<PayDto> selectPay() {
		return pdao.selectPay();
	}

	@Override
	public void insertPay(PayDto pDto) {
		pdao.insertPay(pDto);
	}

	@Override
	public int selectPaySeq() {
		return pdao.selectPaySeq();
	}

	@Override
	public PayDto selectOnePay(PayDto pDto) {
		return pdao.selectOnePay(pDto);
	}

	@Override
	public List<PayDto> selectPay(String search, int page) {
		return pdao.selectPay(search, page);
	}

	@Override
	public int getPayCnt(String search) {
		return pdao.getPayCnt(search);
	}

}
