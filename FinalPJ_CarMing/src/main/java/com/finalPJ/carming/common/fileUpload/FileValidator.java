package com.finalPJ.carming.common.fileUpload;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Service
public class FileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// validator 사용가능 여부 확인
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		FileUpload file = (FileUpload)target;
		
		if(file.getprFile().getSize() == 0) {
			//파일 사이즈가 0일 때, 즉 파일이 없을 때 에러 메시지 추가
			errors.rejectValue("pFile", "fileNPE", "파일을 선택해주세요.");
		}
//		if(file.getpFile2().getSize() == 0) {
//			//파일 사이즈가 0일 때, 즉 파일이 없을 때 에러 메시지 추가
//			errors.rejectValue("pFile", "fileNPE", "파일을 선택해주세요.");
//		}
//		if(file.getpFile3().getSize() == 0) {
//			//파일 사이즈가 0일 때, 즉 파일이 없을 때 에러 메시지 추가
//			errors.rejectValue("pFile", "fileNPE", "파일을 선택해주세요.");
//		}
//		if(file.getpDesc().getSize() == 0) {
//			//파일 사이즈가 0일 때, 즉 파일이 없을 때 에러 메시지 추가
//			errors.rejectValue("pFile", "fileNPE", "파일을 선택해주세요.");
//		}
	}

}
