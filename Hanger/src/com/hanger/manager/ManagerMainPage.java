package com.hanger.manager;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class ManagerMainPage extends BaseController {
	
	@RequestMapping("/managerPageMain.hang")
	public String goManagerMainPage(HttpServletRequest req){
		
		req.setAttribute("mainUrl", managerPageUrl);
		req.setAttribute("managerPageUrl", root + "manager/ManagerPageMain.jsp");
		return moveUrl;
	}
	
	@RequestMapping("/productInfo.hang")
	public String productInfo(HttpServletRequest req) {
		
		req.setAttribute("mainUrl", managerPageUrl);
		req.setAttribute("managerPageUrl", root + "manager/ManagerPageMain.jsp");
		return moveUrl;
	}
}