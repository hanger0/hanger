package com.hanger.manager.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	protected ModelAndView addBrand(HttpServletRequest request,
			HttpServletResponse response) {

		ManagerBrandVo brand = new ManagerBrandVo();
		String brandName = request.getParameter("brandName");
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
		
		ModelAndView mav = new ModelAndView();
		moveUrl = "manager/item/ManagerSearchBrand";
		mav.setViewName(moveUrl);
		mav.addObject("message", message);
		
		return mav;
	}
}
