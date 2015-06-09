package com.hanger.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.hanger.common.controller.BaseController;

@Controller
public class ItemBuyController extends BaseController{
	
	@RequestMapping(value="/ItemBuy.hang", method=RequestMethod.GET)
	public String goItemBuy(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "order/ItemBuy.jsp");
		
		return moveUrl ;
	}
}
