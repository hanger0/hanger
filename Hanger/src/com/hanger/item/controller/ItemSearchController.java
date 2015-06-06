package com.hanger.item.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemSearchDao;
import com.hanger.item.dao.ItemSearchInfoDao;

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
		String keyWord= request.getParameter("keyWord");
		String pageNumInStrng= request.getParameter("pageNum");//����ڰ� ������ ������ ��ȣ
		String itemSort= request.getParameter("itemSort");
		String cateCode= request.getParameter("cateCode");
		
		if(keyWord==null || keyWord.length()==0)
		{
			keyWord = "";
		}
		if(pageNumInStrng==null || pageNumInStrng.length()<=0)
		{
			pageNumInStrng = "1";
		}
		if(itemSort==null || itemSort.length()==0)
		{
			itemSort = "";
		}
		if(cateCode==null || cateCode.length()==0)
		{
			cateCode = "";
		}
		int pageNum=Integer.parseInt(pageNumInStrng);		

		System.out.println("itmeSearch.java- keyword : "+keyWord);
		System.out.println("itmeSearch.java- pageNumInStrng : "+pageNumInStrng);
		System.out.println("itmeSearch.java- itemSort : "+itemSort);
		System.out.println("itmeSearch.java- cateCode : "+cateCode);
		
		HashMap<String, String> itemSearchInfoMap = new HashMap<String, String>();
		itemSearchInfoMap.put("keyWord", keyWord);
		itemSearchInfoMap.put("cateCode", cateCode);
		
		ArrayList itemNumbeList = (ArrayList)itemSearchInfoDao.getItemSearchInfoList(itemSearchInfoMap);
		
						
		int pageTotalNum = 0;				// ��ü ������ ��ȣ
		int pageStartNum = 0;				// ���������� ��ȣ
		int pageEndNum = 0;				// �������� ��ȣ

		int articleTotalNum = 0;				// ��ü �� ��
		int perPage = 60;//bi.getPerPage();				// �������� �� ��µǴ� �� ��.
		int articleStartNum = 0;				// ���� �� ��ȣ
		int articleEndNum = 0;				// �� �� ��ȣ
		
		articleTotalNum = Integer.parseInt((String)itemNumbeList.get(0));
		System.out.println("articleTotalNum : "+articleTotalNum);
		
		if(articleTotalNum > 0)
		{
			//��ü ������ ��ȣ
			pageTotalNum = articleTotalNum/perPage;
			if(articleTotalNum%perPage > 0)
			{
				pageTotalNum = pageTotalNum + 1;
			}

			if(pageTotalNum<pageNum)
			{
				pageNum = pageTotalNum;
			}

			// ���������� ��ȣ
			pageStartNum = makePageStartNum(pageNum, pageTotalNum);

			// �������� ��ȣ
			pageEndNum = makePageEndNum(pageNum, pageStartNum, pageTotalNum);

			// ���� �� ��ȣ
			articleStartNum = (pageNum*perPage) - (perPage-1);

			// �� �� ��ȣ
			articleEndNum = articleStartNum+(perPage-1);
			if(articleEndNum>articleTotalNum)
			{
				articleEndNum = articleTotalNum;
			}
		}
		HashMap itemSearchMap = new HashMap();
		
		itemSearchMap.put("keyWord", keyWord);
		itemSearchMap.put("itemSort", itemSort);
		itemSearchMap.put("cateCode", cateCode);
		itemSearchMap.put("articleStartNum", articleStartNum);
		itemSearchMap.put("articleEndNum", articleEndNum);
		
		ArrayList itemList = (ArrayList)itemSearchDao.getItemSearchList(itemSearchMap);
		
		request.setAttribute("itemList", itemList);
		
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
		
		System.out.println("ItemSearchController itemList: "+ itemList);
		
		System.out.println("ItemSearchController itemSort: "+ itemSort);
		System.out.println("ItemSearchController cateCode: "+ cateCode);
		System.out.println("ItemSearchController pageNum: "+ pageNum);
		System.out.println("ItemSearchController keyWord: "+ keyWord);
		
		System.out.println("ItemSearchController articleTotalNum: "+ articleTotalNum);
		System.out.println("ItemSearchController articleStartNum: "+ articleStartNum);
		System.out.println("ItemSearchController articleEndNum: "+ articleEndNum);
		System.out.println("ItemSearchController pageTotalNum: "+ pageTotalNum);
		System.out.println("ItemSearchController pageStartNum: "+ pageStartNum);
		System.out.println("ItemSearchController pageEndNum: "+ pageEndNum);		
		
		return moveUrl;
	}
	
	private int makePageStartNum(int pageNum, int pageTotalNum)
	{
		int pageStartNum = 0;
		
		pageStartNum = ((pageNum/10)*10) +1;
		if(pageNum%10 == 0)
		{
			pageStartNum = pageStartNum - 10;
		}
		return pageStartNum;
	}

	private int makePageEndNum(int pageNum, int pageStartNum, int pageTotalNum)
	{
		int pageEndNum = 0;
		pageEndNum = pageStartNum + 9;		

		if(pageEndNum>pageTotalNum)
		{
			pageEndNum = pageTotalNum;
		}
		return pageEndNum;
	}
		
	protected String entoKo(String en)
	{
		String enKo = null;
		try
		{
			enKo = new String(en.getBytes("8859_1"),"KSC5601");
		}
		catch(UnsupportedEncodingException e)
		{
			System.out.println(e);
		}
		return enKo;
	}
}