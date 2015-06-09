package com.hanger.posting.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class DetailReviewController extends BaseController {
	//
	@RequestMapping("/DetailReview.hang")
	public String review(HttpServletRequest req){
		
		return "posting/review/DetailReview";
	}
}
