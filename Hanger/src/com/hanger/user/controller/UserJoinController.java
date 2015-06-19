package com.hanger.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationInsertDao;
import com.hanger.user.dao.UserJoinDao;
import com.hanger.user.dao.UserLoginDao;
import com.hanger.user.vo.UserVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class UserJoinController extends BaseController {
	//
	private UserJoinDao userJoinDao;
	private UserLoginDao userLoginDao;
	private RelationInsertDao relationInsertDao;
	
	public void setUserLoginDao(UserLoginDao userLoginDao) {
		this.userLoginDao = userLoginDao;
	}
	public void setRelationInsertDao(RelationInsertDao relationInsertDao) {
		this.relationInsertDao = relationInsertDao;
	}
	public void setUserJoinDao(UserJoinDao userJoinDao) {
		this.userJoinDao = userJoinDao;
	}
	
	@RequestMapping(value="/join.hang", method=RequestMethod.GET)
	protected String memberJoin(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		
		if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")) {
			req.setAttribute("mainUrl", mainUrl);
			req.setAttribute("message", "이미 로그인된 상태입니다.");
		} else {
			moveUrl = "user/Join";
		}
		
		System.out.println("MemberJoin...");
		return moveUrl;
	}

	@RequestMapping(value="/joinResult.hang", method=RequestMethod.POST)
	public String memberJoinForm2(
			HttpServletRequest req
			) throws IOException {
		//
		String path = "C:/workspace/hanger/Hanger/WebContent/upfile/user/profile";
	      File dayFile = new File(path);
	      if(!dayFile.exists())
	      {
	         dayFile.mkdirs();
	      }
	      String savePath = "/upfile/user/profile";
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(req, path, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		Enumeration formNames=mul.getFileNames();
		String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
		String orgFileName=mul.getOriginalFileName(fileFormName); // 업로드된 파일의 이름 얻기
		String saveFileName=mul.getFilesystemName(fileFormName); // 업로드되어 저장된 파일의 이름 얻기

		if(savePath == null){
			savePath = "F:\\hanger";
		}
		if(orgFileName == null){
			orgFileName = "default.jpg";
		}
		if(saveFileName == null){
			saveFileName = "default.jpg";
		}
		
		UserVo user = new UserVo();
		String userId = mul.getParameter("joinId");
		String name = mul.getParameter("name");
		String pw = mul.getParameter("pass1");
		String year = mul.getParameter("year");
		String month = mul.getParameter("month");
		String day = mul.getParameter("day");
		String phone = mul.getParameter("mobile");
		String question = mul.getParameter("question");
		String answer = mul.getParameter("answer");
		String gender = mul.getParameter("gender");
		String postCode1 = mul.getParameter("zipCode1");
		String postCode2 = mul.getParameter("zipCode2");
		String addr1 = mul.getParameter("addr1");
		String addr2 = mul.getParameter("addr2");
		String ip = req.getRemoteAddr();
		String [] skinProblems = mul.getParameterValues("skinProblem");
		String skinTone = mul.getParameter("skinTone");
		String skinType = mul.getParameter("skinType");
		
		String skinProblem = null;
		if(skinProblems != null){
			skinProblem = skinProblems[0];
			for(int i = 1; i < skinProblems.length; i++){
				skinProblem += "^" + skinProblems[i];
			}
		}
		String birth = "";
		birth = year + month + day;
		
		user.setUserId(userId);
		user.setUserName(name);
		user.setUserPwd(pw);
		user.setUserBirth(birth);
		user.setUserPhone(phone);
		user.setUserQuestion(question);
		user.setUserAnswer(answer);
		user.setUserGender(gender);
		user.setUserPostCode1(postCode1);
		user.setUserPostCode2(postCode2);
		user.setUserAddr1(addr1);
		user.setUserAddr2(addr2);
		user.setUserPicPath(savePath);
		user.setUserPicOrgName(orgFileName);
		user.setUserPicSaveName(saveFileName);
		user.setRegId(userId);
		user.setRegIp(ip);
		user.setUpdId(userId);
		user.setUpdIp(ip);
		user.setUserSkinProblem(skinProblem);
		user.setUserSkinTone(skinTone);
		user.setUserSkinType(skinType);
		
		userJoinDao.insertUser(user);
		
		ArrayList<UserVo> uservoList = (ArrayList<UserVo>)userLoginDao.loginUser(user);
		UserVo uservo = uservoList.get(0);
		String userCode = uservo.getUserCode();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", userCode);
		map.put("userCode", userCode);
		map.put("myUserId", userId);
		map.put("ip", ip);
		relationInsertDao.insertRelation(map);
		
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}