package com.hanger.item.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemViewDao;
import com.hanger.item.vo.ItemViewVo;

@Controller
public class ItemViewController extends BaseController {
	
	private ItemViewDao itemViewDao;
	public void setItemViewDao(ItemViewDao itemViewDao) {
		this.itemViewDao = itemViewDao;
	}

	@RequestMapping("/itemView.hang")
	public String itemViewPage(HttpServletRequest request, HttpSession session) {	
		String itemGroupCode= request.getParameter("itemGroupCode");
		String itemSizeYn= request.getParameter("itemSizeYn");
		String userCode = (String)session.getAttribute("myUserCode");
		System.out.println("ItemViewController itemGroupCode : "+itemGroupCode);
		
		//String keyWord= request.getParameter("keyWord");
		//String pageNumInStrng= request.getParameter("pageNum");//사용자가 선택한 페이지 번호
		//String itemSort= request.getParameter("itemSort");
		//String cateCode= request.getParameter("cateCode");
		
		HashMap<String, String> itemViewMap=new HashMap<String, String>();
		itemViewMap.put("itemGroupCode", itemGroupCode);		
		itemViewMap.put("userCode", userCode);
		
		ArrayList<ItemViewVo> itemViewList = (ArrayList<ItemViewVo>)itemViewDao.getItemView(itemViewMap);
		request.setAttribute("itemViewList", itemViewList);
		
		if(userCode!=null){			
			ArrayList<ItemViewVo> reviewListOfFollwing = (ArrayList<ItemViewVo>)itemViewDao.getReviewListOfFollwing(itemViewMap);
			request.setAttribute("reviewListOfFollwing", reviewListOfFollwing);
		}
		
		ArrayList<ItemViewVo> reviewList = (ArrayList<ItemViewVo>)itemViewDao.getReviewList(itemViewMap);
		request.setAttribute("reviewList", reviewList);
				
		request.setAttribute("mainUrl", root + "item/ItemView.jsp");
		return moveUrl;
	}

}
