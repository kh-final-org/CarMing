package com.finalPJ.carming;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.bcommentBiz;
import com.finalPJ.carming.model.biz.boardBiz;
import com.finalPJ.carming.model.dto.boardDto;

@Controller
public class boardController {
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Autowired
	private boardBiz biz;
	
	@Autowired
	private bcommentBiz cbiz;
	
	//캠핑토크 메인 화면
	@RequestMapping(value = "/boardmainform.do")
	public String boardMain (Model model, String memnick) {
		
		logger.info("[BOARD SELECT LIST]");
		model.addAttribute("list", biz.selectList());
		
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
	public String boardInsertRes(Model model, boardDto dto) {
		logger.info("[BOARD INSERT RES]");
		

		
		int res = biz.insert(dto);
		if(res>0) {
			return "redirect:boardmainform.do";
		}else {
			return "redirect:writereportform.do";
		}
	}
	
	
	//게시글쓰기(영상) 올리기 페이지로 이동
	@RequestMapping(value = "/boardinsertform_v.do")
	public String boardWriteVideo() {
		logger.info("[BOARD VIDEO INSERT FORM]");
		
		return "board/boardinsert_v";
	}
	
//	//게시글쓰기(영상) insert
//	@RequestMapping(value = "/boardinsertres_v.do")
//	public String boardInsertVideoRes() {
//		logger.info("[BOARD VIDEO INSERT RES]");
//		
//		return null;
//	}

//	//게시글 수정 
//	@RequestMapping(value ="/boardupdateform.do")
//	public String boardUpdate() {
//		
//		return "";
//	}
	
	//게시글 삭제
	@RequestMapping(value = "/boarddelete.do")
	public String delete(int brdno) {
		logger.info("[BOARD DELETE]");
		
		int res = biz.delete(brdno);
		if(res>0) {
			return "redirect:boardmainform.do";
		}else {
			return "redirect:boardinsertform_v.do";
		}
	}

	//게시글 상세 페이지로 이동
	@RequestMapping(value = "/boarddetailform.do")
	public String boardDetail(Model model, int brdno) {
		logger.info("[BOARD SELECT ONE / DETAIL]");
		model.addAttribute("dto", biz.selectOne(brdno));
		model.addAttribute("comment",cbiz.selectList(brdno));
		
		return "board/boarddetail";
	}

	//프로필 페이지
	@RequestMapping(value = "/profileform.do")
	public String profilePage(Model model, int memno) {
		logger.info("[PROFILE PAGE]");
		model.addAttribute("list", biz.userBoardList(memno));
	   
		return "board/profilepage";
	}
	
	//dm 페이지로 이동
	@RequestMapping(value = "/privateform.do")
	public String privateChat() {
		logger.info("[PRIVATE CHAT]");
		
		return "board/privatechat";
	}
	

	
	
	
	
	
	
	
}
