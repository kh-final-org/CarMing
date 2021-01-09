package com.finalPJ.carming;

import java.io.IOException;



import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.finalPJ.carming.model.biz.RecipeBiz;
import com.finalPJ.carming.model.dto.RecipeDto;

@Controller
public class campingRecipeController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

@Autowired
private RecipeBiz biz;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/recipeCrawling.do")
	public String recipeCrawling(ArrayList<RecipeDto> list,Model model) {
		logger.info("[tipAndRecipeMain]");
		
		String url = "https://www.10000recipe.com/recipe/list.html?q=%EC%BA%A0%ED%95%91%EC%9A%94%EB%A6%AC";
		Document doc = null;
		Elements tmp = null;
		int recipeNo = 0;
		String title = null;
		String recipeURL = null;
		String file = null;
		String writer = null;
		String writerURL = null;
		String views = null;
		
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Elements element = doc.select("ul.rcp_m_list2");
		tmp = element.select("li.common_sp_list_li");
		for(int i = 0; i<tmp.size(); i++) {
			recipeNo = i;
			title = tmp.select("div.common_sp_caption_tit").get(i).text();
			recipeURL = tmp.select(".common_sp_link").get(i).attr("href");
			file = tmp.select(".common_sp_link > img").get(i).attr("src");
			writer = tmp.select("div.common_sp_caption_rv_name").get(i).text();
			writerURL = tmp.select("div.common_sp_caption_rv_name > a").get(i).attr("href");
			views = tmp.select("span.common_sp_caption_buyer").get(i).text();
			list.add(new RecipeDto(recipeNo, file,title, writer, writerURL, views, recipeURL));
			
		}
		
		model.addAttribute("list",list);
		return "tipAndRecipe/main";
//		int res = biz.insert(list);
//				
//		if(res > 0) { 
//			System.out.println(list.toString());
//			System.out.println(list.size());
//			
//			model.addAttribute("list",list);
//			return "tipAndRecipe/main"; 
//		}else{ 
//			return "tipAndRecipe/infodetail"; }
	
	}
	
//	@RequestMapping(value = "/hit.do")
//	public String recipedetail(@RequestParam String url) {
//		
//		
//		System.out.println(url);
//		logger.info("[detail]");
//		
//		return "redirect: https://www.10000recipe.com/"+url;
//	}
	
	@RequestMapping(value = "/infodetail.do")
	public String infodetail() {


		logger.info("[detail]");
		return "tipAndRecipe/infodetail";
	}
	
	@RequestMapping(value = "/recipeWriteForm.do")
	public String recipewriteform() {


		logger.info("[recipe write form]");
		return "tipAndRecipe/recipewrite";
	}
	
	@RequestMapping(value = "/infowriteform.do")
	public String infowriteform() {


		logger.info("[recipe write form]");
		return "tipAndRecipe/infowrite";
	}
	
	
	
	
	
}
