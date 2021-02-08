package com.finalPJ.carming;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.finalPJ.carming.common.fileUpload.FileUpload;
import com.finalPJ.carming.common.fileUpload.FileValidator;
import com.finalPJ.carming.model.biz.PCategoryBIzImpl;
import com.finalPJ.carming.model.biz.PCategoryBiz;
import com.finalPJ.carming.model.biz.ProductBiz;
import com.finalPJ.carming.model.biz.RentReviewBiz;
import com.finalPJ.carming.model.dto.PCategoryDto;
import com.finalPJ.carming.model.dto.PageMaker;
import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;
import com.finalPJ.carming.model.dto.RentReviewDto;

@Controller
public class RentController {
   
   private static final Logger logger = LoggerFactory.getLogger(RentController.class);
   
   @Autowired
   private ProductBiz biz;
   
   @Autowired
   private RentReviewBiz rBiz;
   
   private ProductDto dto;
   
   @Autowired
   private FileValidator fileValidator;
   
   @RequestMapping(value = "/insertform.do")
   public String productInsert(Model model) {
      logger.info("[INSERT FORM]");

		return "campingrent/insertform";
	}
	@RequestMapping(value = "/productinsert.do")
	public String productinsert(HttpServletRequest request, Model model,
			FileUpload uploadFile, BindingResult result, ProductDto dto) throws IOException {
		logger.info("[PRODUCT INSERT]");
		// uploadFile : jsp 페이지에서 보내준 이미지 파일과 desc 데이터
		fileValidator.validate(uploadFile, result);
		
		// 결과 에러 시 upload로 보내기 (파일이 없을 시)
//		if(result.hasErrors()) {
//			return "insertform.do";
//		}
//		데이터가 잘 넘어왔는지 확인
		System.out.println("카테고리 번호:"+request.getParameter("pCategoryNo"));
		System.out.println("제품명:"+request.getParameter("pName"));
		System.out.println("제품가격:"+request.getParameter("pPrice"));
		System.out.println("수량:"+request.getParameter("pAmount"));
		
		MultipartFile file = uploadFile.getprFile();
		MultipartFile file2 = uploadFile.getprDesc();
		
		String name = file.getOriginalFilename();
		String name2 = file2.getOriginalFilename();
		
		
		//보낼 파일 객체 생성 후 담기
		FileUpload fileObj = new FileUpload();
		FileUpload fileObj2 = new FileUpload();
		fileObj.setName(name);
		fileObj2.setName(name2);
		
		//출력으로 확인
		System.out.println(name);
		System.out.println(name2);
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		InputStream inputStream2 = null;
		OutputStream outputStream2 = null;
		
		try {
			inputStream = file.getInputStream();
			inputStream2 = file2.getInputStream();
			// 실제 경로 삽입 ("/~~") : 그 경로 안에 생성할 폴더 이름
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
			String path2 = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage2");
			System.out.println(path);
			System.out.println(path2);
			
			dto.setpFile(name);
			dto.setpDesc(name2);
			dto.setpPath(path);
			File storage = new File(path);
			File storage2 = new File(path);
			
			// storage 폴더가 없을 경우 storage 폴더을 만들어줌
			if(!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path+"/"+name);
			
			// 경로에 맞는 파일이 없는 경우 빈 파일 생성
			if(!newFile.exists()) {
				newFile.createNewFile();
			}


         File newFile2 = new File(path2+"/"+name2);
         
         if(!newFile2.exists()) {
            newFile2.createNewFile();
         }

         // 출력 통로를 열어줌
         outputStream = new FileOutputStream(newFile);
         outputStream2 = new FileOutputStream(newFile2);
         
         int read = 0;
         // 파일 크기만한 byte 길이로 저장
         byte[] b = new byte[(int)file.getSize()];
         byte[] b2 = new byte[(int)file2.getSize()];
         
         // 파일 길이를 읽어서 read에 길이 저장 후 파일 작성(저장)
         while((read=inputStream.read(b)) != -1) {
            outputStream.write(b,0,read);
         }

         while((read=inputStream2.read(b2)) != -1) {
            outputStream2.write(b2,0,read);
         }
         
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         try {
            inputStream2.close();
            inputStream.close();
            outputStream2.close();
            outputStream.close();
         } catch (IOException e) {
            e.printStackTrace();
         }
         
      }

		
		model.addAttribute("productdto", biz.insertProduct(dto));
		
		int insertres = biz.insertProduct(dto);
		System.out.println(insertres);
		//제품 등록 성공 여부인지 alert창을 띄운다.
		if(insertres > 0) {
			return "redirect:  productlist.do";
		} else {
			return "redirect: insertform.do";
		}


   }
   
   @RequestMapping(value = "/productdetail.do")
   public String productDetail(Model model, int pNo, ProductDto dto, RentReviewDto rdto) {
      logger.info("[PRODUCT DETAIL] & [RENTREVIEW SELECTLIST]");
      
      //해당 상품관련 리뷰테이터만 전부 조회
      List<RentReviewDto> reviewlist = rBiz.selectList(pNo);
      
      //리뷰 갯수
      int cntReview = 0;
      cntReview = rBiz.countReview(pNo);
      System.out.println("리뷰 갯수: "+cntReview);

      //리뷰 갯수 객체 담아 보내기 
      model.addAttribute("countreview", cntReview);
      //제품 상세정보 객체 담아 보내기
      model.addAttribute("productdto", biz.selectOne(pNo));
      //전체 리뷰 객체에 담아 보내기
      model.addAttribute("reviewlist", reviewlist);
      System.out.println(reviewlist);
      
      return "campingrent/productdetail";
   }
   @RequestMapping(value = "/productlist.do")
   public String productlist(Model model, Pagination pag) throws Exception{
      logger.info("[PRODUCT LIST]");
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setPag(pag);
      pageMaker.setTotalCount(biz.countListTotal());
      System.out.println("이거 1"+pageMaker.getPag());
      System.out.println("이거2"+pageMaker.getTotalCount());
      System.out.println("이거3"+biz.countListTotal());
//      List<ProductDto> list = biz.selectAll(pag);
      List<ProductDto> list = biz.selectAll();

      System.out.println(list);
      
      model.addAttribute("productlist", list);
      model.addAttribute("pageMaker", pageMaker);

      
      return "campingrent/category";
   }
   
   @ResponseBody
   @RequestMapping(value = "/productdelete.do", method = RequestMethod.POST)
   public int productdelete(@RequestParam(value = "chbox[]") List<String> chArr, ProductDto dto) throws Exception {
      logger.info("[PRODUCT DELETE]");
      
      
      int result = 0;
      int pNo = 0;
      
      for(String i : chArr) {
         pNo = Integer.parseInt(i);
         dto.setpNo(pNo);
         biz.deleteProduct(dto);
      }
      result = 1;
      
      return result;
   }
}