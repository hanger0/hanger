package com.hanger.manager.managerPage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.managerPage.dao.ManagerOrderListDao;
import com.hanger.manager.managerPage.vo.ManagerOrderListVo;

@Controller
public class ManagerOrderListController extends BaseController {

	private ManagerOrderListDao managerOrderListDao;

	public void setManagerOrderListDao(ManagerOrderListDao managerOrderListDao) {
		this.managerOrderListDao = managerOrderListDao;
	}

	@RequestMapping("/managerOrderList.hang")
	public String ManagerBuyInfo(HttpServletRequest request, HttpSession session) {
		// admin이 아닐경우 접근 허용 불가.
		String adminYn = (String) session.getAttribute("adminYn");
		String message = "";
		if (!adminYn.equals("Y")) {
			message = "접근 권한이 없습니다.";
			request.setAttribute("message", message);
			request.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}

		HashMap<String, String> map = new HashMap<String, String>();

		ArrayList<ManagerOrderListVo> orderListAll = managerOrderListDao
				.selectAllOrderListAll(map);

		request.setAttribute("orderListAll", orderListAll);
		request.setAttribute("mainUrl", managerPageUrl);
		request.setAttribute("managerPageUrl", root
				+ "manager/managerPage/ManagerOrderList.jsp");

		return moveUrl;
	}
}
