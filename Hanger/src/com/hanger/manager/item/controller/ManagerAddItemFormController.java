package com.hanger.manager.item.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.item.dao.ManagerAddItemDao;
import com.hanger.manager.item.vo.ManagerItemVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ManagerAddItemFormController extends BaseController{
	private ManagerAddItemDao managerAddItemDao;
	
	public void setManagerAddItemDao(ManagerAddItemDao managerAddItemDao){
		this.managerAddItemDao = managerAddItemDao;
	}
	
	@RequestMapping(value="/managerAddItemResult.hang", method=RequestMethod.POST)
	public ModelAndView managerAddItemForm(HttpServletRequest request) throws IOException{
		File dayFile = new File("C:\\hanger\\upfile\\manager\\item");
		if(!dayFile.exists())
		{
			dayFile.mkdirs();
		}
		String savePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		ManagerItemVo item = new ManagerItemVo();
		
		String brandCode = mul.getParameter("brandCode");
		String itemName = mul.getParameter("name");
		String itemVolume = mul.getParameter("volume");
		int itemMarketPrice = Integer.parseInt(mul.getParameter("marketPrice"));
		int itemSellPrice = Integer.parseInt(mul.getParameter("sellPrice"));
		int itemPurchasePrice = Integer.parseInt(mul.getParameter("purchasePrice"));
		String itemSummary = mul.getParameter("summary");
		int itemSellMaxNum = Integer.parseInt(mul.getParameter("sellMaxNum"));
		String itemManufactureDate = mul.getParameter("manufactureDate");
		String itemExpireDate = mul.getParameter("expireDate");
		String itemReleaseDate = mul.getParameter("releaseDate");
		String itemCategory = mul.getParameter("category");
		String itemFeature = mul.getParameter("feature");
		int itemStockAmount = Integer.parseInt(mul.getParameter("stockAmount"));
		
		Enumeration formNames = mul.getFileNames();
//		String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
//		System.out.println(fileFormName);
		
		String itemMainPicPath = savePath;
		String itemMainPicOrgName = mul.getOriginalFileName("mainPic");
		String itemMainPicSaveName = mul.getFilesystemName("mainPic");
		int itemMainPicSize = 0;
		
		String itemDetailPicPath = savePath;
		String itemDetailPicOrgName = "";
		String itemDetailPicSaveName = "";
		int itemDetailPicSize = 0;

		String ip = request.getRemoteAddr();
		
		item.setBrandCode(brandCode);
		item.setItemName(itemName);
		item.setItemVolume(itemVolume);
		item.setItemMarketPrice(itemMarketPrice);
		item.setItemSellPrice(itemSellPrice);
		item.setItemPurchasePrice(itemPurchasePrice);
		item.setItemSummary(itemSummary);
		item.setItemSellMaxNum(itemSellMaxNum);
		item.setItemManufactureDate(itemManufactureDate);
		item.setItemExpireDate(itemExpireDate);
		item.setItemReleaseDate(itemReleaseDate);
		item.setItemCategory(itemCategory);
		item.setItemFeature(itemFeature);
		item.setItemStockAmount(itemStockAmount);
		item.setItemMainPicPath(itemMainPicPath);
		item.setItemMainPicOrgName(itemMainPicOrgName);
		item.setItemMainPicSaveName(itemMainPicSaveName);
		item.setItemMainPicSize(itemMainPicSize);
		item.setItemDetailPicPath(itemDetailPicPath);
		item.setItemDetailPicOrgName(itemDetailPicOrgName);
		item.setItemDetailPicSaveName(itemDetailPicSaveName);
		item.setItemDetailPicSize(itemDetailPicSize);
		item.setRegId("admin");
		item.setRegIp(ip);
		item.setUpdId("admin");
		item.setUpdIp(ip);
		
		managerAddItemDao.insertItem(item);
		
		System.out.println("manager add item form 실행");
		
		String[] itemCategoryArr = itemCategory.split("/");
		for(int i = 0; i < itemCategoryArr.length; i++){
			String itemCategoryValue = itemCategoryArr[i];
			managerAddItemDao.insertItemCategory(itemCategoryValue);
		}
		
		for(int i = 1; i < 6; i++){
//			fileFormName = (String)formNames.nextElement();
//			System.out.println(fileFormName);
			if(mul.getOriginalFileName("detailPic" + i) != null){

				itemDetailPicPath = savePath;
				itemDetailPicOrgName = mul.getOriginalFileName("detailPic" + i);
				itemDetailPicSaveName = mul.getFilesystemName("detailPic" + i);
				itemDetailPicSize = 0;
	
				item.setItemDetailPicPath(itemDetailPicPath);
				item.setItemDetailPicOrgName(itemDetailPicOrgName);
				item.setItemDetailPicSaveName(itemDetailPicSaveName);
				item.setItemDetailPicSize(itemDetailPicSize);
				
				managerAddItemDao.insertItemPic(item);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../../index"); // 상품등록 끝나고 돌아갈 화면
		
		return mav;
	}
}
