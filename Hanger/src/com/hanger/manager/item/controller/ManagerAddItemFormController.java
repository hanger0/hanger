package com.hanger.manager.item.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

import com.hanger.manager.item.dao.ManagerAddItemDao;
import com.hanger.manager.item.vo.ItemVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ManagerAddItemFormController extends BaseController{
	private ManagerAddItemDao managerAddItemDao;
	
	public void setManagerAddItemDao(ManagerAddItemDao managerAddItemDao){
		this.managerAddItemDao = managerAddItemDao;
	}
	
	@RequestMapping(value="/addItemResult.hang", method=RequestMethod.POST)
	public ModelAndView managerAddItemForm(HttpServletRequest request) throws IOException{
		File dayFile = new File("F:\\hanger");
		String savePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		ItemVo item = new ItemVo();
		
		String brandCode = mul.getParameter("brand");
		String itemName = mul.getParameter("name");
		int itemMarketPrice = Integer.parseInt(mul.getParameter("marketPrice"));
		int itemSellPrice = Integer.parseInt(mul.getParameter("sellPrice"));
		int itemPurchasePrice = Integer.parseInt(mul.getParameter("purchasePrice"));
		String itemSummary = mul.getParameter("summary");
		int itemSellMaxNum = Integer.parseInt(mul.getParameter("sellMaxNum"));
		String itemOption1Title = null;
		if(mul.getParameter("option1Title") != ""){
			itemOption1Title = mul.getParameter("option1Title");
		}
		String itemOption1Content = null;
		if(mul.getParameter("option1Content") != ""){
			itemOption1Content = mul.getParameter("option1Content");
		}
		String itemOption2Title = null;
		if(mul.getParameter("option2Title") != ""){
			itemOption2Title = mul.getParameter("option2Title");
		}
		String itemOption2Content = null;
		if(mul.getParameter("option2Content") != ""){
			itemOption2Content = mul.getParameter("option2Content");
		}
		String itemOption3Title = null;
		if(mul.getParameter("option3Title") != ""){
			itemOption3Title = mul.getParameter("option3Title");
		}
		String itemOption3Content = null;
		if(mul.getParameter("option3Content") != ""){
			itemOption3Content = mul.getParameter("option3Content");
		}
		
		String itemKind = mul.getParameter("kind");
		int itemStockAmount = Integer.parseInt(mul.getParameter("stockAmount"));
		String itemPicPath = "-";
		String itemPicOrgName = "-";
		String itemPicSaveName = "-";
		int itemPicSize = 123;
		String ip = request.getRemoteAddr();
		
		item.setBrandCode(brandCode);
		item.setItemName(itemName);
		item.setItemMarketPrice(itemMarketPrice);
		item.setItemSellPrice(itemSellPrice);
		item.setItemPurchasePrice(itemPurchasePrice);
		item.setItemSummary(itemSummary);
		item.setItemSellMaxNum(itemSellMaxNum);
		item.setItemOption1Title(itemOption1Title);
		item.setItemOption1Content(itemOption1Content);
		item.setItemOption2Title(itemOption2Title);
		item.setItemOption2Content(itemOption2Content);
		item.setItemOption3Title(itemOption3Title);
		item.setItemOption3Content(itemOption3Content);
		item.setItemKind(itemKind);
		item.setItemStockAmount(itemStockAmount);
		item.setItemPicPath(itemPicPath);
		item.setItemPicOrgName(itemPicOrgName);
		item.setItemPicSaveName(itemPicSaveName);
		item.setItemPicSize(itemPicSize);
		item.setRegId("admin");
		item.setRegIp(ip);
		item.setUpdId("admin");
		item.setUpdIp(ip);
		
		managerAddItemDao.insertItem(item);
		
		System.out.println("manager add item form 실행");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../../index"); // 상품등록 끝나고 돌아갈 화면
		
		return mav;
	}
}
