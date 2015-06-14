package com.hanger.scrap.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.scrap.dao.ScrapDao;


//ajax 컨트롤입니다.
@Controller
public class ScrapController extends BaseController{
	//
	private ScrapDao scrapDao ;
	
	public void setScrapDao(ScrapDao scrapDao) {
		this.scrapDao = scrapDao ;
	}
	
	@RequestMapping(value = "/scrap.hang", method=RequestMethod.POST)
	public String scrap(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String postingCode = (String)req.getParameter("postingCode");
		String ip = req.getRemoteAddr();
		String myUserId = (String)session.getAttribute("myUserId");
		String checkScrap = (String)req.getParameter("checkScrap");
		
		System.out.println("checkScrap : "+checkScrap);
		System.out.println("postingCode : "+postingCode);

		HashMap map = new HashMap();
		map.put("myUserCode", myUserCode);
		map.put("postingCode", postingCode);
		map.put("myUserId", myUserId);
		map.put("ip", ip);
		
		if(checkScrap.equals("true")){
			System.out.println("삭제");
			scrapDao.deleteScrap(map);
		} else if(checkScrap.equals("false")) {
			System.out.println("인설트");
			scrapDao.insertScrap(map);
		}
		//스크랩 AJAX
		ArrayList scrapList = scrapDao.selectScrap(map);
		req.setAttribute("scrapList", scrapList);
		
		return "posting/review/Scrap" ;
	}
}
