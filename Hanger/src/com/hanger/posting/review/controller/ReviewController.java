package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.dao.ReviewListDao;

@Controller
public class ReviewController extends BaseController {
	//
	private ReviewListDao reviewListDao ;
	
	public void setReviewListDao(ReviewListDao reviewListDao) {
		this.reviewListDao = reviewListDao;
	}
	@RequestMapping(value = "/reviewList.hang", method = RequestMethod.GET)
	public String reviewList(HttpServletRequest req, HttpSession session){
		//
		String myUserCode= (String)session.getAttribute("myUserCode");
		HashMap userCodeMap = new HashMap() ;
		userCodeMap.put("myUserCode",myUserCode);
		ArrayList reviewList = reviewListDao.selectReview(userCodeMap);
		
		req.setAttribute("mainUrl", root + "posting/review/ReviewList.jsp");
		req.setAttribute("reviewList", reviewList);
		return moveUrl; 
	}
}
