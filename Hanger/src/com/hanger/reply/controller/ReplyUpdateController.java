package com.hanger.reply.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.reply.dao.ReplyRemoveDao;
import com.hanger.reply.dao.ReplyUpdateDao;
import com.hanger.reply.vo.ReplyVo;

@Controller
public class ReplyUpdateController  extends BaseController{
	private ReplyUpdateDao replyUpdateDao;
	private ReplyRemoveDao replyRemoveDao;
	
	public void setReplyUpdateDao(ReplyUpdateDao replyUpdateDao) {
		this.replyUpdateDao = replyUpdateDao;
	}
	public void setReplyRemoveDao(ReplyRemoveDao replyRemoveDao) {
		this.replyRemoveDao = replyRemoveDao;
	}
	
	/******************************Modify Reply Start*********************************/
	@RequestMapping(value="/replyUpdate.hang", method=RequestMethod.POST)
	public String updateReply(HttpServletRequest req){
	
		System.out.println("Update 컨트롤러 시작");
		HttpSession session = req.getSession(false);
		
		
		//log("리플라이");
		String userId = (String)session.getAttribute("myUserId");
		String userCode = (String)session.getAttribute("myUserCode");
    	String replyContent = req.getParameter("replyContent");
    	String ip = req.getRemoteAddr();
    	String replyCode = req.getParameter("replyCode");
	
    	
    	HashMap map = new HashMap();
    	map.put("userId", userId);
    	map.put("userCode", userCode);
    	map.put("replyCode", replyCode);
    	map.put("replyContent", replyContent);
    	map.put("regId", userId);
    	map.put("regIp", ip);
    	map.put("updId", userId);
    	map.put("updIp", ip);
    	
    	ArrayList<ReplyVo> updatereplyList = replyUpdateDao.updateReply(map);
    	
    	req.setAttribute("updatereplyList", updatereplyList);
    	req.setAttribute("mainUrl", root+ "posting/tip/MainTip.jsp");
    	return moveUrl;
	}
	/******************************Modify Reply End*********************************/
	
	/******************************Delete Reply Start*********************************/
	@RequestMapping(value="/replyRemove.hang", method=RequestMethod.POST)
	public String removeReply(HttpServletRequest req){
		
		System.out.println("Remove 컨트롤러 시작");
		HttpSession session = req.getSession(false);
		
		String userCode = (String)session.getAttribute("myUserCode");
		String replyCode = req.getParameter("replyCode");
		System.out.println("삭제 유저 : "+userCode);
		//System.out.println("삭제 리플 코드: "+replyCode);
		
		HashMap map = new HashMap();
		map.put("replyCode", replyCode);
		map.put("userCode", userCode);
		System.out.println(replyCode);
		ArrayList<ReplyVo> reomoveReplyList = replyUpdateDao.updateReply(map);
		
		System.out.println("삭제 리스트: "+reomoveReplyList);
		req.setAttribute("mainUrl", root + "posting/tip/MainTip.jsp");
        return moveUrl;
	}
	/******************************Delete Reply End*********************************/
}
