package com.finalPJ.carming.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.finalPJ.carming.model.dto.boardDto;

@Service
public class boardFileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		boardDto file = (boardDto)target;
//		if(file.getBrdfile().getSize() == 0) {
//			errors.rejectValue("reportFile", "fileNPE", "Please select a file");
//			
//			
//		}
		
	}

}
