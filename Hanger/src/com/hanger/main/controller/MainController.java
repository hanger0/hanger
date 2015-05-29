package com.hanger.main.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.main.dao.PremiumDao;
import com.hanger.main.dao.StoreDao;
import com.hanger.main.vo.StoreListCondition;

@Controller
public class MainController extends BaseController {
	/*
	private PremiumDao premiumDao;
	private StoreDao storeDao;
	private StoreListCondition storeListCondition;

	
	public void setPremiumDao(PremiumDao premiumDao) {
		this.premiumDao = premiumDao;
	}

	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}
	*/
	@RequestMapping("/main.hang")
	public String mainPage(HttpServletRequest request, HttpSession session) {		
		System.out.println("메인 컨트롤러.java");
		request.setAttribute("page", "main");
		//request.setAttribute("mainUrl", root + "storeList/StoreListView.jsp");
		return frame;
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
