package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.scrap.dao.ScrapDao;
import com.hanger.scrap.vo.ScrapVo;

@Controller
public class MainReviewController extends BaseController {
	//
	private ScrapDao scrapDao ;
	
	public void setScrapDao(ScrapDao scrapDao) {
		this.scrapDao = scrapDao;
	}

	@RequestMapping("/mainReview.hang")
	public String MainReview(HttpServletRequest req) {
		
		String postingCode = (String)req.getParameter("postingCode");
	
		HashMap map = new HashMap();
		map.put("postingCode", postingCode);
		
		ArrayList<ScrapVo> scrapList = scrapDao.selectScrap(map);
		
		req.setAttribute("scrapList",scrapList);
		req.setAttribute("postingCode", postingCode);
		req.setAttribute("mainUrl", root + "posting/review/MainReview.jsp");
		
		return moveUrl;
	}
}
