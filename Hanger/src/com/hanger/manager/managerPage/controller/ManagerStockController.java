package com.hanger.manager.managerPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.managerPage.dao.ManagerStockDao;
import com.hanger.manager.managerPage.vo.ManagerStockVo;

@Controller
public class ManagerStockController extends BaseController {

	private ManagerStockDao managerStockDao;

	public void setManagerStockDao(ManagerStockDao managerStockDao) {
		this.managerStockDao = managerStockDao;
	}

	@RequestMapping("/managerStock.hang")
	public String ManagerInventory(HttpServletRequest request,
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

		ArrayList<ManagerStockVo> stockList = managerStockDao.selecStockAll();

		request.setAttribute("stockList", stockList);
		request.setAttribute("mainUrl", managerPageUrl);
		request.setAttribute("managerPageUrl", root
				+ "manager/managerPage/ManagerStock.jsp");

		return moveUrl;
	}
}