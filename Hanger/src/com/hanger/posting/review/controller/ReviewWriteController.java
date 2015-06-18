package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemListForReviewDao;
import com.hanger.item.dao.ItemViewDao;
import com.hanger.item.vo.ItemListForReviewVo;
import com.hanger.item.vo.ItemViewVo;

@Controller
public class ReviewWriteController extends BaseController{
	
	private ItemViewDao itemViewDao;
	private ItemListForReviewDao itemListForReviewDao;
	
	public void setItemViewDao(ItemViewDao itemViewDao) {
		this.itemViewDao = itemViewDao;
	}
	
	public void setItemListForReviewDao(ItemListForReviewDao itemListForReviewDao){
		this.itemListForReviewDao = itemListForReviewDao;
	}

	@RequestMapping(value="/reviewWrite.hang", method=RequestMethod.GET)
	public String mainPage(HttpServletRequest request, HttpSession session) {
		
		ArrayList<ItemListForReviewVo> itemListForReview = (ArrayList)session.getAttribute("itemListForReview");
		String itemGroupCode = request.getParameter("itemGroupCode");
		
		if(itemListForReview.size() == 0){
			request.setAttribute("message", "리뷰는 구매한 상품에 한해서 한번만 작성이 가능합니다.");
		} else{
			for(int i = 0; i < itemListForReview.size(); i ++){
				if(!(itemListForReview.get(i).getItemGroupCode()).equals(itemGroupCode)){
					request.setAttribute("message", "리뷰는 구매한 상품에 한해서 한번만 작성이 가능합니다.");
				}
			}
		}
		
		System.out.println("Review Write Controller...");		

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
		
		request.setAttribute("maxPrice", maxPrice);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("item", item);
		request.setAttribute("mainUrl", root + "posting/review/ReviewWriteEditor.jsp");
		
		return moveUrl;
	}
}
