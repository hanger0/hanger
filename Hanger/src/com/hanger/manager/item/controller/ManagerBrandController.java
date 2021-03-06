package com.hanger.manager.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class ManagerBrandController extends BaseController{
	//
	@RequestMapping("/managerBrand.hang")
	protected String searchBrand(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")
                || session.getAttribute("adminYn") == null
                || ((String) session.getAttribute("adminYn")).equals("N")) {
			req.setAttribute("message", "관리자로 로그인 해주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		moveUrl = "manager/item/ManagerSearchBrand";
		
		System.out.println("SearchBrand...");
		return moveUrl;
	}
}


