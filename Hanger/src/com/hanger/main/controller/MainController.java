package com.hanger.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class MainController extends BaseController {
	
	@RequestMapping("/main.hang")
	public String mainPage(HttpServletRequest request, HttpSession session) {		
		System.out.println("���� ��Ʈ�ѷ�.java");
		request.setAttribute("page", "main");
		
		return frame;
	}
}
