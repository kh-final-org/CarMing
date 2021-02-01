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

@Controller
public class mapLocationController {
	private static final Logger logger = LoggerFactory.getLogger(mapLocationController.class);

	@Autowired
	private mapLocationBiz mbiz;
	
	@Autowired
	private ReportFileValidator fileValidator;
	
	
	//게시글쓰기(사진) insert
	@RequestMapping(value = "/boardinsertres.do")
	public String boardInsertRes(Model model, mapLocationDto dto, HttpServletRequest request,
								 RedirectAttributes redirect, BindingResult result) {
		logger.info("[BOARD PHOTO INSERT RES]");
		fileValidator.validate(dto, result);
/*
		String name = file.getOriginalFilename();
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/report");
			
			System.out.println("업로드 될 실제 경로: "+path);
			
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path + "/" + name);
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			
			int read = 0;
			byte[] b = new byte[(int)file.getSize()];
			
			while((read=inputStream.read(b)) !=-1) {
				outputStream.write(b,0,read);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		 
		int res = mbiz.insert(dto);
		  if(res>0){
			  redirect.addAttribute("brdno", dto.getBrdno());
			  return "redirect:boardinsertform.do";
		  }else {
			  redirect.addAttribute("brdno", dto.getBrdno());
			  return "redirect:boardinsertform.do";
		  }*/
		return null;
	}
	
	
	//게시글쓰기(영상) insert
	@RequestMapping(value = "/boardinsertres_v.do")
	public String boardInsertVideoRes(Model model, mapLocationDto dto, RedirectAttributes redirect) {
		logger.info("[BOARD VIDEO INSERT RES]");
		
		
		int res = mbiz.insert(dto);
		  if(res>0){
			  redirect.addAttribute("brdno", dto.getBrdno());
			  return "redirect:boardinsertform_v.do";
		  }else {
			  redirect.addAttribute("brdno", dto.getBrdno());
			  return "redirect:boardinsertform_v.do";
		  }
		
	}
	
	
	
	
	
	
	
	
	
	
}
