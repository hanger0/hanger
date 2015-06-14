package com.hanger.posting.tip.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.reply.dao.ReplyInsertDao;
import com.hanger.reply.dao.ReplySelectDao;
import com.hanger.reply.vo.ReplyVo;

@Controller
public class DetailTipController extends BaseController {
	//
	private ReplyInsertDao replyInsertDao;
	private ReplySelectDao replySelectDao;
	
	public void setReplyInsertDao(ReplyInsertDao replyInsertDao) {
		this.replyInsertDao = replyInsertDao;
	
	}
	public void setReplySelectDao(ReplySelectDao replySelectDao) {
		this.replySelectDao = replySelectDao;
	}
	
	@RequestMapping("/detailTip.hang")
	public String review(HttpServletRequest req){
		
		/***************************Select & Page Move Start ***********************/
		System.out.println("Tip ȭ�� ����....");
    	
		System.out.println("Select ����....");
    
    	HashMap map = new HashMap();
    	map.put("postingCodeList", "posodes");
    	
		
    	ArrayList<ReplyVo> replyList = replySelectDao.selectReply(map);
    	
    	req.setAttribute("replyList", replyList);
    	System.out.println("���� ����Ʈ : "+replyList.size());
   
		//req.setAttribute("mainUrl", root + "common/Frame");
    	req.setAttribute("mainUrl", root + "posting/tip/MainTip.jsp");
        return moveUrl;
		
	
	}
	/***************************Select & Page Move End ***********************/
	
	/***************************Insert Start ***********************/
	@RequestMapping(value="/replyInsert.hang", method=RequestMethod.POST)
	public String insertReply(HttpServletRequest req){
		//
		
		moveUrl = "reply/replyInsert";
		System.out.println("Insert ����");
		HttpSession session = req.getSession(false);
		
		ReplyVo reply = new ReplyVo();
		//log("���ö���");
		String userId = (String)session.getAttribute("myUserId");
		String userCode = (String)session.getAttribute("myUserCode");
		String userName = (String)session.getAttribute("myUserName");
    	String postingCode = req.getParameter("postingCode");
    	String replyContent = req.getParameter("replyContent");
    	String ip = req.getRemoteAddr();
		
    	
    	reply.setUserCode(userCode);
    	reply.setPostingCode(postingCode);
    	reply.setReplyContent(replyContent);
    	reply.setRegId(userId);
    	reply.setRegIp(ip);
    	reply.setUpdId(userId);
    	reply.setUpdIp(ip);
    	reply.setUserName(userName);
    		
    	replyInsertDao.insertReply(reply);
    	
    	HashMap map = new HashMap();
    	map.put("postingCodeList", "posodes");
    	
    	ArrayList<ReplyVo> replyInsertList = replySelectDao.selectReply(map);
    	//����Ʈ �ϴ°�
    	System.out.println("�������ڵ�:"+postingCode);
    	System.out.println("���ó���:"+replyContent);
    	System.out.println("�������̵�:"+userId);
    	System.out.println("�����ڵ�:"+userCode);
    	System.out.println("Reply ����....");
    	System.out.println("���� Insert:"+replyInsertList);
    	
    	//STEP ���� ������� ������ ���� �ϱ�!
		
    	req.setAttribute("replyListSet",replyInsertList);
		
		//return "reply/replyInsert";
    	return moveUrl;
	}
	/***************************Insert End ***********************/
}
