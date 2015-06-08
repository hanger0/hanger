package com.hanger.manager;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class ManagerMainPage extends BaseController {
	
	@RequestMapping("/goManagerMainPage.hang")
	public String goManagerMainPage(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "manager/AdminPageMain.jsp");
		return moveUrl;
	}
}
