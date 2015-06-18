package com.hanger.manager.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.item.dao.ManagerSearchBrandDao;
import com.hanger.manager.item.vo.ManagerBrandVo;

@Controller
public class ManagerSearchBrandController extends BaseController{
	//
	private ManagerSearchBrandDao managerSearchBrandDao;

	public void setManagerSearchBrandDao(ManagerSearchBrandDao managerSearchBrandDao) {
		this.managerSearchBrandDao = managerSearchBrandDao;
	}

	@RequestMapping("/managerSearchBrand.hang")
	public String searchBrnad(
			@RequestParam("inputBrand") String inputBrand, 
			HttpServletRequest req){
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
		
		moveUrl = "manager/item/ManagerBrandList";
		
		System.out.println("Brand check controller");
		
		List<ManagerBrandVo> brandList = managerSearchBrandDao.searchBrand(inputBrand);
		
		req.setAttribute("brandList", brandList);
		
		return moveUrl;
	}
}
