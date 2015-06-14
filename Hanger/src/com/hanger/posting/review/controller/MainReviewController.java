package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.dao.ReviewLikeCheckDao;
import com.hanger.posting.review.vo.ReviewLikeCheckVo;
import com.hanger.scrap.dao.ScrapDao;
import com.hanger.scrap.vo.ScrapVo;

@Controller
public class MainReviewController extends BaseController {
	//
	private ScrapDao scrapDao ;
	private ReviewLikeCheckDao reviewLikeCheckDao;
	
	public void setReviewLikeCheckDao(ReviewLikeCheckDao reviewLikeCheckDao) {
		this.reviewLikeCheckDao = reviewLikeCheckDao;
	}
	public void setScrapDao(ScrapDao scrapDao) {
		this.scrapDao = scrapDao;
	}

	@RequestMapping("/mainReview.hang")
	public String MainReview(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		
		String userCode = (String)session.getAttribute("myUserCode");
		String postingCode = (String)req.getParameter("postingCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("postingCode", postingCode);
		map.put("userCode", userCode);
		
		ArrayList<ReviewLikeCheckVo> likeList = reviewLikeCheckDao.selectLike(map);
		ArrayList<ReviewLikeCheckVo> likeCountList = reviewLikeCheckDao.selectLikeCount(map);
		
		String likeCount = likeCountList.size() +"";
		
		ArrayList<ScrapVo> scrapList = scrapDao.selectScrap(map);
		
		req.setAttribute("scrapList",scrapList);
		req.setAttribute("postingCode", postingCode);
		req.setAttribute("likeList", likeList);
		req.setAttribute("likeCount", likeCount);
		req.setAttribute("mainUrl", root + "posting/review/MainReview.jsp");
		
		return moveUrl;
	}
}
