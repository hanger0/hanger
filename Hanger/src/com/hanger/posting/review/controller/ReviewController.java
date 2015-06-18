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
import com.hanger.posting.review.vo.ReviewVo;

@Controller
public class ReviewController extends BaseController {
	//
	private ReviewListDao reviewListDao ;
	
	public void setReviewListDao(ReviewListDao reviewListDao) {
		this.reviewListDao = reviewListDao;
	}
	@RequestMapping(value = "/reviewList.hang", method = RequestMethod.GET)
	public String reviewList(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode= (String)session.getAttribute("myUserCode");
		HashMap<String, String> userCodeMap = new HashMap<String, String>() ;
		userCodeMap.put("myUserCode",myUserCode);
		ArrayList<ReviewVo> reviewList = reviewListDao.selectReview(userCodeMap);
		
		req.setAttribute("mainUrl", root + "posting/review/ReviewList.jsp");
		req.setAttribute("reviewList", reviewList);
		return moveUrl; 
	}
}
