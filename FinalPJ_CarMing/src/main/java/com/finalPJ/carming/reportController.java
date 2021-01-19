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
import org.springframework.web.util.WebUtils;

import com.finalPJ.carming.model.biz.ReportBiz;
import com.finalPJ.carming.model.dto.InquiryDto;
import com.finalPJ.carming.model.dto.ReportDto;
import com.finalPJ.carming.validate.ReportFileValidator;

@Controller
public class reportController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
@Autowired
private ReportBiz biz;

@Autowired
private ReportFileValidator fileValidator;

	@RequestMapping(value = "/reportlist.do")
	public String reportlist(Model model) {

		model.addAttribute("list", biz.list());
		logger.info("[reportlist]");
		return "report/reportlist";
	}
	
	@RequestMapping(value = "/writereportform.do")
	public String writeReportForm() {
		logger.info("[writereport]");
		return "report/writereport";
	}
	
	@RequestMapping("/writereport.do")
	public String insert(ReportDto dto, HttpServletRequest request, Model model,
			BindingResult result ) {
		
		logger.info("[INSERT RES]");
		System.out.println(dto.toString());
		fileValidator.validate(dto, result);
		if(result.hasErrors()) {
			return "inquiry/writeinquiry";
		}
		
		MultipartFile file = dto.getReportFile();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		ReportDto report = new ReportDto();
		report.setReportFileName(name);
		report.setReportContent(dto.getReportContent());
		report.setCategoryNo(dto.getCategoryNo());
		report.setTargetNo(dto.getTargetNo());
		report.setTargetTypeNo(dto.getTargetNo());

				
		
		int res = biz.insert(report);
		if(res>0) {
			return "redirect:reportlist.do";
		}else {
			return "redirect:writereportform.do";
		}
	}
	
	
	@RequestMapping(value = "/reportdetail.do")
	public String reportDetail(Model model, int reportNo) {
		

		logger.info("[reportDetail]");
		model.addAttribute("list",biz.selectOne(reportNo));
		return "report/reportdetail";
	}
	
	
}
