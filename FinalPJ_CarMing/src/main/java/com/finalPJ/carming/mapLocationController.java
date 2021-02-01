package com.finalPJ.carming;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.finalPJ.carming.common.fileUpload.FileUpload;
import com.finalPJ.carming.model.biz.mapLocationBiz;
import com.finalPJ.carming.model.dto.boardDto;
import com.finalPJ.carming.model.dto.mapLocationDto;
import com.finalPJ.carming.validate.ReportFileValidator;
import com.finalPJ.carming.validate.boardFileValidator;

@Controller
public class mapLocationController {
	private static final Logger logger = LoggerFactory.getLogger(mapLocationController.class);

	@Autowired
	private mapLocationBiz mbiz;
	
	@Autowired
	private boardFileValidator fileValidator;
	
	
	//게시글쓰기(사진) insert
	@RequestMapping(value = "/boardinsertres.do")
	public String boardInsertRes(Model model, boardDto dto, HttpServletRequest request,	//boardDto에 모두 담기
								 RedirectAttributes redirect, BindingResult result) {
		logger.info("[BOARD PHOTO INSERT RES]");
		
		
		return null;
	}
	
	
	//게시글쓰기(영상) insert
	@RequestMapping(value = "/boardinsertres_v.do")
	public String boardInsertVideoRes(Model model, mapLocationDto dto, RedirectAttributes redirect) {
		logger.info("[BOARD VIDEO INSERT RES]");
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
}
