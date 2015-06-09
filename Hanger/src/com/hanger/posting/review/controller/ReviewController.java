package com.hanger.posting.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class ReviewController extends BaseController {
	//
	@RequestMapping("/reviewList.hang")
	public String review(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "posting/review/ReviewList.jsp");
		return moveUrl;
	}
}
