package com.hanger.tip.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class TipController extends BaseController {
	//
	@RequestMapping("/tipList.hang")
	public String review(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "sns/tip/TipList.jsp");
		
		return moveUrl;
	}
}
