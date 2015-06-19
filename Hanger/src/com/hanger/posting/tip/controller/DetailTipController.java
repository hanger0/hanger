package com.hanger.posting.tip.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.reply.vo.ReplyVo;

@Controller
public class DetailTipController extends BaseController {
	//
	@RequestMapping("/detailTip.hang")
	public String review(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "�α��� �� �̿��� �ּ���.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		/***************************Select & Page Move Start ***********************/
		System.out.println("Tip ȭ�� ����....");
		
		System.out.println("Select ����....");
		//String postingCode = (String)req.getParameter("postingCode");
		String postingCode = "posodes";
	
		System.out.println("postingCode : " + postingCode);
	
		
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("postingCode", postingCode);
    	
    //	ArrayList<ReplyVo> tipReplyList = replySelectDao.selectReply(map);
    	System.out.println("���� �� : "+map);
    	
    //	req.setAttribute("replyInsertList", tipReplyList);
    //	System.out.println("���� ����Ʈ : "+tipReplyList);
   
		//req.setAttribute("mainUrl", root + "common/Frame");
    	req.setAttribute("mainUrl", root + "posting/tip/MainTip.jsp");
        return moveUrl;
		
	
	}
	/***************************Select & Page Move End ***********************/
	
	/***************************Insert Start ***********************/
	@RequestMapping(value="/replyInsert.hang", method=RequestMethod.POST)
	public String insertReply(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "�α��� �� �̿��� �ּ���.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		moveUrl = "reply/replyInsert";
		System.out.println("Insert ����");
		
		ReplyVo reply = new ReplyVo();
		//log("���ö���");
		String userId = (String)session.getAttribute("myUserId");
		String userCode = (String)session.getAttribute("myUserCode");
		String userName = (String)session.getAttribute("myUserName");
		//String postingCode = (String)req.getParameter("postingCode");
		String postingCode = "posodes";
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
    		
    //	replyInsertDao.insertReply(reply);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("postingCode", postingCode);
    	
		
    //	ArrayList<ReplyVo> replyList = replySelectDao.selectReply(map);
    	//����Ʈ �ϴ°�
    	System.out.println("�������ڵ�:"+postingCode);
    	System.out.println("���ó���:"+replyContent);
    	System.out.println("�������̵�:"+userId);
    	System.out.println("�����ڵ�:"+userCode);
    	System.out.println("Reply ����....");
    //	System.out.println("���� Insert:"+replyList);
    	
    	//STEP ���� ������� ������ ���� �ϱ�!
		
    //	req.setAttribute("replyListSet",replyList);
		
		//return "reply/replyInsert";
    	return moveUrl;
	}
	/***************************Insert End ***********************/
}
