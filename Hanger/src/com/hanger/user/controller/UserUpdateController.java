package com.hanger.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserUpdateDao;
import com.hanger.user.vo.UserVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class UserUpdateController extends BaseController {
	//
	private UserUpdateDao userUpdateDao;

	public void setUserUpdateDao(UserUpdateDao userUpdateDao) {
		this.userUpdateDao = userUpdateDao;
	}
	
	@RequestMapping(value="/updateUser.hang",method=RequestMethod.GET)
	public String userUpdateController(HttpServletRequest request)
	{
		HttpSession session = request.getSession(false);
		String userCode = (String)session.getAttribute("myUserCode");
		
		ArrayList<UserVo> userList = userUpdateDao.selectUserInfo(userCode);
		UserVo user = userList.get(0);
		
		request.setAttribute("user", user);
		request.setAttribute("mainUrl", root + "user/mypage/UserUpdate.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping(value="/updateUserResult.hang", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest request) throws IOException{
		//
		HttpSession session = request.getSession(false);

		String path = "C:\\workspace\\hanger\\Hanger\\WebContent\\upfile\\user\\profile";
	      File dayFile = new File(path);
	      if(!dayFile.exists())
	      {
	         dayFile.mkdirs();
	      }
	      String savePath = "\\upfile\\user\\profile";
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		Enumeration formNames=mul.getFileNames();
		String fileFormName=(String)formNames.nextElement(); // ���ε� �ϴ� ������ ���� ��� while �� ���
		
		String userPicOrgName = mul.getParameter("picOrgName");
		String userPicSaveName = mul.getParameter("picSaveName");
		
		if(mul.getOriginalFileName(fileFormName) != null){
			userPicOrgName = mul.getOriginalFileName(fileFormName); // ���ε�� ������ �̸� ���
		}
		if(mul.getFilesystemName(fileFormName) != null){
			userPicSaveName = mul.getFilesystemName(fileFormName); // ���ε�Ǿ� ����� ������ �̸� ���
		}
		
		String userPwd = mul.getParameter("pass1");	
		String userId = (String)session.getAttribute("myUserId");
		String userName = mul.getParameter("name");
		String userPhone = mul.getParameter("mobile");
		String uesrQusetion = mul.getParameter("question");
		String userAnswer = mul.getParameter("answer");
		String userAddr1 = mul.getParameter("addr1");
		String userAddr2 = mul.getParameter("addr2");
		String userGender = mul.getParameter("gender");
		String userPostCode1 = mul.getParameter("zipCode1");
		String userPostCode2 = mul.getParameter("zipCode2");
		String userSkinType = mul.getParameter("skinType");
		String userSkinTone = mul.getParameter("skinTone");
		String birth = mul.getParameter("year");
		String month = mul.getParameter("month");
		String day = mul.getParameter("day");
		String[] userSkinProblems = mul.getParameterValues("skinProblem");
		String updIp = request.getRemoteAddr();
		
		String userSkinProblem = null;
		if(userSkinProblems != null){
			userSkinProblem = userSkinProblems[0];
			for(int i = 1; i < userSkinProblems.length; i++){
				userSkinProblem += "^" + userSkinProblems[i];
			}
		}
		//DB User_Birth�� ��������� �Ѱ��� ���Ƴֱ����� ��
		birth = birth+month+ day;
		
		UserVo user = new UserVo();
		
		user.setUserId(userId);
		user.setUserPwd(userPwd);
		user.setUserName(userName);
		user.setUserPhone(userPhone);
		user.setUserQuestion(uesrQusetion);
		user.setUserAnswer(userAnswer);
		user.setUserAddr1(userAddr1);
		user.setUserAddr2(userAddr2);
		user.setUserPostCode1(userPostCode1);
		user.setUserPostCode2(userPostCode2);
		user.setUserSkinProblem(userSkinProblem);
		user.setUserGender(userGender);
		user.setUserBirth(birth);
		user.setUserSkinTone(userSkinTone);
		user.setUserSkinType(userSkinType);
		user.setUpdId(userId);
		user.setUpdIp(updIp);
		user.setUserPicOrgName(userPicOrgName);
		user.setUserPicPath(savePath);
		user.setUserPicSaveName(userPicSaveName);
		
		int resultInt = userUpdateDao.update(user);
		
		String message = "";
		if(resultInt > 0){
			message = "�����Ϸ� �Ǿ����ϴ�.";
		} else {
			message = "�������� �ϼ̽��ϴ�.";
		}
		request.setAttribute("message", message);
		request.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
