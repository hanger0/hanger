package com.hanger.reply.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.reply.dao.ReplySelectDao;
import com.hanger.reply.vo.ReplyVo;

@Controller
public class ReplySelectController extends BaseController{

	private ReplySelectDao replySelectDao;
	
	public void setReplySelectDao(ReplySelectDao replySelectDao) {
		this.replySelectDao = replySelectDao;
	}

	@RequestMapping(value="/replySelect.hang", method=RequestMethod.GET)
	public String replySelect(HttpServletRequest req) {
		//
		System.out.println("Select 컨트롤러 시작");
		//HttpSession session = req.getSession();
		
		//String postingCode = req.getParameter("postingCode");
    	System.out.println("ReplySelect 실행....");
    	
    	HashMap map = new HashMap();
    	map.put("postingCodeList", "posodes");
    	
		
    	ArrayList<ReplyVo> replyList = replySelectDao.selectReply(map);
    	req.setAttribute("replyList", replyList);
    	System.out.println(replyList.size());
    	
    	req.setAttribute("mainUrl", root+ "posting/tip/MainTip.jsp");
    	
		//req.setAttribute("mainUrl", root + "common/Frame");
		
		return moveUrl;
	}
}
