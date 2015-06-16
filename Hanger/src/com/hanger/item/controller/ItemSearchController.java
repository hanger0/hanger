package com.hanger.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemSearchDao;
import com.hanger.item.dao.ItemSearchInfoDao;
import com.hanger.item.vo.ItemSearchVo;

@Controller
public class ItemSearchController extends BaseController {

	private ItemSearchDao itemSearchDao;
	private ItemSearchInfoDao itemSearchInfoDao;

	public void setItemSearchDao(ItemSearchDao itemSearchDao) {
		this.itemSearchDao = itemSearchDao;
	}

	public void setItemSearchInfoDao(ItemSearchInfoDao itemSearchInfoDao) {
		this.itemSearchInfoDao = itemSearchInfoDao;
	}

	@RequestMapping("/itemSearch.hang")
	public String itemSearchPage(HttpServletRequest request, HttpSession session) {
		String keyWord = request.getParameter("keyWord");
		String pageNumInStrng = request.getParameter("pageNum");// 사용자가 선택한 페이지
																// 번호
		String itemSort = request.getParameter("itemSort");
		String cateCode = request.getParameter("cateCode");

		if (keyWord == null || keyWord.length() == 0) {
			keyWord = "";
		}
		if (pageNumInStrng == null || pageNumInStrng.length() <= 0) {
			pageNumInStrng = "1";
		}
		if (itemSort == null || itemSort.length() == 0) {
			itemSort = "";
		}
		if (cateCode == null || cateCode.length() == 0) {
			cateCode = "";
		}
		int pageNum = Integer.parseInt(pageNumInStrng);

		HashMap<String, String> itemSearchInfoMap = new HashMap<String, String>();
		itemSearchInfoMap.put("keyWord", keyWord);
		itemSearchInfoMap.put("cateCode", cateCode);

		ArrayList itemNumbeList = (ArrayList) itemSearchInfoDao
				.getItemSearchInfoList(itemSearchInfoMap);

		int pageTotalNum = 0; // 전체 페이지 번호
		int pageStartNum = 0; // 시작페이지 번호
		int pageEndNum = 0; // 끝페이지 번호

		int articleTotalNum = 0; // 전체 글 수
		int perPage = 60;// bi.getPerPage(); // 한페이지 당 출력되는 글 수.
		int articleStartNum = 0; // 시작 글 번호
		int articleEndNum = 0; // 끝 글 번호

		articleTotalNum = Integer.parseInt((String) itemNumbeList.get(0));

		if (articleTotalNum > 0) {
			// 전체 페이지 번호
			pageTotalNum = articleTotalNum / perPage;
			if (articleTotalNum % perPage > 0) {
				pageTotalNum = pageTotalNum + 1;
			}

			if (pageTotalNum < pageNum) {
				pageNum = pageTotalNum;
			}

			// 시작페이지 번호
			pageStartNum = makePageStartNum(pageNum, pageTotalNum);

			// 끝페이지 번호
			pageEndNum = makePageEndNum(pageNum, pageStartNum, pageTotalNum);

			// 시작 글 번호
			articleStartNum = (pageNum * perPage) - (perPage - 1);

			// 끝 글 번호
			articleEndNum = articleStartNum + (perPage - 1);
			if (articleEndNum > articleTotalNum) {
				articleEndNum = articleTotalNum;
			}
		}
		HashMap itemSearchMap = new HashMap();

		itemSearchMap.put("keyWord", keyWord);
		itemSearchMap.put("itemSort", itemSort);
		itemSearchMap.put("cateCode", cateCode);
		itemSearchMap.put("articleStartNum", articleStartNum);
		itemSearchMap.put("articleEndNum", articleEndNum);

		ArrayList itemList = (ArrayList) itemSearchDao.getItemSearchList(itemSearchMap);
		if(itemList!=null&&itemList.size()>0)
		{
			itemList = arrangeList(itemList);
		}		
		System.out.println("----아이템서치컨트롤러 itemList : "+itemList);
		ArrayList cateList = null;
		if (cateCode.startsWith("C1")) {
			cateList = (ArrayList) itemSearchDao.getCate2List(cateCode);
		} else if (cateCode.startsWith("C2")) {
			cateList = (ArrayList) itemSearchDao.getCate3List(cateCode);
		} else if (cateCode.startsWith("C3")) {
			cateList = (ArrayList) itemSearchDao.getSpecificCate3List(cateCode);
		}

		request.setAttribute("itemList", itemList);
		request.setAttribute("cateList", cateList);

		request.setAttribute("keyWord", keyWord);
		request.setAttribute("itemSort", itemSort);
		request.setAttribute("cateCode", cateCode);
		request.setAttribute("pageNum", pageNum);

		request.setAttribute("articleTotalNum", articleTotalNum);
		request.setAttribute("articleStartNum", articleStartNum);
		request.setAttribute("articleEndNum", articleEndNum);

		request.setAttribute("pageTotalNum", pageTotalNum);
		request.setAttribute("pageStartNum", pageStartNum);
		request.setAttribute("pageEndNum", pageEndNum);

		request.setAttribute("mainUrl", root + "item/ItemList.jsp");

		return moveUrl;
	}

	private int makePageStartNum(int pageNum, int pageTotalNum) {
		int pageStartNum = 0;

		pageStartNum = ((pageNum / 10) * 10) + 1;
		if (pageNum % 10 == 0) {
			pageStartNum = pageStartNum - 10;
		}
		return pageStartNum;
	}

	private int makePageEndNum(int pageNum, int pageStartNum, int pageTotalNum) {
		int pageEndNum = 0;
		pageEndNum = pageStartNum + 9;

		if (pageEndNum > pageTotalNum) {
			pageEndNum = pageTotalNum;
		}
		return pageEndNum;
	}

	private ArrayList arrangeList(ArrayList itemList) {
		
		ArrayList tempList = new ArrayList();
		for (int i = 0; i < itemList.size(); i++) {
			Hashtable tempTable = new Hashtable();
			ItemSearchVo isv = (ItemSearchVo) itemList.get(i);			
			tempTable.put("groupNum",isv.getGroupNum());
			tempTable.put("itemCode",isv.getItemCode());
			tempTable.put("itemGroupCode",isv.getItemGroupCode());
			tempTable.put("itemSizeYn",isv.getItemSizeYn());
			tempTable.put("itemName",isv.getItemName());
			tempTable.put("brandName",isv.getBrandName());
			tempTable.put("itemMarketPrice",isv.getItemMarketPrice());
			tempTable.put("itemSellPrice",isv.getItemSellPrice());
			tempTable.put("itemDiscount",isv.getItemDiscount());
			tempTable.put("itemPicPath",isv.getItemPicPath());
			tempTable.put("itemSavename",isv.getItemPicSavename());
			tempTable.put("itemStatus",isv.getItemStatus());
			String itemScore = isv.getItemScore();
			if (itemScore == null) {
				itemScore = "평점 없음";
			}
			tempTable.put("itemScore",itemScore);
			tempTable.put("itemReviewCnt",isv.getReviewCnt());
			System.out.println("----ddf++아이템서치컨트롤러+++++++++ tempTable : "+tempTable);
			
			tempList.add(tempTable);
		}
		System.out.println("---------++++아이템서치컨트롤러 tempList : "+tempList);

		
		ArrayList arrangedItemList = new ArrayList();
		ArrayList priceList = new ArrayList();
		Hashtable itemTable;
		String groupNum = "";
		
		for (int i = 0; i < tempList.size(); i++) {
			Hashtable groupTable = (Hashtable) tempList.get(i);
			String tempGroupNum = (String) groupTable.get("groupNum");
			String tempItemMarketPrice = (String) groupTable.get("itemMarketPrice");
			String tempItemSellPrice = (String) groupTable.get("itemSellPrice");
			String tempItemDiscount = (String) groupTable.get("itemDiscount");
			
			System.out.println("---------++++아이템서치컨트롤러 : "+tempGroupNum);
			System.out.println("---------++++아이템서치컨트롤러 : "+tempItemMarketPrice);
			System.out.println("---------++++아이템서치컨트롤러 : "+tempItemSellPrice);
			System.out.println("---------++++아이템서치컨트롤러 : "+tempItemDiscount);
			if (!groupNum.equals(tempGroupNum)) {
				groupTable.remove("itemMarketPrice");
				groupTable.remove("itemSellPrice");
				groupTable.remove("itemDiscount");

				itemTable = groupTable;

				priceList = new ArrayList();
				groupNum = tempGroupNum;

				itemTable.put("priceList", priceList);
				arrangedItemList.add(itemTable);
			}

			Hashtable priceTable = new Hashtable();
			priceTable.put("itemMarketPrice", tempItemMarketPrice);
			priceTable.put("itemSellPrice", tempItemSellPrice);
			priceTable.put("itemDiscount", tempItemDiscount);

			priceList.add(priceTable);
		}
		return arrangedItemList;
	}
}