package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;

import com.hanger.posting.review.dao.ReviewShowDao;
import com.hanger.posting.review.vo.ReviewShowVo;

@Controller
public class ReviewShowController extends BaseController {

	private ReviewShowDao reviewShowDao;
	
	public void setReviewShowDao(ReviewShowDao reviewShowDao) {
		this.reviewShowDao = reviewShowDao;
	}
	
	@RequestMapping(value="/reviewShow.hang", method=RequestMethod.GET)
	public String MainReview(HttpServletRequest request, HttpSession session) {
		
		System.out.println("reviewShow.hang");
		
		String reviewCode = (String)request.getParameter("reviewCode");
		
		//review
		List<ReviewShowVo> reviewList = reviewShowDao.getReviewShow(reviewCode);
		ReviewShowVo review = reviewList.get(0);
		
		int maxPrice = review.getItemSellPrice();
		int minPrice = review.getItemSellPrice();
		int price = 0;
		
		for(int i = 0; i < reviewList.size(); i++){
			review = reviewList.get(i);
			price = review.getItemSellPrice();
			if(maxPrice < price){
				maxPrice = price;
			}
			if(minPrice > price){
				minPrice = price;
			}

		}
		
		review.setItemMaxPrice(maxPrice);
		review.setItemMinPrice(minPrice);
						
		request.setAttribute("review", review);

		moveUrl = "posting/review/ReviewShow";
		return moveUrl;
		
	}
}
