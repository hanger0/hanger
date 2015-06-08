package com.hanger.brand.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class BrandController extends BaseController {
	//
	@RequestMapping("/brand.hang")
	public String brand(HttpServletRequest req){
		req.setAttribute("mainUrl", root+"item/brand/Brand.jsp");
		return moveUrl;
	}
}
