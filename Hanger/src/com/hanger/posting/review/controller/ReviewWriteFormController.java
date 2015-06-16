package com.hanger.posting.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.dao.ReviewWriteDao;
import com.hanger.posting.review.vo.ReviewVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ReviewWriteFormController extends BaseController{
	private ReviewWriteDao reviewWriteDao;
	
	public void setReviewWriteDao(ReviewWriteDao reviewWriteDao) {
		this.reviewWriteDao = reviewWriteDao;
	}

	@RequestMapping(value="/reviewWriteResult.hang", method=RequestMethod.POST)
	public ModelAndView mainPage(HttpServletRequest request, HttpSession session) throws IOException {		
		
		System.out.println("reviewWriteResult.hang...");
		
		File dayFile = new File("C:\\Workspace\\hanger\\Hanger\\WebContent\\upfile\\posting\\review");
		if(!dayFile.exists())
		{
			dayFile.mkdirs();
		}
		String savePath = "upfile/posting/review";
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, "C:\\Workspace\\hanger\\Hanger\\WebContent\\upfile\\posting\\review", sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		ReviewVo review = new ReviewVo();
		
		String userCode = (String) session.getAttribute("myUserCode");
		String itemGroupCode = mul.getParameter("itemGroupCode");
		String reviewScore = mul.getParameter("reviewScore");
		String reviewTitle = mul.getParameter("reviewTitle");
		String reviewContent = "";
		String reviewMainPicPath = savePath;
		String reviewMainPicOrgName = mul.getOriginalFileName("reviewMainPic");
		String reviewMainPicSaveName = mul.getFilesystemName("reviewMainPic");
		int reviewMainPicSize = 0;
		
		String ip = request.getRemoteAddr();
		
		String[] temp = (mul.getParameter("content")).split("\"");
		//quot
		for(int i = 0; i < (temp.length - 2); i++){
			if((temp[i].length() >= 4) && (temp[i].substring(temp[i].length()-4).equals("src="))){
				temp[i+1] = savePath; //path
				reviewContent += temp[i] + "\"";
			}
			else if(temp[i].equals(" data-filename=")){		
				reviewContent += "/";
			} else if(temp[i].equals(savePath)){
				reviewContent += temp[i];
			} else {
				reviewContent += temp[i] + "\"";
			}
		}
		
		reviewContent += temp[temp.length-2] + "\"" + temp[temp.length-1];
		
		review.setUserCode(userCode);
		review.setItemGroupCode(itemGroupCode);
		review.setReviewScore(reviewScore);
		review.setReviewTitle(reviewTitle);
		review.setReviewContent(reviewContent);
		review.setReviewMainPicPath(reviewMainPicPath);
		review.setReviewMainPicOrgName(reviewMainPicOrgName);
		review.setReviewMainPicSaveName(reviewMainPicSaveName);
		review.setReviewMainPicSize(reviewMainPicSize);
		review.setRegId("admin");
		review.setRegIp(ip);
		review.setUpdId("admin");
		review.setUpdIp(ip);
		
//		Enumeration formNames = mul.getFileNames();
		
		String reviewCode = reviewWriteDao.insertReview(review);
		
		ModelAndView mav = new ModelAndView();
		moveUrl = "posting/review/reviewShow.hang?reviewCode=" + reviewCode;
		
		mav.setViewName(moveUrl);
		
		return mav;
	}
}
