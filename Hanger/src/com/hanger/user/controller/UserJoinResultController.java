package com.hanger.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserJoinDao;
import com.hanger.user.vo.UserVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class UserJoinResultController extends BaseController {
	private UserJoinDao userJoinDao;
	
	public void setUserJoinDao(UserJoinDao userJoinDao) {
		this.userJoinDao = userJoinDao;
	}

	@RequestMapping(value="/joinResult.hang", method=RequestMethod.POST)
	public ModelAndView memberJoinForm2(
			HttpServletRequest request
			) throws IOException {
		File dayFile = new File("F:\\hanger");
		if(!dayFile.exists())
		{
			dayFile.mkdirs();
		}
		String savePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		Enumeration formNames=mul.getFileNames();
		ArrayList uploadFileList = new ArrayList();
		String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
		String orgFileName=mul.getOriginalFileName(fileFormName); // 업로드된 파일의 이름 얻기
		String saveFileName=mul.getFilesystemName(fileFormName); // 업로드되어 저장된 파일의 이름 얻기
		if(saveFileName!=null && saveFileName.length()>0)
		{
		   Hashtable tempFileTable = new Hashtable();
		   tempFileTable.put("savePath", savePath);
		   tempFileTable.put("orgFileName", orgFileName);
		   tempFileTable.put("saveFileName", saveFileName);
		   uploadFileList.add(tempFileTable);
		}
		
		UserVo user = new UserVo();
		String userId = mul.getParameter("joinId");
		String name = mul.getParameter("name");
		String pw = mul.getParameter("pass1");
		String birth = mul.getParameter("year");
		String phone = mul.getParameter("mobile");
		String question = mul.getParameter("question");
		String answer = mul.getParameter("answer");
		String gender = mul.getParameter("gender");
		String postCode1 = mul.getParameter("zipCode1");
		String postCode2 = mul.getParameter("zipCode2");
		String addr1 = mul.getParameter("addr1");
		String addr2 = mul.getParameter("addr2");
		String ip = request.getRemoteAddr();
		
		System.out.println("name  :  " + name);
		
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
		
		userJoinDao.insertUser(user);
		
		System.out.println("memberJoinForm2 실행....");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(frame);
		mav.addObject("userId", userId);
		mav.addObject("name", pw);
		mav.addObject("uploadFileList", uploadFileList);
		
		return mav;
	}
}