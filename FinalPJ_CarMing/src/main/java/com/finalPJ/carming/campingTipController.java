package com.finalPJ.carming;

import java.io.IOException;




import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.TipBiz;
import com.finalPJ.carming.model.dto.TipDto;

@Controller
public class campingTipController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

@Autowired
private TipBiz biz;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/TipCrawling.do")
	public String tipCrawling(ArrayList<TipDto> list, Model model) {
		String url = "https://www.5gcamp.com/?c=info/camptip&m=bbs&bid=moviecamping&uid=1010";
		Document doc = null;
		Elements tmp = null;
		Elements count = null;
		int tipNo = 0;
		String title = null;
		String tipURL = null;
		String file = null;
		int views = 0;
				
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Elements element = doc.select("div.tse-content");
		count = element.select("div > div.contbottom");
	for(int i = 0; i<count.size()-1; i++) {
			tmp = element.select("div.listwrap");
			title = tmp.select("div.subject > a").get(i).text();
			tipURL = tmp.select("div.subject > a").get(i).attr("href");
			file = tmp.select("div.photo > a > img").get(i).attr("src"); 
			views = Integer.parseInt(tmp.select("div.shc > span").get(i).text());
			list.add(new TipDto(title, tipURL, file, views));

	}

	model.addAttribute("list", list);
	return "tipAndRecipe/TipMain";
	
//	int res = biz.insert(list);
//
//	if (res > 0) {
//		System.out.println(list.toString());
//		System.out.println(list.size());
//
//		model.addAttribute("list", list);
//		return "tipAndRecipe/TipMain";
//	} else {
//		return "tipAndRecipe/infodetail";
//	}

}
	
	@RequestMapping(value = "/hit.do")
	public String recipedetail() {
		
		
		
		logger.info("[detail]");
		
		return "tipAndRecipe/TipMain";
		
//		return "redirect: https://www.10000recipe.com/"+url;
	}
	
	
	
	
	
	
}
