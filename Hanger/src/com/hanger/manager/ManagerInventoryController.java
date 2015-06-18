package com.hanger.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class ManagerInventoryController extends BaseController{
	//
	@RequestMapping("/managerInventory.hang")
	public String ManagerInventory(HttpServletRequest req) {
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
		
		req.setAttribute("mainUrl", managerPageUrl);
		req.setAttribute("managerPageUrl", root + "manager/ManagerInventory.jsp");
		
		return moveUrl ;	
	}
 }
