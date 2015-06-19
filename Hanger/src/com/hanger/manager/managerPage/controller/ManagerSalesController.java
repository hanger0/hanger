package com.hanger.manager.managerPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.managerPage.dao.ManagerSalesDao;
import com.hanger.manager.managerPage.vo.ManagerPeriodSalesVo;
import com.hanger.manager.managerPage.vo.ManagerSalesVo;

@Controller
public class ManagerSalesController extends BaseController {
	//
	private ManagerSalesDao managerSalesDao;

	public void setManagerSalesDao(ManagerSalesDao managerSalesDao) {
		this.managerSalesDao = managerSalesDao;
	}

	@RequestMapping("/managerSales.hang")
	public String ManagerSales(HttpServletRequest request, HttpSession session) {
		// admin이 아닐경우 접근 허용 불가.
		String adminYn = (String) session.getAttribute("adminYn");
		String message = "";
		if (!adminYn.equals("Y")) {
			message = "접근 권한이 없습니다.";
			request.setAttribute("message", message);
			request.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}


		ArrayList<ManagerSalesVo> salesList = managerSalesDao.selectSalesList();
		ArrayList<ManagerPeriodSalesVo> monthSalesList = managerSalesDao.selectMonthSales();
		
		request.setAttribute("salesList", salesList);
		request.setAttribute("monthSalesList", monthSalesList);
		request.setAttribute("mainUrl", managerPageUrl);
		request.setAttribute("managerPageUrl", root
				+ "manager/managerPage/ManagerSales.jsp");

		return moveUrl;
	}
}
