package com.hanger.posting.sale.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class SaleController extends BaseController {
	//
	@RequestMapping("/sale.hang")
	public String brand(HttpServletRequest req){
		req.setAttribute("mainUrl", root+"item/sale/Sale.jsp");
		return moveUrl;
	}
}
