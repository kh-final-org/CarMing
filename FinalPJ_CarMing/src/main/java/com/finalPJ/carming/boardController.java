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
	public String boardMain(Model model) {
	   logger.info("[SELECT LIST]");
	   model.addAttribute("list", biz.selectList());
	   
	   return "board/boardmain";
	}
	
	//게시글쓰기 페이지로 이동
	@RequestMapping(value = "/boardinsertform.do")
	public String boardWrite1(boardDto dto) {
	   logger.info("[INSERT FORM]");
	   
	   return "board/boardinsert";
	}
	

	//게시글 작성 완료 시
	@RequestMapping(value = "/boardinsertres.do")
	public String boardInsertRes() {
		logger.info("[boardinser_res]");
		
	//	int res = biz.insert(dto);
	//  if(res>0){
	//	   return "redirect:list.do";
	//  }
	  return null;
    }

	//게시글 상세 페이지로 이동
	@RequestMapping(value = "/boarddetailform.do")
	public String boardDetail(Model model, int brdno) {
		logger.info("[SELECT ONE]");
		model.addAttribute("dto", biz.selectOne(brdno));
		model.addAttribute("comment",cbiz.selectList(brdno));
		return "board/boarddetail";
		
	}

	@RequestMapping(value = "/profileform.do")
	public String profilePage() {
		logger.info("[profilepage]");
		
		return "board/profilepage";
	}
	
	
	@RequestMapping(value = "/privateform.do")
	public String privateChat() {
		logger.info("[privatechat]");
		
		return "board/privatechat";
	}
	
	
	
	
	
}
