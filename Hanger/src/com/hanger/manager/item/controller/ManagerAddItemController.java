package com.hanger.manager.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	protected String managerAddItem(HttpServletRequest req) {
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
		
		List<ManagerCategoryVo> category1List = managerAddItemDao.selectCategory1();
		List<ManagerCategoryVo> category2List = managerAddItemDao.selectCategory2();
		List<ManagerCategoryVo> category3List = managerAddItemDao.selectCategory3();;
		List<ManagerFeatureVo> feature1List = managerAddItemDao.selectFeature1();
		List<ManagerFeatureVo> feature2List = managerAddItemDao.selectFeature2();
		
		String adminYn = (String)session.getAttribute("adminYn");
		String message = "";
		
		if(adminYn.equals("N")){
			moveUrl = "manager/item/ManagerAddItem";
			message = "접근 권한이 없습니다.";
		}
		
		moveUrl = "manager/item/ManagerAddItem";

		req.setAttribute("category1List", category1List);
		req.setAttribute("category2List", category2List);
		req.setAttribute("category3List", category3List);
		req.setAttribute("feature1List", feature1List);
		req.setAttribute("feature2List", feature2List);
		req.setAttribute("message", message);
		
		System.out.println("AddItem...");
		return moveUrl;
	}
}
