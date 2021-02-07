package com.finalPJ.carming;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindingResult;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.finalPJ.carming.model.biz.InquiryBiz;
import com.finalPJ.carming.model.dto.InquiryDto;
import com.finalPJ.carming.validate.InquiryFileValidator;;

@Controller
public class inquiryController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

@Autowired
private InquiryBiz biz;

@Autowired
private InquiryFileValidator fileValidator;

	@RequestMapping(value = "/inquirylist.do")
	public String inquirylist(Model model) {
		
		model.addAttribute("list",biz.list());
		logger.info("[inquirylist]");
		return "inquiry/inquirylist";
	}
	
	@RequestMapping(value = "/writeinquiryform.do")
	public String writeinquiry() {

		
		logger.info("[inquirylist]");
		return "inquiry/writeinquiry";
	}
	
	@RequestMapping("/writeinquiry.do")
	public String insert(InquiryDto dto, HttpServletRequest request, Model model,
			BindingResult result ) {
		
		logger.info("[INSERT RES]");
		System.out.println(dto.toString());
		fileValidator.validate(dto, result);
		if(result.hasErrors()) {
			return "inquiry/writeinquiry";
		}
		
		MultipartFile file = dto.getInquiryFile();
		String name = file.getOriginalFilename();
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/inquiry");
			
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
		
		InquiryDto inquiry = new InquiryDto();
		inquiry.setFilename(name);
		inquiry.setInquiryContent(dto.getInquiryContent());
		inquiry.setCategoryNo(dto.getCategoryNo());
		inquiry.setMemNo(dto.getMemNo());
				
		
		int res = biz.insert(inquiry);
		if(res>0) {
			return "redirect:inquirylist.do";
		}else {
			return "redirect:writeinquiryform.do";
		}
	}
	
	
	@RequestMapping(value = "/inquirydetail.do")
	public String inquirydetail(Model model, int inquiryNo) {
		logger.info("[inquiryDetail]");
		model.addAttribute("list",biz.selectOne(inquiryNo));
		return "inquiry/inquirydetail";
	}
	
	
	@RequestMapping(value = "/deleteinquiry.do")
	public String deleteInquiry(Model model, int inquiryNo, RedirectAttributes redirect) {
		logger.info("[inquiryDetail]");
		int res = biz.deleteInquiry(inquiryNo);
		if(res>0) {
			redirect.addAttribute("inquiryNo", inquiryNo);
			return "redirect:inquirylist.do";
		}else {
			return "redirect:inquirydetail.do";
		}
	}
	
}
