package com.hanger.user.controller;

import java.io.File;
import java.io.IOException;
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
	
	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(
			HttpServletRequest request
			) throws IOException{
		//
		log("updateUser 컨트롤러");
		
		HttpSession session = request.getSession(false);
		File dayFile = new File("F:\\hanger");
		if(!dayFile.exists())
		{
			dayFile.mkdirs();
		}
		String savePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		Enumeration formNames=mul.getFileNames();
		String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
		String userPicOrgName=mul.getOriginalFileName(fileFormName); // 업로드된 파일의 이름 얻기
		String userPicSaveName=mul.getFilesystemName(fileFormName); // 업로드되어 저장된 파일의 이름 얻기
		
		String userPwd = mul.getParameter("pass");
		String userName = mul.getParameter("name");
		String userPhone = mul.getParameter("phone");
		String uesrQusetion = mul.getParameter("question");
		String userAnswer = mul.getParameter("answer");
		String userAddr1 = mul.getParameter("addr1");
		String userAddr2 = mul.getParameter("addr2");
		String userPostCode1 = mul.getParameter("postCode1");
		String userPostCode2 = mul.getParameter("postCode2");
		String userSkinType = mul.getParameter("postCode2");
		String userSkinTone = mul.getParameter("postCode2");
		String[] userSkinProblems = mul.getParameterValues("postCode2");
		String updId = (String)session.getAttribute("userId");
		String updIp = request.getRemoteAddr();
		
		String userSkinProblem = null;
		if(userSkinProblems != null){
			userSkinProblem = userSkinProblems[0];
			for(int i = 1; i < userSkinProblems.length; i++){
				userSkinProblem += "^" + userSkinProblems[i];
			}
		}
		
		UserVo user = new UserVo();
		
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
		user.setUserSkinTone(userSkinTone);
		user.setUserSkinType(userSkinType);
		user.setUpdId(updId);
		user.setUpdIp(updIp);
		user.setUserPicOrgName(userPicOrgName);
		user.setUserPicPath(savePath);
		user.setUserPicSaveName(userPicSaveName);
		
		int resultInt = userUpdateDao.update(user);
		
		String message = "";
		if(resultInt > 0){
			message = "수정완료 되었습니다.";
		} else {
			message = "수정실패 하셨습니다.";
		}
		request.setAttribute("message", message);
		request.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
