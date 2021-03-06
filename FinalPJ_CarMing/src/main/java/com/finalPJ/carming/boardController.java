 package com.finalPJ.carming;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.finalPJ.carming.model.biz.bcommentBiz;
import com.finalPJ.carming.model.biz.boardBiz;
import com.finalPJ.carming.model.dto.bcommentDto;
import com.finalPJ.carming.model.dto.boardDto;
import com.finalPJ.carming.validate.boardFileValidator;

@Controller
public class boardController {
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Autowired
	private boardBiz biz;
	@Autowired
	private bcommentBiz cbiz;
	@Autowired
	private boardFileValidator FileValidator;
	
	
	//캠핑토크 메인 화면
	@RequestMapping(value = "/boardmainform.do")
	public String boardMain (Model model, 
							@RequestParam(value="search", required=false, defaultValue="")String search, 
							@RequestParam(value="page", required=false, defaultValue="1")int page, 
							@RequestParam(value="categoryNo", required=false, defaultValue="")String categoryNo) {
		System.out.println(categoryNo);
		System.out.println(search);
		
		/*
		 * String searchDefault = ""; if(search != null && !search.equals("")) {
		 * searchDefault = search; }
		 * 
		 * int pageDefault = 1; if(page != null && !page.equals("")) { pageDefault =
		 * Integer.parseInt(page); }
		 * 
		 * String categoryNoDefault = ""; if(categoryNo != null &&
		 * !categoryNo.equals("")) { categoryNoDefault = categoryNo; }
		 */
		
		
		
		logger.info("[BOARD SELECT LIST]");
		model.addAttribute("list", biz.selectList(search, page, categoryNo));
		System.out.println(model.toString());
		model.addAttribute("count", biz.listCnt(search,categoryNo));

	   return "board/boardmain";
	}
	
	//게시글쓰기(사진) 페이지로 이동
	@RequestMapping(value = "/boardinsertform.do")
	public String boardInsert(boardDto dto) {
	   logger.info("[BOARD INSERT FORM]");
	   
	   return "board/boardinsert";
	}
	
	//게시글쓰기(사진) insert
	@RequestMapping(value = "/boardinsertres.do")
	public String boardInsertRes(Model model, boardDto dto, HttpServletRequest request, BindingResult result ) {
		logger.info("[BOARD INSERT RES]");
		FileValidator.validate(dto, result);
		if(result.hasErrors()) {
			return "board/boardinsert";
		}
		
		MultipartFile file = dto.getBrdfile();
		String name = file.getOriginalFilename();
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/board");
		
			System.out.println("업로드 될 실제 경로: "+ path);
			
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path +"/"+name);
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			
			int read = 0;
			byte[] b = new byte[(int)file.getSize()];
			
			while((read=inputStream.read(b)) != -1) {
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
		
		dto.setBrdfilename(name);
		System.out.println(dto.toString());
		int res = biz.insert(dto);
		if(res>0) {
			return "redirect:boardmainform.do";
		}else {
			return "redirect:boardinsertform.do";
		}
	}
	
	//게시글쓰기(영상) 올리기 페이지로 이동
	@RequestMapping(value = "/boardinsertform_v.do")
	public String boardWriteVideo() {
		logger.info("[BOARD VIDEO INSERT FORM]");
		
		return "board/boardinsert_v";
	}
	
	//게시글쓰기(영상) insert
		@RequestMapping(value = "/boardinsertres_v.do")
		public String boardInsertRes_v(Model model, boardDto dto, HttpServletRequest request, BindingResult result ) {
			logger.info("[BOARD INSERT VIDEO RES]");
			System.out.println(dto.toString());
			FileValidator.validate(dto, result);
			if(result.hasErrors()) {
				return "board/boardinsert_v";
			}
			
			MultipartFile file = dto.getBrdfile();
			MultipartFile vfile = dto.getBrdvideo();
			String name = file.getOriginalFilename();
			String vname = vfile.getOriginalFilename();
			
			InputStream inputStream = null;
			InputStream inputStream2 = null;
			OutputStream outputStream = null;
			OutputStream outputStream2 = null;
			
			try {
				inputStream = file.getInputStream();
				inputStream2 = vfile.getInputStream();
				
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/board");
			
				System.out.println("업로드 될 실제 경로: "+ path);
				
				File storage = new File(path);
				if(!storage.exists()) {
					storage.mkdir();
				}
				
				File newFile = new File(path +"/"+name);
				if(!newFile.exists()) {
					newFile.createNewFile();
				}
				
				File newFile2 = new File(path +"/"+vname);
				if(!newFile2.exists()) {
					newFile2.createNewFile();
				}
				
				outputStream = new FileOutputStream(newFile);
				outputStream2 = new FileOutputStream(newFile2);
				
				int read = 0;
				byte[] b = new byte[(int)file.getSize()];
				
				while((read=inputStream.read(b)) != -1) {
					outputStream.write(b,0,read);
				}
			
				int read2 = 0;
				byte[] b2 = new byte[(int)vfile.getSize()];
				
				while((read2=inputStream2.read(b2)) != -1) {
					outputStream2.write(b2,0,read2);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					inputStream.close();
					outputStream.close();
					inputStream2.close();
					outputStream2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			dto.setBrdfilename(name);	//썸네일 사진
			dto.setBrdvideoname(vname);	//동영상
			
			int res = biz.insert_v(dto);
			if(res>0) {
				return "redirect:boardmainform.do";
			}else {
				return "redirect:boardmainform..do";
			}
		}
	
	//게시글 수정 
	@RequestMapping(value ="/boardupdateform.do")
	public String boardUpdate() {
		
		return "";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/boarddelete.do")
	public String delete(int brdno) {
		logger.info("[BOARD DELETE]");
		
		int res = biz.delete(brdno);
		if(res>0) {
			return "redirect:boardmainform.do";
		}else {
			return "redirect:boardmainform.do";
		}
	}

	//게시글 (사진) 상세 페이지로 이동
	@RequestMapping(value = "/boarddetailform.do")
	public String boardDetail(Model model, int brdno, bcommentDto dto ) {
		logger.info("[BOARD SELECT ONE / DETAIL]");
		
		model.addAttribute("dto", biz.selectOne(brdno));
		model.addAttribute("comment",cbiz.selectList(brdno));
		logger.info(model.toString());
		System.out.println(model.toString());
		
		
		return "board/boarddetail";
	}
	
	//게시글(영상) 상세 페이지로 이동
		@RequestMapping(value = "/boarddetailform_v.do")
		public String boardDetail_v(Model model, int brdno, bcommentDto dto ) {
			logger.info("[BOARD SELECT ONE_VIDEO / DETAIL]");
			
			model.addAttribute("dto", biz.selectOne(brdno));
			model.addAttribute("comment",cbiz.selectList(brdno));
			logger.info(model.toString());
			System.out.println(model.toString());
			
			return "board/boarddetail_v";
		}

	//프로필 페이지
	@RequestMapping(value = "/profileform.do")
	public String profilePage(Model model, int memno) {
		logger.info("[PROFILE PAGE]");
		model.addAttribute("mem",biz.profilemem(memno));
		model.addAttribute("list", biz.userBoardList(memno));
		System.out.println(model.toString());
		return "board/profilepage";
	}
	
	//dm 페이지로 이동
	@RequestMapping(value = "/privateform.do")
	public String privateChat() {
		logger.info("[PRIVATE CHAT]");
		
		return "board/privatechat";
	}
	
	
	//게시글(사진) 수정하기
	   @RequestMapping(value ="/boardupdateRes.do")
	   @ResponseBody
	   public Map<String, Boolean> boardUpdateRes(@RequestBody boardDto dto) {
	      logger.info("[UPDATE RES]");
	      boolean check = false;
	      int res = biz.update(dto);
	      
	      if(res>0) {
	    	  check = true;
	    	  Map<String, Boolean> map = new HashMap<String,Boolean>();
	    	  map.put("check", check);
	    	  System.out.println(map);
	    	  return map;
	      }
	      else {
	    	  check = false;
	    	  Map<String, Boolean> map = new HashMap<String,Boolean>();
	    	  map.put("check", check);
	    	  System.out.println(map);
	    	  return map;
	      }
	      
	   }
	
	
	
}
