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
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		/***************************Select & Page Move Start ***********************/
		System.out.println("Tip 화면 실행....");
		
		System.out.println("Select 실행....");
		//String postingCode = (String)req.getParameter("postingCode");
		String postingCode = "posodes";
	
		System.out.println("postingCode : " + postingCode);
	
		
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("postingCode", postingCode);
    	
    //	ArrayList<ReplyVo> tipReplyList = replySelectDao.selectReply(map);
    	System.out.println("리플 맵 : "+map);
    	
    //	req.setAttribute("replyInsertList", tipReplyList);
    //	System.out.println("리플 리스트 : "+tipReplyList);
   
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
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		moveUrl = "reply/replyInsert";
		System.out.println("Insert 시작");
		
		ReplyVo reply = new ReplyVo();
		//log("리플라이");
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
    	//셀렉트 하는곳
    	System.out.println("포스팅코드:"+postingCode);
    	System.out.println("리플내용:"+replyContent);
    	System.out.println("유저아이디:"+userId);
    	System.out.println("유저코드:"+userCode);
    	System.out.println("Reply 실행....");
    //	System.out.println("리플 Insert:"+replyList);
    	
    	//STEP 같은 기능으로 페이지 구분 하기!
		
    //	req.setAttribute("replyListSet",replyList);
		
		//return "reply/replyInsert";
    	return moveUrl;
	}
	/***************************Insert End ***********************/
}
