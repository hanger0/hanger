package com.hanger.manager.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.item.dao.ManagerAddItemDao;
import com.hanger.manager.item.vo.ManagerCategoryVo;
import com.hanger.manager.item.vo.ManagerFeatureVo;

@Controller
public class ManagerAddItemController extends BaseController {
	private ManagerAddItemDao managerAddItemDao;

	public void setManagerAddItemDao(ManagerAddItemDao managerAddItemDao) {
		this.managerAddItemDao = managerAddItemDao;
	}

	@RequestMapping("/managerAddItem.hang")
	protected ModelAndView managerAddItem(HttpServletRequest request,
			HttpServletResponse response) {
		List<ManagerCategoryVo> category1List = managerAddItemDao.selectCategory1();
		List<ManagerCategoryVo> category2List = managerAddItemDao.selectCategory2();
		List<ManagerCategoryVo> category3List = managerAddItemDao.selectCategory3();;
		List<ManagerFeatureVo> feature1List = managerAddItemDao.selectFeature1();
		List<ManagerFeatureVo> feature2List = managerAddItemDao.selectFeature2();
		
		moveUrl = "manager/item/ManagerAddItem";

		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl); // 어떤 jsp로 가는지
		mav.addObject("category1List", category1List);
		mav.addObject("category2List", category2List);
		mav.addObject("category3List", category3List);
		mav.addObject("feature1List", feature1List);
		mav.addObject("feature2List", feature2List);

		System.out.println("AddItem...");
		return mav;
	}
}
