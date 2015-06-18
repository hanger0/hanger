package com.hanger.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;

@Controller
public class ItemBuyController extends BaseController{
	
	@RequestMapping(value="/ItemBuy.hang", method=RequestMethod.GET)
	public String goItemBuy(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		req.setAttribute("mainUrl", root + "order/ItemBuy.jsp");
		
		return moveUrl ;
	}
}
