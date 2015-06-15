package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemViewDao;
import com.hanger.item.vo.ItemViewVo;

@Controller
public class ReviewWriteController extends BaseController{
	
	private ItemViewDao itemViewDao;
	
	public void setItemViewDao(ItemViewDao itemViewDao) {
		this.itemViewDao = itemViewDao;
	}

	@RequestMapping(value="/reviewWrite.hang", method=RequestMethod.GET)
	public ModelAndView mainPage(HttpServletRequest request) {		
		System.out.println("Review Write Controller...");
		
		String itemGroupCode = request.getParameter("itemGroupCode");

		HashMap<String, String> itemViewMap = new HashMap<String, String>();
		itemViewMap.put("itemGroupCode", itemGroupCode);
		ArrayList<ItemViewVo> itemViewList = (ArrayList<ItemViewVo>)itemViewDao.getItemView(itemViewMap);
		
		ItemViewVo item = itemViewList.get(0);
		int maxPrice = Integer.parseInt(item.getItemMarketPrice());
		int minPrice = Integer.parseInt(item.getItemMarketPrice());
		int price = 0;
		
		for(int i = 0; i < itemViewList.size(); i++){
			item = itemViewList.get(i);
			price = Integer.parseInt(item.getItemMarketPrice());
			if(maxPrice < price){
				maxPrice = price;
			}
			if(minPrice > price){
				minPrice = price;
			}
		}
		
		ModelAndView mav = new ModelAndView();
		moveUrl = "posting/review/ReviewWriteEditor";
		
		mav.addObject("maxPrice", maxPrice);
		mav.addObject("minPrice", minPrice);
		mav.addObject("item", item);
		mav.setViewName(moveUrl);
		
		return mav;
	}
}
