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
		String pageNumInStrng = request.getParameter("pageNum");// ����ڰ� ������ ������
																// ��ȣ
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

		int pageTotalNum = 0; // ��ü ������ ��ȣ
		int pageStartNum = 0; // ���������� ��ȣ
		int pageEndNum = 0; // �������� ��ȣ

		int articleTotalNum = 0; // ��ü �� ��
		int perPage = 60;// bi.getPerPage(); // �������� �� ��µǴ� �� ��.
		int articleStartNum = 0; // ���� �� ��ȣ
		int articleEndNum = 0; // �� �� ��ȣ

		articleTotalNum = Integer.parseInt((String) itemNumbeList.get(0));

		if (articleTotalNum > 0) {
			// ��ü ������ ��ȣ
			pageTotalNum = articleTotalNum / perPage;
			if (articleTotalNum % perPage > 0) {
				pageTotalNum = pageTotalNum + 1;
			}

			if (pageTotalNum < pageNum) {
				pageNum = pageTotalNum;
			}

			// ���������� ��ȣ
			pageStartNum = makePageStartNum(pageNum, pageTotalNum);

			// �������� ��ȣ
			pageEndNum = makePageEndNum(pageNum, pageStartNum, pageTotalNum);

			// ���� �� ��ȣ
			articleStartNum = (pageNum * perPage) - (perPage - 1);

			// �� �� ��ȣ
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
		System.out.println("----�����ۼ�ġ��Ʈ�ѷ� itemList : "+itemList);
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
				itemScore = "���� ����";
			}
			tempTable.put("itemScore",itemScore);
			tempTable.put("itemReviewCnt",isv.getReviewCnt());
			System.out.println("----ddf++�����ۼ�ġ��Ʈ�ѷ�+++++++++ tempTable : "+tempTable);
			
			tempList.add(tempTable);
		}
		System.out.println("---------++++�����ۼ�ġ��Ʈ�ѷ� tempList : "+tempList);

		
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
			
			System.out.println("---------++++�����ۼ�ġ��Ʈ�ѷ� : "+tempGroupNum);
			System.out.println("---------++++�����ۼ�ġ��Ʈ�ѷ� : "+tempItemMarketPrice);
			System.out.println("---------++++�����ۼ�ġ��Ʈ�ѷ� : "+tempItemSellPrice);
			System.out.println("---------++++�����ۼ�ġ��Ʈ�ѷ� : "+tempItemDiscount);
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