package com.hanger.item.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;

@Controller
public class ItemListController extends BaseController {
	//
	@RequestMapping(value="/shopList.hang", method=RequestMethod.GET)
	public String ItemList(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "item/ShopList.jsp");
		return moveUrl;
	}
}
