package com.hanger.posting.review.controller;

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

	@RequestMapping(value = "/reviewShow.hang", method = RequestMethod.GET)
	public String MainReview(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		System.out.println("reviewShow.hang");

		String reviewCode = (String) req.getParameter("reviewCode");
		String userCode = (String) session.getAttribute("myUserCode");
		// review

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reviewCode", reviewCode);
		map.put("userCode", userCode);
		List<ReviewShowVo> reviewList = reviewShowDao.getReviewShow(map);
		
		ReviewShowVo review = reviewList.get(0);
		int maxPrice = review.getItemSellPrice();
		int minPrice = review.getItemSellPrice();
		int price = 0;

		for (int i = 0; i < reviewList.size(); i++) {
			review = reviewList.get(i);
			price = review.getItemSellPrice();
			if (maxPrice < price) {
				maxPrice = price;
			}
			if (minPrice > price) {
				minPrice = price;
			}

		}

		req.setAttribute("maxPrice", maxPrice);
		req.setAttribute("minPrice", minPrice);
		req.setAttribute("reviewList", reviewList);
		
		moveUrl = "posting/review/ReviewShow";
		return moveUrl;

	}
}
