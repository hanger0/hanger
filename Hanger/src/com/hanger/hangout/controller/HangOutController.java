package com.hanger.hangout.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class HangOutController extends BaseController {
	//
	@RequestMapping("/hangOutList.hang")
	public String userTipPage(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "sns/hangOut/HangOutList.jsp");
		
		return moveUrl;
	}
}
