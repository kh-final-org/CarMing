package com.finalPJ.carming.validate;

import javax.print.DocFlavor.READER;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.finalPJ.carming.model.dto.InquiryDto;
import com.finalPJ.carming.model.dto.ReportDto;

@Service
public class ReportFileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ReportDto file = (ReportDto)target;
		System.out.println(file.getPath());
		if(file.getReportFile().getSize() == 0) {
			errors.rejectValue("reportFile", "fileNPE", "Please select a file");
			
			
		}
		
	}

}
