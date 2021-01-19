package com.finalPJ.carming.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.finalPJ.carming.model.dto.InquiryDto;

@Service
public class InquiryFileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		InquiryDto file = (InquiryDto)target;
		System.out.println(file.getPath());
		if(file.getInquiryFile().getSize() == 0) {
			errors.rejectValue("inquiryFile", "fileNPE", "Please select a file");
			
			
		}
		
	}

}
