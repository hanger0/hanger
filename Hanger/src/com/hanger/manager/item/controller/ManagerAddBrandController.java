package com.hanger.manager.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.item.dao.ManagerAddBrandDao;
import com.hanger.manager.item.dao.ManagerSearchBrandDao;
import com.hanger.manager.item.vo.ManagerBrandVo;

@Controller
public class ManagerAddBrandController extends BaseController {
	private ManagerSearchBrandDao managerSearchBrandDao;
	private ManagerAddBrandDao managerAddBrandDao;

	public void setManagerSearchBrandDao(ManagerSearchBrandDao managerSearchBrandDao) {
		this.managerSearchBrandDao = managerSearchBrandDao;
	}
	public void setManagerAddBrandDao(ManagerAddBrandDao managerAddBrandDao) {
		this.managerAddBrandDao = managerAddBrandDao;
	}

	@RequestMapping(value = "/managerAddBrand.hang")
	protected String addBrand(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")
                || session.getAttribute("adminYn") == null
                || ((String) session.getAttribute("adminYn")).equals("N")) {
			req.setAttribute("message", "�����ڷ� �α��� ���ּ���.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		ManagerBrandVo brand = new ManagerBrandVo();
		String brandName = req.getParameter("brandName");
		String message = "�̹� ��ϵǾ� �ִ� �귣���Դϴ�.";
		
		List<ManagerBrandVo> brandList = managerSearchBrandDao.searchCompleteBrand(brandName);		
		
		System.out.println("Try to add brand");
		
		if(brandList.size() == 0){
			brand.setBrandName(brandName);
			System.out.println(brandName);
			System.out.println(brand.getBrandName());
			managerAddBrandDao.insertBrand(brand);
			System.out.println("Success add brand...");
			message = "�귣�尡 ��ϵǾ����ϴ�.";
		}
		
		moveUrl = "manager/item/ManagerSearchBrand";
		req.setAttribute("message", message);
		
		return moveUrl;
	}
}
