package com.hanger.manager.item.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String managerAddItemForm(HttpServletRequest req) throws IOException{
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
		
		File dayFile = new File("C:/workspace/hanger/Hanger/WebContent/upfile/item/detail");
		if(!dayFile.exists())
		{
			dayFile.mkdirs();
		}
		String savePath = "/upfile/item/detail";
		//String saveAbsolutePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(req, "C:/workspace/hanger/Hanger/WebContent/upfile/item/detail", sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		ManagerItemVo item = new ManagerItemVo();
		
		//List<ManagerItemVo> itemList;

		int sizeCnt = Integer.parseInt(mul.getParameter("sizeCnt"));
		String brandCode = mul.getParameter("brandCode");
		String itemName = mul.getParameter("name");
		String itemSummaryInfo = mul.getParameter("summaryInfo");
		String itemDetailInfo = mul.getParameter("detailInfo");
		String itemTotalInfo = "";
		String itemIngredient = mul.getParameter("ingredient");
		String itemHowToUse = mul.getParameter("howToUse");
		String itemReleaseDate = mul.getParameter("releaseYear") + mul.getParameter("releaseMonth") + mul.getParameter("releaseDay");
		String[] itemCategory = mul.getParameterValues("category");
		String[] itemFeature = mul.getParameterValues("feature");

		String[] temp = (mul.getParameter("totalInfo")).split("\"");
		//quot
		for(int i = 0; i < (temp.length - 2); i++){
			if((temp[i].length() >= 4) && (temp[i].substring(temp[i].length()-4).equals("src="))){
				temp[i+1] = savePath; //path
				itemTotalInfo += temp[i] + "\"";
			}
			else if(temp[i].equals(" data-filename=")){				
				itemTotalInfo += "/";
			} else if(temp[i].equals(savePath)){
				itemTotalInfo += temp[i];
			} else {
				itemTotalInfo += temp[i] + "\"";
			}
		}
		
		itemTotalInfo += temp[temp.length-2] + "\"" + temp[temp.length-1];
		
		String [] itemSize = new String[sizeCnt];
		int [] itemMarketPrice = new int[sizeCnt];
		int [] itemSellPrice = new int[sizeCnt];
		int [] itemPurchasePrice = new int[sizeCnt];
		String [] itemManufactureDate = new String[sizeCnt];
		String [] itemExpireDate = new String[sizeCnt];
		String [] itemSellMaxNum = new String[sizeCnt];
		String [] itemStockAmount = new String[sizeCnt];

		for(int i = 0; i < sizeCnt; i++){
			itemSize[i] = mul.getParameter("size" + i);
			itemMarketPrice[i] = Integer.parseInt(mul.getParameter("marketPrice" + i));
			itemSellPrice[i] = Integer.parseInt(mul.getParameter("sellPrice" + i));
			itemPurchasePrice[i] = Integer.parseInt(mul.getParameter("purchasePrice" + i));
			itemManufactureDate[i] = (mul.getParameter("manufactureYear" + i)) + (mul.getParameter("manufactureMonth" + i)) + (mul.getParameter("manufactureDay" + i));
			itemExpireDate[i] = (mul.getParameter("expireYear" + i)) + (mul.getParameter("expireMonth" + i)) + (mul.getParameter("expireDay" + i));
			itemSellMaxNum[i] = mul.getParameter("sellMaxNum" + i);
			itemStockAmount[i] = mul.getParameter("stockAmount" + i);
		}
		
		Enumeration formNames = mul.getFileNames();
//		String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
//		System.out.println(fileFormName);
		
		String itemMainPicPath = savePath;
		String itemMainPicOrgName = mul.getOriginalFileName("mainPic");
		String itemMainPicSaveName = mul.getFilesystemName("mainPic");
		int itemMainPicSize = 0;
		

		String ip = req.getRemoteAddr();
		
		item.setBrandCode(brandCode);
		item.setItemName(itemName);
		item.setItemSummaryInfo(itemSummaryInfo);
		item.setItemDetailInfo(itemDetailInfo);
		item.setItemTotalInfo(itemTotalInfo);
		item.setItemIngredient(itemIngredient);
		item.setItemHowToUse(itemHowToUse);
		item.setItemReleaseDate(itemReleaseDate);
		item.setItemCategory(itemCategory);
		item.setItemFeature(itemFeature);
		item.setItemMainPicPath(itemMainPicPath);
		item.setItemMainPicOrgName(itemMainPicOrgName);
		item.setItemMainPicSaveName(itemMainPicSaveName);
		item.setItemMainPicSize(itemMainPicSize);
		item.setRegId("admin");
		item.setRegIp(ip);
		item.setUpdId("admin");
		item.setUpdIp(ip);
		
		for(int i = 0; i < sizeCnt; i++){
			item.setItemSize(itemSize[i]);
			item.setItemMarketPrice(itemMarketPrice[i]);
			item.setItemSellPrice(itemSellPrice[i]);
			item.setItemPurchasePrice(itemPurchasePrice[i]);
			item.setItemManufactureDate(itemManufactureDate[i]);
			item.setItemExpireDate(itemExpireDate[i]);
			item.setItemSellMaxNum(itemSellMaxNum[i]);
			item.setItemStockAmount(itemStockAmount[i]);
			
			if(i == 0){
				managerAddItemDao.insertItem(item);
			} else {
				managerAddItemDao.insertOtherSizeItem(item);
			}
		}
		
		System.out.println("manager add item form 실행");
		
		for(int i = 0; i < itemCategory.length; i++){
			String itemCategoryValue = itemCategory[i];
			managerAddItemDao.insertItemCategory(itemCategoryValue);
		}
		
		for(int i = 0; i < itemFeature.length; i++){
			String itemFeatureValue = itemFeature[i];
			managerAddItemDao.insertItemFeature(itemFeatureValue);
		}
		return "../../index";// 상품등록 끝나고 돌아갈 화면
	}
}
