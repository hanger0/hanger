package com.hanger.posting.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class MainReviewController extends BaseController {
	//
	@RequestMapping("/mainReview.hang")
	public String MainReview(HttpServletRequest req) {
		req.setAttribute("mainUrl", root + "posting/review/MainReview.jsp");
		
		return moveUrl;
	}
}
