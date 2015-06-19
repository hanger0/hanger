package com.hanger.manager.managerPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class ManagerPageMainController extends BaseController {

	@RequestMapping("/managerPageMain.hang")
	public String goManagerMainPage(HttpServletRequest request,
			HttpSession session) {
		// admin�� �ƴҰ�� ���� ��� �Ұ�.
		String adminYn = (String) session.getAttribute("adminYn");
		String message = "";
		if (!adminYn.equals("Y")) {
			message = "���� ������ �����ϴ�.";
			request.setAttribute("message", message);
			request.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}

		request.setAttribute("mainUrl", managerPageUrl);
		request.setAttribute("managerPageUrl", root
				+ "manager/managerPage/ManagerPageMain.jsp");
		return moveUrl;
	}

}